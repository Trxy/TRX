import Foundation

public extension Ease {
  
  /**
   
   Quad Easing Functions
   
   */
  
  public struct Quad {
    
    /// Ease in
    public static let easeIn: TimingFunction = {
      t, b, c, d in
      let t = t / d;
      return c * t * t + b
    }
    
    /// Ease out
    public static let easeOut: TimingFunction = {
      t, b, c, d in
      let t = t / d
      return -c * t * (t - 2) + b
    }
    
    /// Ease in out
    public static let easeInOut: TimingFunction = {
      t, b, c, d in
      var t = t / (d / 2)
      if t < 1 {
        return c / 2 * t * t + b
      }
      t = t - 1
      return -c / 2 * (t * (t - 2) - 1) + b
    }
    
  }
  
}