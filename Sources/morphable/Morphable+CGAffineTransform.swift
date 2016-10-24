import QuartzCore

/**
 
 Adds Morphable conformance to CGAffineTransform
 
 */
extension CGAffineTransform: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: CGAffineTransform,
                           to: CGAffineTransform,
                           ratio: Double) -> CGAffineTransform {
    return CGAffineTransform(a: morpher.tween(from: from.a, to: to.a, ratio: ratio),
                             b: morpher.tween(from: from.b, to: to.b, ratio: ratio),
                             c: morpher.tween(from: from.c, to: to.c, ratio: ratio),
                             d: morpher.tween(from: from.d, to: to.d, ratio: ratio),
                             tx: morpher.tween(from: from.tx, to: to.tx, ratio: ratio),
                             ty: morpher.tween(from: from.ty, to: to.ty, ratio: ratio))
  }
  
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return Double(morpher.precision) }
}
