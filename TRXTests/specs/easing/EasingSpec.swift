@testable import TRX
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

class EasingSpec: QuickSpec {
  
  override func spec() {
    
    describe("Linear") {
      
      it("has valid graph") {
        expect(EasingTestView(easing: Ease.Linear.linear)).to(haveValidSnapshot())
      }
  
    }
    
    describe("Quad") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Quad.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Quad.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Quad.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("Cubic") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Cubic.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Cubic.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Cubic.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("Quart") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Quart.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Quart.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Quart.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("sin") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Sin.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Sin.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Sin.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("expo") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Expo.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Expo.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Expo.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("circ") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Circ.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Circ.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Circ.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("elastic") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Ease.Elastic.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Ease.Elastic.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Ease.Elastic.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
  }
  
}
