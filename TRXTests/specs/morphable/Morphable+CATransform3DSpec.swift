import QuartzCore

@testable import TRX
import Quick
import Nimble

class Morphable_CATransform3D: QuickSpec {
  
  override func spec() {
    
    var subject: Tween<CATransform3D>!
    var current: CATransform3D?
    let start = CATransform3DIdentity
    let finalValue = CATransform3DMakeTranslation(10, 20, 30)
    
    beforeEach {
      subject = Tween(from: start,
        to: finalValue,
        time: 1,
        ease: Ease.linear,
        update: {
          current = $0
      })
    }
    
    describe("CGAffineTransform") {
      
      context("beginning") {
        
        beforeEach() {
          subject.seek(0)
        }
        
        it("should have correct value") {
          expect(current?.m41) == start.m41
          expect(current?.m42) == start.m42
          expect(current?.m43) == start.m43
        }
        
      }
      
      context("end") {
        
        beforeEach() {
          subject.seek(1)
        }
        
        it("should have correct value") {
          expect(current?.m41) == finalValue.m41
          expect(current?.m42) == finalValue.m42
          expect(current?.m43) == finalValue.m43
        }
        
      }
      
      context("between") {
        
        beforeEach() {
          subject.seek(0.5)
        }
        
        it("should have correct value") {
          expect(current?.m41) == 5
          expect(current?.m42) == 10
          expect(current?.m43) == 15
        }
        
      }
      
    }
    
  }
  
}
