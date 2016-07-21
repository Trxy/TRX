import Foundation

public class AbstractTweenable: Subscriber, Schedulable {
  
  public var onStart: StartClosure?
  public var onComplete: CompletionClosure?
  public var keys: Set<String> = []
  internal(set) public var head: NSTimeInterval = 0
  
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
  
  public var duration: NSTimeInterval = 0
  
  final public func seek(delta: NSTimeInterval) {
    head = min(max(delta, 0), duration)
  }
  
  var scheduler: Dispatcher = Scheduler.shared
  private var startTime: NSTimeInterval = 0
  
  final public func start() {
    paused = false
  }
  
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