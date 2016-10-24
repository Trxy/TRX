@testable import TRX
import Quick
import Nimble

class Morphable_CGPointSpec: QuickSpec {
  
  override func spec() {
    
    var subject: Tween<CGPoint>!
    var currentPoint: CGPoint?
    let startingPoint = CGPoint(x: 1, y: 2)
    let finalPoint = CGPoint(x: 2, y: 4)
    
    beforeEach {
      subject = Tween(from: startingPoint,
        to: finalPoint,
        time: 1,
        ease: Ease.linear,
        update: {
          currentPoint = $0
      })
    }
    
    describe("CGPoint") {
      
      context("beginning") {
        
        beforeEach() {
          subject.seek(offset: 0)
        }
        
        it("should have correct value") {
          expect(currentPoint) == startingPoint
        }
        
      }
      
      context("end") {
        
        beforeEach() {
          subject.seek(offset: 1)
        }
        
        it("should have correct value") {
          expect(currentPoint) == finalPoint
        }
        
      }
      
      context("between") {
        
        beforeEach() {
          subject.seek(offset: 0.5)
        }
        
        it("should have correct value") {
          expect(currentPoint) == CGPoint(x: 1.5, y: 3)
        }
        
      }
      
    }
    
  }
}
