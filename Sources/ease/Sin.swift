/**
 
 Sine Easing Functions
 
 */

import Foundation

public struct Sin {
  
  /// Ease in
  public static let easeIn: EaseFunction = {
    t, b, c, d in
    return -c * cos(t / d * M_PI_2) + c + b
  }
  
  /// Ease out
  public static let easeOut: EaseFunction = {
    t, b, c, d in
    return c * sin(t / d * M_PI_2) + b
  }
  
  /// Ease in out
  public static let easeInOut: EaseFunction = {
    t, b, c, d in
    return -c / 2 * (cos(M_PI * t / d) - 1) + b
  }
  
}