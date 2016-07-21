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
        time: 2) { currentValue = $0 }
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
        subject.seek(0)
        expect(currentValue) == 1
      }
      
      it("should return correct value in between") {
        subject.seek(1)
        expect(currentValue) == 2.5
      }
      
      it("should return correct value on completion") {
        subject.seek(2)
        expect(currentValue) == 4.0
      }
      
    }
    
    describe("delay") {
      
      beforeEach {
        subject = Tween(from: 1,
          to: 4,
          time: 2,
          delay: 0.5) { currentValue = $0 }
      }
      
      context("duration") {
        
        it("should have correct duration") {
          expect(subject.duration) == 2.5
        }
        
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(0)
          expect(currentValue) == 1
        }
        
        it("should return correct value after delay") {
          subject.seek(0.5)
          expect(currentValue) == 1
        }
        
        it("should return correct value in between") {
          subject.seek(1.5)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on complition") {
          subject.seek(2.5)
          expect(currentValue) == 4.0
        }
        
      }
      
    }
    
    describe("reversed") {
      
      beforeEach() {
        subject = Tween(from: 1,
          to: 4,
          time: 2
        ) { currentValue = $0 }.reversed()
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(0)
          expect(currentValue) == 4
        }
        
        it("should return correct value in between") {
          subject.seek(1)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on completion") {
          subject.seek(2)
          expect(currentValue) == 1
        }
        
      }
    }
    
    describe("time stretch") {
      
      beforeEach() {
        subject = Tween(from: 1,
          to: 4,
          time: 2,
          delay: 1.0) { currentValue = $0 }
        subject.duration = 6.0
      }
      
      context("seek") {
        
        it("should return correct value on start") {
          subject.seek(0)
          expect(currentValue) == 1
        }
        
        it("should return correct value after delay") {
          subject.seek(2)
          expect(currentValue) == 1
        }
        
        it("should return correct value in between") {
          subject.seek(4)
          expect(currentValue) == 2.5
        }
        
        it("should return correct value on completion") {
          subject.seek(6)
          expect(currentValue) == 4.0
        }
        
      }
      
    }
    
  }

}
