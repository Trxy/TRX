@testable import TRX

class MockTweenable: MockSubscriber, Tweenable, Updatable {
 
  fileprivate var _duration: TimeInterval?
  
  var duration: TimeInterval {
    get {
      return (_duration ?? 0) * scale
    }
    set {
      if let duration = _duration , duration > 0 {
        scale = newValue / duration
      } else {
        _duration = newValue
      }
    }
  }
  
  func update() {
    updateCalled += 1
  }
  
  override init() {
    super.init()
    onStart = {
      self.onStartCalled += 1
    }
    onComplete = { _ in
      self.onCompleteCalled += 1
    }
  }
  
  fileprivate(set) var onStartCalled = 0
  fileprivate(set) var onCompleteCalled = 0
  fileprivate(set) var updateCalled = 0
  
  var scale: Double = 1
  var head: TimeInterval = 0
  var paused: Bool = true
  var onStart: StartClosure?
  var onComplete: CompletionClosure?
  func start() {}
  func stop() {}
  func seek(_ delta: TimeInterval) {
    head = delta
  }
}
