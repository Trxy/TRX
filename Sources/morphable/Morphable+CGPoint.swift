import QuartzCore

extension CGPoint: Morphable {
  
  public static func morph(from: CGPoint,
                           to: CGPoint,
                           ratio: Double) -> CGPoint {
    return CGPoint(x: from.x + (to.x - from.x) * CGFloat(ratio),
                   y: from.y + (to.y - from.y) * CGFloat(ratio))
  }
  
  public var initialValue: Double { return 0 }
  public var finalValue: Double { return 1 }
}
