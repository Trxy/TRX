import Foundation

public protocol Morphable {
  static func morph(from: Self, to: Self, ratio: Double) -> Self
  var initialValue: Double { get }
  var finalValue: Double { get }
}
