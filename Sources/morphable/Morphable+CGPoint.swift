import CoreGraphics

/**
 
 Adds Morphable conformance to CGPoint
 
 */
extension CGPoint: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(_ from: CGPoint,
                           to: CGPoint,
                           ratio: Double) -> CGPoint {
    return CGPoint(x: morpher.tween(from.x, to: to.x, ratio: ratio),
                   y: morpher.tween(from.y, to: to.y, ratio: ratio))
  }
  
  
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return Double(morpher.precision) }
}
