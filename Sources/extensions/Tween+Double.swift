public extension Double {
  public func trxTo(_ to: Double,
             time: TimeInterval = 0.3,
             delay: TimeInterval = 0,
             ease: @escaping Ease.TimingFunction = Ease.Quad.easeOut,
             key: String? = nil,
             onStart: StartClosure? = nil,
             onComplete: CompletionClosure? = nil,
             onUpdate: @escaping Tween<Double>.UpdateClosure
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
