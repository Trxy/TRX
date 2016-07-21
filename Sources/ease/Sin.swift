import Foundation

public struct Sin {
  
  public static let easeIn:EaseFunction = {
    t, b, c, d in
    return -c * cos(t / d * M_PI_2) + c + b
  }
  
  public static let easeOut:EaseFunction = {
    t, b, c, d in
    return c * sin(t / d * M_PI_2) + b
  }
  
  public static let easeInOut:EaseFunction = {
    t, b, c, d in
    return -c / 2 * (cos(M_PI * t / d) - 1) + b
  }
  
}