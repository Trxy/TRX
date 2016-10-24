@testable import TRX
import Quick
import Nimble

class Morphable_CGRectSpec: QuickSpec {
  
  override func spec() {
    
    var subject: Tween<CGRect>!
    var currentRect: CGRect?
    let startingRect = CGRect(x: 1, y: 2, width: 3, height: 4)
    let finalRect = CGRect(x: 2, y: 4, width: 6, height: 8)
    
    beforeEach {
      subject = Tween(from: startingRect,
        to: finalRect,
        time: 1,
        ease: Ease.linear,
        update: {
          currentRect = $0
      })
    }
    
    describe("CGRect") {
      
      context("beginning") {
        
        beforeEach() {
          subject.seek(offset: 0)
        }
        
        it("should have correct value") {
          expect(currentRect) == startingRect
        }
        
      }
      
      context("end") {
        
        beforeEach() {
          subject.seek(offset: 1)
        }
        
        it("should have correct value") {
          expect(currentRect) == finalRect
        }
        
      }
      
      context("between") {
        
        beforeEach() {
          subject.seek(offset: 0.5)
        }
        
        it("should have correct value") {
          expect(currentRect) == CGRect(x:1.5, y: 3, width: 4.5, height: 6)
        }
        
      }
      
    }
    
  }
  
}
