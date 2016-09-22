@testable import TRX

typealias TweenableType = Tweenable & Schedulable & Subscriber

class TweenFactory {
  
  typealias FactoryClosure = () -> TweenableType
  fileprivate(set) var getInstance: FactoryClosure
  
  init(closure: @escaping FactoryClosure) {
    self.getInstance = closure
  }
  
}
