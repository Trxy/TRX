import QuartzCore

/**
 
 Morphes between partial values
 
 */
public struct Morpher {
  let precision: CGFloat
  
  public func tween(from: CGFloat, to: CGFloat, ratio: Double) -> CGFloat {
    return from.distanceTo(to) * CGFloat(ratio) / precision + from
  }
  
}

let morpher = Morpher(precision: 1000)
