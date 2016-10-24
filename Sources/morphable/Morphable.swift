/**
 
 Make a value conform to this protocol
 to enable Tweening
 
 */
public protocol Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  static func morph(from: Self, to: Self, ratio: Double) -> Self
  
  /// Initial ratio value (usually 0.0 or self if Double convertible)
  var initialValue: Double { get }
  
  /// Final ratio value (usually 1.0 or self if Double convertible)
  var finalValue: Double { get }
}
