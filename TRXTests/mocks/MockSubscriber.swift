@testable import TRX

class MockSubscriber: Subscriber {
  
  private var callCount: NSCountedSet = NSCountedSet()
  
  func callCount(name: String) -> Int {
    return callCount.countForObject(name)
  }
  
  var keys: Set<String> = []
  
  func tick(time: NSTimeInterval) {
    callCount.addObject(#function)
  }
  
}