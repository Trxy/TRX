import Foundation

public struct Elastic {
  
  public static let easeIn:EaseFunction = {
    t, b, c, d in
    if t == 0 { return b }
    let t = t / d
    if t == 1 { return b + c }
    let p = d * 0.3
    let s = p / 4;
    return -(c * pow(2, 10 * (t - 1)) * sin((t * d - s) * (2 * M_PI) / p)) + b
  }
  
  public static let easeOut:EaseFunction = {
    t, b, c, d in
    if t == 0 { return b }
    let t = t / d
    if t == 1 { return b + c }
    let p = d * 0.3
    let s = p / 4;
    return c * pow(2, -10 * t) * sin((t * d - s) * (2 * M_PI) / p) + c + b
  }
  
  public static let easeInOut:EaseFunction = {
    t, b, c, d in
    if t == 0 { return b }
    let t = t / (d / 2)
    if t == 2 { return b + c }
    let p = d * 0.45
    let s = p / 4
    if t < 1 {
      return -0.5 * (c * pow(2, 10 * (t - 1)) * sin(((t - 1) * d - s) * (M_PI * 2) / p)) + b
    }
    return c * pow(2, -10 * (t - 1)) * sin(((t - 1) * d - s) * (M_PI * 2) / p) * 0.5 + c + b
  }
  
}
