import Foundation

#if os(iOS) || os(tvOS)
  import UIKit
  extension UIView {
    
    func trxCenterTo(to: CGPoint,
                       time: NSTimeInterval = 0.3,
                       delay: NSTimeInterval = 0,
                       ease: Ease.TimingFunction = Ease.Quart.easeInOut,
                       onStart: StartClosure? = nil,
                       onComplete: CompletionClosure? = nil,
                       onUpdate: Tween<CGPoint>.UpdateClosure? = nil) {
      Tween(from: self.center,
            to: to,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(unsafeAddressOf(self)).frame",
            onStart: nil, onComplete: onComplete, update: { position in
              self.center = position
              onUpdate?(value: position)
      }).start()
    }
    
    func trxCenterFrom(from: CGPoint,
                         time: NSTimeInterval = 0.3,
                         delay: NSTimeInterval = 0,
                         ease: Ease.TimingFunction = Ease.Quart.easeInOut,
                         onStart: StartClosure? = nil,
                         onComplete: CompletionClosure? = nil,
                         onUpdate: Tween<CGPoint>.UpdateClosure? = nil) {
      Tween(from: from,
            to: self.center,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(unsafeAddressOf(self)).frame",
            onStart: nil, onComplete: onComplete, update: { position in
              self.center = position
              onUpdate?(value: position)
      }).start()
    }
    
    func trxFrameTo(to: CGRect,
                      time: NSTimeInterval = 0.3,
                      delay: NSTimeInterval = 0,
                      ease: Ease.TimingFunction = Ease.Quart.easeInOut,
                      onStart: StartClosure? = nil,
                      onComplete: CompletionClosure? = nil,
                      onUpdate: Tween<CGRect>.UpdateClosure? = nil) {
      Tween(from: self.frame,
            to: to,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(unsafeAddressOf(self)).frame",
            onStart: nil, onComplete: onComplete, update: { frame in
              self.frame = frame
              onUpdate?(value: frame)
      }).start()
    }
    
    func trxFrameFrom(from: CGRect,
                        time: NSTimeInterval = 0.3,
                        delay: NSTimeInterval = 0,
                        ease: Ease.TimingFunction = Ease.Quart.easeInOut,
                        onStart: StartClosure? = nil,
                        onComplete: CompletionClosure? = nil,
                        onUpdate: Tween<CGRect>.UpdateClosure? = nil) {
      Tween(from: from,
            to: self.frame,
            time: time,
            delay: delay,
            ease: ease,
            key: "\(unsafeAddressOf(self)).frame",
            onStart: nil, onComplete: onComplete, update: { frame in
              self.frame = frame
              onUpdate?(value: frame)
      }).start()
    }
  }
#endif