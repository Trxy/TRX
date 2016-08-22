import CoreGraphics

/**
 
 Adds Morphable conformance to CGSize
 
 */
extension CGSize: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: CGSize,
                           to: CGSize,
                           ratio: Double) -> CGSize {
    return CGSize(width: morpher.tween(from.width, to: to.width, ratio: ratio),
                  height: morpher.tween(from.height, to: to.height, ratio: ratio))
  }
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return Double(morpher.precision) }
}
