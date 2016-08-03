@testable import TRX
import Quick
import Nimble

class Morphable_CGSizeSpec: QuickSpec{
  
  override func spec() {
    
    var subject: Tween<CGSize>!
    var currentSize: CGSize?
    let startingSize = CGSize(width: 1, height: 2)
    let finalSize = CGSize(width: 2, height: 4)
    
    beforeEach {
      subject = Tween(from: startingSize,
        to: finalSize,
        time: 1,
        ease: Ease.linear,
        update: {
          currentSize = $0
      })
    }
    
    describe("CGSize") {
      
      context("beginning") {
        
        beforeEach() {
          subject.seek(0)
        }
        
        it("should have correct value") {
          expect(currentSize) == startingSize
        }
        
      }
      
      context("end") {
        
        beforeEach() {
          subject.seek(1)
        }
        
        it("should have correct value") {
          expect(currentSize) == finalSize
        }
        
      }
      
      context("between") {
        
        beforeEach() {
          subject.seek(0.5)
        }
        
        it("should have correct value") {
          expect(currentSize) == CGSize(width: 1.5, height: 3)
        }
        
      }
      
    }
    
  }
  
}
