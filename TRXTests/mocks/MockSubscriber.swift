@testable import TRX

class MockSubscriber: Subscriber {
  
  fileprivate var callCount: NSCountedSet = NSCountedSet()
  
  func callCount(_ name: String) -> Int {
    return callCount.count(for: name)
  }
  
  var keys: Set<String> = []
  
  func tick(_ time: TimeInterval) {
    callCount.add(#function)
  }
  
}
