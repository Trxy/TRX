import Foundation

public extension Ease {
  
  /**
   
   Linear Easing Functions
   
   */
  
  public struct Linear {
    
    /// Linear
    public static let linear: EaseFunction = {
      t, b, c, d in
      c * t / d + b
    }
    
  }
  
}