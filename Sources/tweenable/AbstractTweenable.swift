/**
 
 Tweenable base class
 
 */

import Foundation

public class AbstractTweenable: Subscriber, Schedulable {
  
  /// Start callback
  public var onStart: StartClosure?
  
  /// Completion callback
  public var onComplete: CompletionClosure?
  
  /// Animation Keys
  public var keys: Set<String> = []
  
  /// Current time offset (seconds)
  internal(set) public var head: NSTimeInterval = 0
  
  /// Pause or resume animation
  public var paused : Bool = true {
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
      onComplete?(done: head == duration)
  }
  
  func onInternalStart() {
    if !paused {
      onStart?()
    }
  }
  
  /// Duration (seconds)
  public var duration: NSTimeInterval = 0
  
  /**
   Move head to a specific time offset
   
   - Parameter delta: Time offset (seconds)
   */
  final public func seek(delta: NSTimeInterval) {
    head = min(max(delta, 0), duration)
  }
  
  var scheduler: Dispatcher = Scheduler.shared
  private var startTime: NSTimeInterval = 0
  
  /// Start the animation
  final public func start() {
    paused = false
  }
  
  /// Stop the animation
  final public func stop() {
    paused = true
  }
  
  final func tick(time: NSTimeInterval) {
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