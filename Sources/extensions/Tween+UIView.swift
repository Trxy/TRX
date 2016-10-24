#if os(iOS) || os(tvOS)
  import UIKit
  extension UIView {
    
    public func trxCenter(to: CGPoint,
                          time: TimeInterval = 0.3,
                          delay: TimeInterval = 0,
                          ease: @escaping Ease.TimingFunction = Ease.Quart.easeInOut,
                          onStart: StartClosure? = nil,
                          onComplete: CompletionClosure? = nil,
                          onUpdate: Tween<CGPoint>.UpdateClosure? = nil) {
      Tween(from: self.center,
            to: to,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(Unmanaged.passUnretained(self).toOpaque()).frame",
            onStart: nil, onComplete: onComplete, update: { position in
              self.center = position
              onUpdate?(position)
      }).start()
    }
    
    public func trxCenter(from: CGPoint,
                          time: TimeInterval = 0.3,
                          delay: TimeInterval = 0,
                          ease: @escaping Ease.TimingFunction = Ease.Quart.easeInOut,
                          onStart: StartClosure? = nil,
                          onComplete: CompletionClosure? = nil,
                          onUpdate: Tween<CGPoint>.UpdateClosure? = nil) {
      Tween(from: from,
            to: self.center,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(Unmanaged.passUnretained(self).toOpaque()).frame",
            onStart: nil, onComplete: onComplete, update: { position in
              self.center = position
              onUpdate?(position)
      }).start()
    }
    
    public func trxFrame(to: CGRect,
                         time: TimeInterval = 0.3,
                         delay: TimeInterval = 0,
                         ease: @escaping Ease.TimingFunction = Ease.Quart.easeInOut,
                         onStart: StartClosure? = nil,
                         onComplete: CompletionClosure? = nil,
                         onUpdate: Tween<CGRect>.UpdateClosure? = nil) {
      Tween(from: self.frame,
            to: to,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(Unmanaged.passUnretained(self).toOpaque()).frame",
            onStart: nil, onComplete: onComplete, update: { frame in
              self.frame = frame
              onUpdate?(frame)
      }).start()
    }
    
    public func trxFrame(from: CGRect,
                         time: TimeInterval = 0.3,
                         delay: TimeInterval = 0,
                         ease: @escaping Ease.TimingFunction = Ease.Quart.easeInOut,
                         onStart: StartClosure? = nil,
                         onComplete: CompletionClosure? = nil,
                         onUpdate: Tween<CGRect>.UpdateClosure? = nil) {
      Tween(from: from,
            to: self.frame,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(Unmanaged.passUnretained(self).toOpaque()).frame",
            onStart: nil, onComplete: onComplete, update: { frame in
              self.frame = frame
              onUpdate?(frame)
      }).start()
    }
  }
#endif
