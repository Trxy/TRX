/**
 
 Expo Easing Functions
 
 */

import Foundation

public struct Expo {
  
  /// Ease in
  public static let easeIn: EaseFunction = {
    t, b, c, d in
    return c * pow(2, 10 * (t / d - 1)) + b
  }
  
  /// Ease out
  public static let easeOut: EaseFunction = {
    t, b, c, d in
    return c * (-pow(2, -10 * t / d) + 1) + b
  }
  
  /// Ease in out
  public static let easeInOut: EaseFunction = {
    t, b, c, d in
    var t = t / (d / 2);
    if t < 1 {
      return c / 2 * pow(2, 10 * (t - 1)) + b
    }
    t -= 1
    return c / 2 * (-pow(2, -10 * t) + 2) + b
  }
  
}
