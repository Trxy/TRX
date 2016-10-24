/**
 
 Tweenable base class
 
 */
open class AbstractTweenable: Subscriber, Schedulable {
  
  /// Start callback
  open var onStart: StartClosure?
  
  /// Completion callback
  open var onComplete: CompletionClosure?
  
  /// Animation Keys
  open var keys: Set<String> = []
  
  /// Current time offset (seconds)
  internal(set) open var head: TimeInterval = 0
  
  /// Pause or resume animation
  open var paused : Bool = true {
    didSet {
      if paused != oldValue {
        pause()
      }
    }
  }
  
  private func pause() {
    if paused {
      scheduler.unsubscribe(self)
      startTime = 0
      onInternalComplete()
    } else {
      scheduler.subscribe(self)
      if head == 0 {
        onInternalStart()
      }
    }
  }
  
  func onInternalComplete() {
      onComplete?(head == duration)
  }
  
  func onInternalStart() {
    if !paused {
      onStart?()
    }
  }
  
  /// Duration (seconds)
  open var duration: TimeInterval = 0
  
  /**
   Move head to a specific time offset
   
   - Parameter delta: Time offset (seconds)
   */
  final public func seek(offset delta: TimeInterval) {
    head = min(max(delta, 0), duration)
  }
  
  var scheduler: Dispatcher = Scheduler.shared
  private var startTime: TimeInterval = 0
  
  /// Start the animation
  final public func start() {
    paused = false
  }
  
  /// Stop the animation
  final public func stop() {
    paused = true
  }
  
  final func tick(time: TimeInterval) {
    if startTime == 0 {
      startTime = time
    }
    let headTo = head + time - startTime
    if headTo >= duration {
      head = duration
      paused = true
    } else {
      head = headTo
      startTime = time
    }
  }
  
}
