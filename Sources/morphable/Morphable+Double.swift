/**
 
 Adds Morphable conformance to Double
 
 */
extension Double: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: Double,
                           to: Double,
                           ratio: Double) -> Double {
    return ratio
  }
  
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return self }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return self }
}
