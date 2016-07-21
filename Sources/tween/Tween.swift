import Foundation

protocol Updatable {
  func update()
}

final public class Tween<T: Morphable>: AbstractTweenable, Tweenable, Updatable {

  public typealias UpdateClosure = (value: T) -> ()
  
  //MARK: properties
  
  public let from: T
  public let to: T
  public let ease: EaseFunction
  private(set) public var time: NSTimeInterval
  private(set) public var delay: NSTimeInterval

  //MARK: callbacks
  
  public var onUpdate: UpdateClosure

  //MARK: initializer
  
  /**
   Creates a new Tween
   
   - Parameter from: Starting value (Morphable).
   - Parameter to: End value (Morphable).
   - Parameter time: Duration (seconds/NSTimeInterval).
   - Parameter delay: (optional) Time offset (seconds/NSTimeInterval). Defaults to 0.
   - Parameter ease: (optional) Timing function (EaseFunction). Defaults to Linear.linear.
   - Parameter key: (optional) Tween key (String). Any other running animation with the same key will be stopped. Defaults to nil.
   - Parameter onStart: (optional) Start callback. Defaults to nil.
   - Parameter onComplete: (optional) Completion callback. Defaults to nil.
   - Parameter update: Update callback
   */
  public required init(from: T,
                       to: T,
                       time: NSTimeInterval,
                       delay: NSTimeInterval = 0,
                       ease: EaseFunction = Linear.linear,
                       key: String? = nil,
                       onStart: StartClosure? = nil,
                       onComplete: CompletionClosure? = nil,
                       update: UpdateClosure) {
    self.from = from
    self.to = to
    self.time = time
    self.onUpdate = update
    self.delay = delay
    self.ease = ease
    super.init()
    self.keys = key.map { [$0] } ?? []
    self.onStart = onStart
    self.onComplete = onComplete
    self.update()
  }
  
  //MARK: lifecycle

  override public var head: NSTimeInterval {
    didSet {
      if oldValue != head {
        update()
      }
    }
  }
  
  func update() {
    let ratio = ease(
      t: max(0, head - delay),
      b: from.initialValue,
      c: span,
      d: duration - delay)
    onUpdate(value: T.morph(
      from,
      to: to,
      ratio: ratio))
  }
  
  //MARK: reverse
  
  /**
   Returns a reversed Tween
   */
  public func reversed() -> Tween {
    return Tween(from: to,
                 to: from,
                 time: time,
                 delay: delay,
                 ease: ease,
                 key: keys.first,
                 onStart: onStart,
                 onComplete: onComplete,
                 update: onUpdate)
  }
  
  //MARK: time
  
  override public var duration: NSTimeInterval {
    get {
      return time + delay
    }
    set {
      scale = newValue / duration
    }
  }
  
  public var scale: Double = 1.0 {
    didSet {
      time *= scale
      delay *= scale
    }
  }
  
  private var span: Double {
    return to.finalValue - from.initialValue
  }

}
