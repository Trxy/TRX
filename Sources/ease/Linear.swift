import Foundation

public extension Ease {
  
  /**
   
   Linear Easing Function
   
   */
  public static let linear: TimingFunction = {
    t, b, c, d in
    c * t / d + b
  }
  
}