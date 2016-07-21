public struct Cubic {
  
  public static let easeIn:EaseFunction = {
    t, b, c, d in
    let t = t / d;
    return c * t * t * t + b
  }
  
  public static let easeOut:EaseFunction = {
    t, b, c, d in
    let t = t / d - 1
    return c * (t * t * t + 1) + b
  }
  
  public static let easeInOut:EaseFunction = {
    t, b, c, d in
    var t = t / (d / 2)
    if t < 1 {
      return c / 2 * t * t * t + b
    }
    t -= 2;
    return c / 2 * (t * t * t + 2) + b
  }
  
}