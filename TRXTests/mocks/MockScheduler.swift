@testable import TRX

class MockScheduler: Dispatcher {
  
  private var callCount: NSCountedSet = NSCountedSet()
  
  func callCount(name: String) -> Int {
    return callCount.countForObject(name)
  }
  
  func subscribe(subscriber: Subscriber) {
    callCount.addObject(#function)
  }
  
  func unsubscribe(subscriber: Subscriber) {
    callCount.addObject(#function)
  }
  
  var timeStamp: NSTimeInterval = 0
  
}
