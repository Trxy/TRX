@testable import TRX

typealias TweenableType = protocol<Tweenable, Schedulable, Subscriber>

class TweenFactory {
  
  typealias FactoryClosure = () -> TweenableType
  private(set) var getInstance: FactoryClosure
  
  init(closure: FactoryClosure) {
    self.getInstance = closure
  }
  
}
