public struct Linear {
  
  public static let linear: EaseFunction = {
    t, b, c, d in
    c * t / d + b
  }
  
}
