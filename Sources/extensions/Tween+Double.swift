import Foundation

public extension Double {
  public func trxTo(to: Double,
             time: NSTimeInterval = 0.3,
             delay: NSTimeInterval = 0,
             ease: Ease.TimingFunction = Ease.Quad.easeOut,
             key: String? = nil,
             onStart: StartClosure? = nil,
             onComplete: CompletionClosure? = nil,
             onUpdate: Tween<Double>.UpdateClosure
    ) -> Tween<Double> {
    return Tween(from: self,
                 to: to,
                 time: time,
                 delay: delay,
                 ease: ease,
                 key: key,
                 onStart: onStart,
                 onComplete: onComplete,
                 update: onUpdate)
  }
}
