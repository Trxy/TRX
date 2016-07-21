import Foundation

extension Double: Morphable {
  
  public static func morph(from: Double,
                           to: Double,
                           ratio: Double) -> Double {
    return ratio
  }
  
  public var initialValue: Double { return self }
  public var finalValue: Double { return self }
}
