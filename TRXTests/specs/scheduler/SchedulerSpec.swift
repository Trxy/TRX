@testable import TRX
import Quick
import Nimble

class SchedulerSpec: QuickSpec {
  
  override func spec() {
    
    var subject: Scheduler!
    var displayLink: CADisplayLink!
    
    beforeEach { 
      subject = Scheduler()
      displayLink = subject.displayLink
    }
    
    describe("subscirptions") {
      
      var mockSubscriber: MockSubscriber!
      
      beforeEach() {
        mockSubscriber = MockSubscriber()
      }
      
      afterEach() {
        displayLink.isPaused = true
      }
      
      describe("when subscribtion added") {
        
        beforeEach() {
          subject.subscribe(mockSubscriber)
        }
        
        it("starts the display link") {
          expect(displayLink.isPaused) == false
        }
        
      }
      
      describe("when no subscriptions") {
        
        beforeEach() {
          subject.subscribe(mockSubscriber)
          subject.unsubscribe(mockSubscriber)
        }
        
        it("pauses the display link") {
          expect(displayLink.isPaused) == true
        }
        
      }
      
    }
    
    describe("overwrite") {
      
      var mockSubscriberA: MockTweenable!
      var mockSubscriberB: MockTweenable!
      var mockSubscriberC: MockTweenable!
      
      beforeEach() {
        mockSubscriberA = MockTweenable()
        mockSubscriberB = MockTweenable()
        mockSubscriberC = MockTweenable()
        mockSubscriberA.keys = ["A", "A2"]
        mockSubscriberB.keys = ["A", "B"]
        mockSubscriberC.keys = ["C"]
      }
      
      describe("when previous subscriber with same key is running") {
        
        beforeEach() {
          mockSubscriberA.paused = false
          mockSubscriberB.paused = false
          subject.subscribe(mockSubscriberA)
          subject.subscribe(mockSubscriberB)
        }
        
        it("pauses previous subscriber") {
          expect(mockSubscriberA.paused) == true
          expect(mockSubscriberB.paused) == false
        }
      }
      
      describe("when only subscribers with different keys") {
        
        beforeEach() {
          mockSubscriberA.paused = false
          mockSubscriberB.paused = false
          subject.subscribe(mockSubscriberA)
          subject.subscribe(mockSubscriberC)
        }
        
        it("doesn't pause previous subscriber") {
          expect(mockSubscriberA.paused) == false
          expect(mockSubscriberB.paused) == false
        }
      }
      
    }
    
  }
  
}
