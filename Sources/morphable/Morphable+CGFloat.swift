import QuartzCore

/**
 
 Adds Morphable conformance to CGFloat
 
 */
extension CGFloat: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: CGFloat,
                           to: CGFloat,
                           ratio: Double) -> CGFloat {
    return CGFloat(ratio)
  }
  
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return Double(self) }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return Double(self) }
}
