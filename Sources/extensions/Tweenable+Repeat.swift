public extension Tweenable {
  
  /**
   Returns a timeline with multiple repeated Tweenables
   
   - Parameter tweens: Array of Tweenables
   */
  public func repeatTimes(times: UInt) -> TimeLine {
    let timeLine = TimeLine()
    for _ in 0..<times {
      timeLine.add(self)
    }
    return timeLine
  }
}
