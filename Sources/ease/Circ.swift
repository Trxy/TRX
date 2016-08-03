import Foundation

public extension Ease {
  
  /**
   
   Circ Easing Functions
   
   */
  
  public struct Circ {
    
    /// Ease in
    public static let easeIn: TimingFunction = {
      t, b, c, d in
      var t = t / d;
      return -c * (sqrt(1 - t * t) - 1) + b
    }
    
    /// Ease out
    public static let easeOut: TimingFunction = {
      t, b, c, d in
      var t = t / d;
      t -= 1
      return c * sqrt(1 - t * t) + b
    }
    
    /// Ease in out
    public static let easeInOut: TimingFunction = {
      t, b, c, d in
      var t = t / (d / 2);
      if t < 1 {
        return -c / 2 * (sqrt(1 - t * t) - 1) + b
      }
      t -= 2;
      return c / 2 * (sqrt(1 - t * t) + 1) + b
    }
    
  }
  
}