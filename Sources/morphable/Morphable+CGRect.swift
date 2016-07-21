import QuartzCore

extension CGRect: Morphable {
  
  public static func morph(from: CGRect,
                           to: CGRect,
                           ratio: Double) -> CGRect {
    return CGRect(origin: CGPoint.morph(from.origin, to: to.origin, ratio: ratio),
                  size: CGSize.morph(from.size, to: to.size, ratio: ratio))
  }
  
  public var initialValue: Double { return 0 }
  public var finalValue: Double { return 1 }
}
