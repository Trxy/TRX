/**
 
 Animates any numerical value
 
 */
final public class Tween<T: Morphable>: AbstractTweenable, Tweenable, Updatable {

  public typealias UpdateClosure = (_ value: T) -> ()
  
  //MARK: properties
  
  /// Starting value (Morphable)
  public let from: T
  
  /// End value (Morphable)
  public let to: T
  
  /// Timing function (TimingFunction)
  public let ease: Ease.TimingFunction
  
  /// Duration (seconds)
  fileprivate(set) public var time: TimeInterval
  
  /// Time offset (seconds)
  fileprivate(set) public var delay: TimeInterval

  //MARK: callbacks
  
  /// Update callback
  public var onUpdate: UpdateClosure

  //MARK: initializer
  
  /**
   Creates a new Tween
   
   - Parameter from: Starting value (Morphable).
   - Parameter to: End value (Morphable).
   - Parameter time: Duration (seconds).
   - Parameter delay: (optional) Time offset (seconds). Defaults to 0.
   - Parameter ease: (optional) Timing function (TimingFunction). Defaults to Linear.linear.
   - Parameter key: (optional) Tween key (String). Any other running animation with the same key will be stopped. Defaults to nil.
   - Parameter onStart: (optional) Start callback. Defaults to nil.
   - Parameter onComplete: (optional) Completion callback. Defaults to nil.
   - Parameter update: Update callback
   */
  public required init(from: T,
                       to: T,
                       time: TimeInterval,
                       delay: TimeInterval = 0,
                       ease: @escaping Ease.TimingFunction = Ease.Quad.easeOut,
                       key: String? = nil,
                       onStart: StartClosure? = nil,
                       onComplete: CompletionClosure? = nil,
                       update: @escaping UpdateClosure) {
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

  /// Current time offset (seconds)
  override public var head: TimeInterval {
    didSet {
      if oldValue != head {
        update()
      }
    }
  }
  
  func update() {
    let ratio = ease(
      max(0, head - delay),
      from.initialValue,
      span,
      duration - delay)
    let morphedValue = T.morph(
      from,
      to: to,
      ratio: ratio)
    onUpdate(head != duration ? morphedValue : to)
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
  
  /// Duration (seconds)
  override public var duration: TimeInterval {
    get {
      return time + delay
    }
    set {
      scale = newValue / duration
    }
  }
  
  /// Scale. Defaults to 1.0
  public var scale: Double = 1.0 {
    didSet {
      time *= scale
      delay *= scale
    }
  }
  
  fileprivate var span: Double {
    return to.finalValue - from.initialValue
  }

}
