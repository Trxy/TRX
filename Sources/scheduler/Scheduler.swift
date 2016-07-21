import QuartzCore

final public class Scheduler: Dispatcher {
  
  public static let shared = Scheduler()
  
  lazy var displayLink: CADisplayLink = {
    let link = CADisplayLink(target: self,
                             selector: #selector(Scheduler.update(_:)))
    link.paused = true
    link.addToRunLoop(NSRunLoop.currentRunLoop(),
                      forMode: NSRunLoopCommonModes)
    return link
  }()
  
  private var subscribers = Set<Proxy>()
  
  var timeStamp: NSTimeInterval {
    return displayLink.timestamp
  }
  
  private func runIfNeeded() {
    displayLink.paused = subscribers.count == 0
  }
  
  //MARK: subscription
  
  func subscribe(subscriber: Subscriber) {
    let subscription = Proxy(subscriber: subscriber)
    solveOverwrite(subscriber)
    subscribers.insert(subscription)
    runIfNeeded()
  }
  
  func unsubscribe(subscriber: Subscriber) {
    
    if let proxy = subscribers.filter({
      $0.subscriber === subscriber
    }).first {
       subscribers.remove(proxy)
    }
    runIfNeeded()
  }
  
  @objc private func update(link: CADisplayLink) {
    subscribers.forEach { proxy in
      proxy.tick(link.timestamp)
    }
  }
  
  //MARK: overwrite
  
  private func solveOverwrite(subscriber: Subscriber) {
    if subscriber.keys.count > 0 {
      pauseAll(subscribersWithKeys(subscriber.keys))
    }
  }
  
  private func subscribersWithKeys(keys: Set<String>) -> [Proxy] {
    
    let a = subscribers.filter { $0.keys.intersect(keys).count > 0 }
    return a
  }
  
  private func pauseAll(subscribers: [Proxy]) {
    subscribers.forEach { ($0.subscriber as? Tweenable)?.paused = true }
  }
  
}
