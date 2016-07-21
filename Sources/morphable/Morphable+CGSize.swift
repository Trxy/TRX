import QuartzCore

extension CGSize: Morphable {
  
  public static func morph(from: CGSize,
                           to: CGSize,
                           ratio: Double) -> CGSize {
    return CGSize(width: from.width + (to.width - from.width) * CGFloat(ratio),
                  height: from.height + (to.height - from.height) * CGFloat(ratio))
  }
  
  public var initialValue: Double { return 0 }
  public var finalValue: Double { return 1 }
}
