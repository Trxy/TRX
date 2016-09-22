@testable import TRX
import Quick
import Nimble

class TweenableExamples: QuickConfiguration {
  
  static let key = "TweenableExamples"
  static let durationKey = "expectedDuration"
  static let factoryKey = "factory"
  
  override class func configure(_ configuration: Configuration) {
    sharedExamples(key) { (sharedContext: SharedExampleContext) in
      
      let factory = sharedContext()[factoryKey] as! TweenFactory
      let expectedDuration: TimeInterval = sharedContext()[durationKey] as! TimeInterval
      
      describe("tweenable") {
        
        var subject: TweenableType!
        
        beforeEach() {
          subject = factory.getInstance()
        }
        
        describe("duration") {
          
          it("has correct duration") {
            expect(subject.duration) ≈ NSNumber(value: expectedDuration)
          }
          
        }
        
        describe("time stretch") {
          
          let scale: Double = 2.5
          
          context("when duration changes") {
            
            beforeEach() {
              subject.duration = expectedDuration * scale
            }
            
            it("has correct duration") {
              expect(subject.duration) ≈ expectedDuration * scale
            }
            
            it("has correct scale") {
              expect(subject.scale) ≈ NSNumber(value: scale)
            }
            
          }
          
          context("when scale changes") {
            
            beforeEach() {
              subject.scale = scale
            }
            
            it("has correct duration") {
              expect(subject.duration) ≈ expectedDuration * scale
            }
            
            it("has correct scale") {
              expect(subject.scale) ≈ NSNumber(value: scale)
            }
            
          }
          
        }
        
        describe("seek") {
          
          it("adjusts head") {
            subject.seek(expectedDuration * 0.5)
            expect(subject.head) == expectedDuration * 0.5
          }
          
        }
        
        describe("lifecycle") {
          
          var scheduler: MockScheduler!
          var start: Bool?
          var done: Bool?
          
          beforeEach({
            scheduler = MockScheduler()
            subject = factory.getInstance()
            subject.scheduler = scheduler
            subject.onStart = {
              start = true
            }
            subject.onComplete = { finished in
              done = finished
            }
          })
          
          describe("when not running") {
            
            beforeEach() {
              subject.paused = true
            }
            
            context("seeking to beginning") {
              
              beforeEach() {
                subject.seek(subject.duration / 2)
                subject.seek(0)
              }
              
              it("shouldn't trigger callback") {
                expect(start).to(beNil())
              }
              
            }
            
            context("seeking to end") {
              
              beforeEach() {
                subject.seek(subject.duration / 2)
                subject.seek(subject.duration)
              }
              
              it("shouldn't trigger callback") {
                expect(done).to(beNil())
              }
              
            }
            
          }
          
          context("on start") {
            
            beforeEach() {
              subject.paused = false
            }
            
            it("subscribes to scheduler") {
              expect(scheduler.callCount("subscribe")) == 1
            }
            
            it("calls start") {
              expect(start) == true
            }
            
            it("has correct paused value") {
              expect(subject.paused) == false
            }
            
          }
          
          context("on end") {
            
            context("when stop called") {
              
              beforeEach() {
                subject.start()
                subject.paused = true
              }
              
              it("unsubscribes") {
                expect(scheduler.callCount("unsubscribe")) == 1
              }
              
              it("calls end") {
                expect(done) == false
              }
              
              it("should be paused") {
                expect(subject.paused) == true
              }
              
            }
            
            context("when tween ended") {
              
              beforeEach() {
                subject.start()
                subject.tick(1.0)
                subject.tick(expectedDuration + 1.0)
              }
              
              it("unsubscribes") {
                expect(scheduler.callCount("unsubscribe")) == 1
              }
              
              it("calls end closure") {
                expect(done) == true
              }
              
              it("should be paused") {
                expect(subject.paused) == true
              }
              
            }
            
          }
          
        }
        
      }
      
    }
    
  }
}
