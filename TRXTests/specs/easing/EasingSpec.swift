@testable import TRX
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

class EasingSpec: QuickSpec {
  
  override func spec() {
    
    describe("linear") {
      
      it("has valid graph") {
        expect(EasingTestView(easing: Linear.linear)).to(haveValidSnapshot())
      }
  
    }
    
    describe("quad") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Quad.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Quad.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Quad.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("cubic") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Cubic.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Cubic.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Cubic.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("quart") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Quart.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Quart.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Quart.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("sin") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Sin.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Sin.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Sin.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("expo") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Expo.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Expo.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Expo.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("circ") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Circ.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Circ.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Circ.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
    describe("elastic") {
      
      it("has valid in graph") {
        expect(EasingTestView(easing: Elastic.easeIn)).to(haveValidSnapshot())
      }
      
      it("has valid out graph") {
        expect(EasingTestView(easing: Elastic.easeOut)).to(haveValidSnapshot())
      }
      
      it("has valid inOut graph") {
        expect(EasingTestView(easing: Elastic.easeInOut)).to(haveValidSnapshot())
      }
      
    }
    
  }
  
}
