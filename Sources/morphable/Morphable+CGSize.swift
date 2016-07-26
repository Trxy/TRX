/**
 
 Adds Morphable conformance to CGSize
 
 */

import QuartzCore

extension CGSize: Morphable {
  
  /**
   
   Returns the value converted by ratio
   
   */
  public static func morph(from: CGSize,
                           to: CGSize,
                           ratio: Double) -> CGSize {
    return CGSize(width: from.width + (to.width - from.width) * CGFloat(ratio),
                  height: from.height + (to.height - from.height) * CGFloat(ratio))
  }
  
  /// Initial ratio value (usually 0.0 or self if Double convertible)
  public var initialValue: Double { return 0 }
  
  /// Final ratio value (usually 1.0 or self if Double convertible)
  public var finalValue: Double { return 1 }
}
