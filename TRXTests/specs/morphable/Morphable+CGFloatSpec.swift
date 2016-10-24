import Quick
import Nimble
import TRX

class Morphable_CGFloat: QuickSpec {
  
  override func spec() {
    
    var subject: Tween<CGFloat>!
    var current: CGFloat?
    let start = CGFloat(1)
    let finalValue = CGFloat(2)
    
    beforeEach {
      subject = Tween(from: start,
        to: finalValue,
        time: 1,
        ease: Ease.linear,
        update: {
          current = $0
      })
    }
    
    describe("CGFloat") {
      
      context("beginning") {
        
        beforeEach() {
          subject.seek(offset: 0)
        }
        
        it("should have correct value") {
          expect(current) == start
        }
        
      }
      
      context("end") {
        
        beforeEach() {
          subject.seek(offset: 1)
        }
        
        it("should have correct value") {
          expect(current) == finalValue
        }
        
      }
      
      context("between") {
        
        beforeEach() {
          subject.seek(offset: 0.5)
        }
        
        it("should have correct value") {
          expect(current) == 1.5
        }
        
      }
      
    }
    
  }
  
}
