import Foundation

public struct Circ {
  
  public static let easeIn:EaseFunction = {
    t, b, c, d in
    var t = t / d;
    return -c * (sqrt(1 - t * t) - 1) + b
  }
  
  public static let easeOut:EaseFunction = {
    t, b, c, d in
    var t = t / d;
    t -= 1
    return c * sqrt(1 - t * t) + b
  }
  
  public static let easeInOut:EaseFunction = {
    t, b, c, d in
    var t = t / (d / 2);
    if t < 1 {
      return -c / 2 * (sqrt(1 - t * t) - 1) + b
    }
    t -= 2;
    return c / 2 * (sqrt(1 - t * t) + 1) + b
  }
  
}