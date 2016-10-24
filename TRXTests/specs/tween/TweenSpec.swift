@testable import TRX
import Quick
import Nimble

class TweenSpec: QuickSpec {
  
  override func spec() {
    
    var subject: Tween<Double>!
    var currentValue: Double!
    
    beforeEach {
      subject = Tween(from: 1,
        to: 4,
        time: 2,
        ease: Ease.linear) { currentValue = $0 }
    }
    
    describe("tweenable") {
      
      itBehavesLike(TweenableExamples.key) {
        [
          TweenableExamples.durationKey: 2.5,
          TweenableExamples.factoryKey: TweenFactory(closure: {
            return Tween(from: 1,
              to: 4,
              time: 2.5) { _ in }
          })
        ]
      }
      
    }
    
    describe("seek") {
      
      it("should return correct value on start") {
        subject.seek(offset: 0)
        expect(currentValue) == 1
      }
      
      it("should return correct value in between") {
        subject.seek(offset: 1)
        expect(currentValue) == 2.5
      }
      
      it("should return correct value on completion") {
        subject.seek(offset: 2)
        expect(currentValue) == 4.0
      }
      
    }
    
    describe("delay") {
      
      beforeEach {
        subject = Tween(from: 1,
          to: 4,
          time: 2,
          delay: 0.5,
          ease: Ease.linear) { currentValue = $0 }
      }
      
      context("duration") {
        
        it("should have correct duration") {
          expect(subject.duration) == 2.5
        }
        
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(offset: 0)
          expect(currentValue) == 1
        }
        
        it("should return correct value after delay") {
          subject.seek(offset: 0.5)
          expect(currentValue) == 1
        }
        
        it("should return correct value in between") {
          subject.seek(offset: 1.5)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on complition") {
          subject.seek(offset: 2.5)
          expect(currentValue) == 4.0
        }
        
      }
      
    }
    
    describe("reversed") {
      
      beforeEach() {
        subject = Tween(from: 1,
          to: 4,
          time: 2,
          ease: Ease.linear
        ) { currentValue = $0 }.reversed()
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(offset: 0)
          expect(currentValue) == 4
        }
        
        it("should return correct value in between") {
          subject.seek(offset: 1)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on completion") {
          subject.seek(offset: 2)
          expect(currentValue) == 1
        }
        
      }
    }
    
    describe("time stretch") {
      
      beforeEach() {
        subject = Tween(from: 1,
          to: 4,
          time: 2,
          delay: 1.0,
          ease: Ease.linear) { currentValue = $0 }
        subject.duration = 6.0
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(offset: 0)
          expect(currentValue) == 1
        }
        
        it("should return correct value after delay") {
          subject.seek(offset: 2)
          expect(currentValue) == 1
        }
        
        it("should return correct value in between") {
          subject.seek(offset: 4)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on completion") {
          subject.seek(offset: 6)
          expect(currentValue) == 4.0
        }
        
      }
      
    }
    
  }

}
