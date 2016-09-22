import QuartzCore

/**
 
 Dispatches time events to subscribers
 
 */
final public class Scheduler: Dispatcher {
  
  /// Shared singleton
  public static let shared = Scheduler()
  
  lazy var displayLink: CADisplayLink = {
    let link = CADisplayLink(target: self,
                             selector: #selector(Scheduler.update(_:)))
    link.isPaused = true
    link.add(to: RunLoop.current,
                      forMode: RunLoopMode.commonModes)
    return link
  }()
  
  fileprivate var subscribers = Set<Proxy>()
  
  var timeStamp: TimeInterval {
    return displayLink.timestamp
  }
  
  fileprivate func runIfNeeded() {
    displayLink.isPaused = subscribers.count == 0
  }
  
  //MARK: subscription
  
  func subscribe(_ subscriber: Subscriber) {
    let subscription = Proxy(subscriber: subscriber)
    solveOverwrite(subscriber)
    subscribers.insert(subscription)
    runIfNeeded()
  }
  
  func unsubscribe(_ subscriber: Subscriber) {
    
    if let proxy = subscribers.filter({
      $0.subscriber === subscriber
    }).first {
       subscribers.remove(proxy)
    }
    runIfNeeded()
  }
  
  @objc fileprivate func update(_ link: CADisplayLink) {
    subscribers.forEach { proxy in
      proxy.tick(link.timestamp)
    }
  }
  
  //MARK: overwrite
  
  fileprivate func solveOverwrite(_ subscriber: Subscriber) {
    if subscriber.keys.count > 0 {
      pauseAll(subscribersWithKeys(subscriber.keys))
    }
  }
  
  fileprivate func subscribersWithKeys(_ keys: Set<String>) -> [Proxy] {
    
    return subscribers.filter { $0.keys.intersection(keys).count > 0 }
  }
  
  fileprivate func pauseAll(_ subscribers: [Proxy]) {
    subscribers.forEach { ($0.subscriber as? Tweenable)?.paused = true }
  }
  
}
