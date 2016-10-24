import QuartzCore

/**
 
 Dispatches time events to subscribers
 
 */
final class Scheduler: Dispatcher {
  
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
  
  private var subscribers = Set<Proxy>()
  
  var timeStamp: TimeInterval {
    return displayLink.timestamp
  }
  
  private func runIfNeeded() {
    displayLink.isPaused = subscribers.count == 0
  }
  
  //MARK: subscription
  
  func subscribe(_ subscriber: Subscriber) {
    let subscription = Proxy(subscriber: subscriber)
    solveOverwrite(with: subscriber)
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
  
  @objc private func update(_ link: CADisplayLink) {
    subscribers.forEach { proxy in
      proxy.tick(time: link.timestamp)
    }
  }
  
  //MARK: overwrite
  
  private func solveOverwrite(with subscriber: Subscriber) {
    if subscriber.keys.count > 0 {
      pauseAll(subscribers: subscribers(keys: subscriber.keys))
    }
  }
  
  private func subscribers(keys: Set<String>) -> [Proxy] {
    
    return subscribers.filter { $0.keys.intersection(keys).count > 0 }
  }
  
  private func pauseAll(subscribers: [Proxy]) {
    subscribers.forEach { ($0.subscriber as? Tweenable)?.paused = true }
  }
  
}
