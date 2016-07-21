import Foundation

func ==(lhs: Scheduler.Proxy, rhs: Scheduler.Proxy) -> Bool {
  return lhs === rhs
}

extension Scheduler {
  
  class Proxy: Subscriber, Hashable {
    
    var subscriber: Subscriber
    
    init(subscriber: Subscriber) {
      self.subscriber = subscriber
    }
    
    var hashValue: Int {
      return unsafeAddressOf(subscriber).hashValue
    }
    
    var keys: Set<String> {
      return subscriber.keys
    }
    
    func tick(timeStamp: NSTimeInterval) {
      subscriber.tick(timeStamp)
    }
    
  }
  
}