import QuartzCore

/**
 
 Adds Morphable conformance to CGAffineTransform
 
 */
extension CATransform3D: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(_ from: CATransform3D,
                           to: CATransform3D,
                           ratio: Double) -> CATransform3D {
    return CATransform3D(m11: morpher.tween(from.m11, to: to.m11, ratio: ratio),
                         m12: morpher.tween(from.m12, to: to.m12, ratio: ratio),
                         m13: morpher.tween(from.m13, to: to.m13, ratio: ratio),
                         m14: morpher.tween(from.m14, to: to.m14, ratio: ratio),
                         m21: morpher.tween(from.m21, to: to.m21, ratio: ratio),
                         m22: morpher.tween(from.m22, to: to.m22, ratio: ratio),
                         m23: morpher.tween(from.m23, to: to.m23, ratio: ratio),
                         m24: morpher.tween(from.m24, to: to.m24, ratio: ratio),
                         m31: morpher.tween(from.m31, to: to.m31, ratio: ratio),
                         m32: morpher.tween(from.m32, to: to.m32, ratio: ratio),
                         m33: morpher.tween(from.m33, to: to.m33, ratio: ratio),
                         m34: morpher.tween(from.m34, to: to.m34, ratio: ratio),
                         m41: morpher.tween(from.m41, to: to.m41, ratio: ratio),
                         m42: morpher.tween(from.m42, to: to.m42, ratio: ratio),
                         m43: morpher.tween(from.m43, to: to.m43, ratio: ratio),
                         m44: morpher.tween(from.m44, to: to.m44, ratio: ratio))
  }
  
  /// Initial normalized value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final normalized value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return Double(morpher.precision) }
}
