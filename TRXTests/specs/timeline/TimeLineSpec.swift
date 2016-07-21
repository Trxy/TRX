@testable import TRX
import Quick
import Nimble

class TimeLineSpec: QuickSpec {
  
  override func spec() {
    
    var subject: TimeLine!
    var tweenA: MockTweenable!
    var tweenB: MockTweenable!
    var tweenC: MockTweenable!
    
    beforeEach({
      tweenA = MockTweenable()
      tweenA.duration = 1
      tweenB = MockTweenable()
      tweenB.duration = 2
      tweenC = MockTweenable()
      tweenC.duration = 3
      subject = TimeLine()
    })
    
    describe("tweenable") {
      
      let factory: TweenFactory.FactoryClosure = {
        let timeline = TimeLine()
        timeline.add(tweenA, shift: 0.1)
        timeline.add(tweenB, shift: 0.2)
        timeline.add(tweenC, shift: -0.6)
        return timeline
      }
      
      itBehavesLike(TweenableExamples.key) {
        [
          TweenableExamples.durationKey: 5.7,
          TweenableExamples.factoryKey: TweenFactory(closure: factory)
        ]
      }
    }
    
    describe("when initialized with tweens") {
      
      beforeEach() {
        subject = TimeLine(tweens: [tweenA, tweenB, tweenC])
      }
      
      it("updates first tween to initial position") {
        expect(tweenA.updateCalled) == 1
        expect(tweenA.head) == 0
        expect(tweenB.updateCalled) == 0
        expect(tweenC.updateCalled) == 0
      }
    }
    
    describe("collection") {
      
      describe("init", {
        
        beforeEach({ 
          subject = TimeLine(tweens: [tweenA, tweenB, tweenC])
        })
        
        it("should contain tweens") {
          expect(subject.tweens.count) == 3
        }
        
      })
      
      describe("when single tweens added") {
        
        beforeEach() {
          subject.add(tweenA)
          subject.add(tweenB)
          subject.add(tweenC)
        }
        
        it("should contain tweens") {
          expect(subject.tweens.count) == 3
        }
        
      }
      
      describe("when array of tweens added") {
        
        beforeEach() {
          subject.add([tweenA, tweenB, tweenC])
        }
        
        it("should contain tweens") {
          expect(subject.tweens.count) == 3
        }
        
      }
      
    }
    
    describe("callbacks") {
      
      var mockScheduler: Dispatcher!
      
      beforeEach() {
        
        mockScheduler = MockScheduler()
        subject.scheduler = mockScheduler
        subject.add([tweenA, tweenB])
        subject.start()
      }
      
      it("calls start A") {
        subject.tick(1)
        subject.tick(1.1)
        expect(tweenA.onStartCalled) == 1
      }
      
      it("calls completion A") {
        subject.tick(1)
        subject.tick(1.5)
        subject.tick(2.1)
        expect(tweenA.onCompleteCalled) == 1
      }
      
      it("calls Start B") {
        subject.tick(1)
        subject.tick(2.1)
        expect(tweenB.onStartCalled) == 1
      }
      
      it("calls completion B") {
        subject.tick(1)
        subject.tick(2.1)
        subject.tick(4.1)
        expect(tweenB.onCompleteCalled) == 1
      }
      
    }
    
    describe("seek") {
      
      context("shift") {
        
        beforeEach({
          subject.add(tweenA, shift: 0.1)
          subject.add(tweenB, shift: 0.2)
          subject.add(tweenC, shift: -1.5)
        })
        
        context("on start") {
          
          beforeEach() {
            subject.seek(0.1)
          }
          
          it("sets head A with correct value") {
            expect(tweenA.head) ≈ 0
          }
          
          it("sets head B with correct value") {
            expect(tweenB.head) ≈ 0
          }
          
          it("sets head C with correct value") {
            expect(tweenC.head) ≈ 0
          }
          
        }
        
        context("on B") {
          
          beforeEach() {
            subject.seek(1.3)
          }
          
          it("sets head A with correct value") {
            expect(tweenA.head) ≈ 1
          }
          
          it("sets head B with correct value") {
            expect(tweenB.head) ≈ 0
          }
          
          it("sets head C with correct value") {
            expect(tweenC.head) ≈ 0
          }
          
        }
        
        context("on C") {
          
          beforeEach() {
            subject.seek(3.3)
          }
          
          it("sets head A with correct value") {
            expect(tweenA.head) ≈ 1
          }
          
          it("sets head B with correct value") {
            expect(tweenB.head) ≈ 2
          }
          
          it("sets head C with correct value") {
            expect(tweenC.head) ≈ 1.5
          }
          
        }
        
        
        context("on end") {
          
          beforeEach() {
            subject.seek(4.8)
          }
          
          it("sets head A with correct value") {
            expect(tweenA.head) ≈ 1
          }
          
          it("sets head B with correct value") {
            expect(tweenB.head) ≈ 2
          }
          
          it("sets head C with correct value") {
            expect(tweenC.head) ≈ 3
          }
          
        }
        
      }
      
    }
    
  }
  
}
