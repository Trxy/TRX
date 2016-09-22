@testable import TRX

class MockScheduler: Dispatcher {
  
  fileprivate var callCount: NSCountedSet = NSCountedSet()
  
  func callCount(_ name: String) -> Int {
    return callCount.count(for: name)
  }
  
  func subscribe(_ subscriber: Subscriber) {
    callCount.add(#function)
  }
  
  func unsubscribe(_ subscriber: Subscriber) {
    callCount.add(#function)
  }
  
  var timeStamp: TimeInterval = 0
  
}
