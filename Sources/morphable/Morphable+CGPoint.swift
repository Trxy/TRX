/**
 
 Adds Morphable conformance to CGPoint
 
 */

import QuartzCore

extension CGPoint: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: CGPoint,
                           to: CGPoint,
                           ratio: Double) -> CGPoint {
    return CGPoint(x: from.x + (to.x - from.x) * CGFloat(ratio),
                   y: from.y + (to.y - from.y) * CGFloat(ratio))
  }
  
  /// Initial ratio value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final ratio value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return 1 }
}
