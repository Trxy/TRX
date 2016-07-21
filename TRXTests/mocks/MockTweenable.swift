@testable import TRX

class MockTweenable: MockSubscriber, Tweenable, Updatable {
 
  private var _duration: NSTimeInterval?
  
  var duration: NSTimeInterval {
    get {
      return (_duration ?? 0) * scale
    }
    set {
      if let duration = _duration where duration > 0 {
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
  
  private(set) var onStartCalled = 0
  private(set) var onCompleteCalled = 0
  private(set) var updateCalled = 0
  
  var scale: Double = 1
  var head: NSTimeInterval = 0
  var paused: Bool = true
  var onStart: StartClosure?
  var onComplete: CompletionClosure?
  func start() {}
  func stop() {}
  func seek(delta: NSTimeInterval) {
    head = delta
  }
}
