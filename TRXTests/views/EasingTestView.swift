@testable import TRX
import UIKit

class EasingTestView: UIView {
  
  private let ease: EaseFunction
  
  required init(easing: EaseFunction) {
    self.ease = easing
    super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    self.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.1)
    draw()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func draw() {
    let rect = CGRect(origin: CGPoint(x: 0, y: 0),
                      size: CGSize(width: self.bounds.width,
                                   height: self.bounds.height / 2))
    let graph = createGraphLayer(path(rect).CGPath)
    graph.anchorPoint = CGPointZero
    let centerY =  (bounds.height + rect.size.height) / 2
    graph.position = CGPoint(x: 0, y: centerY)
    let background = createBackgroundLayer(rect)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: CGRectGetMidX(bounds),
                                  y: CGRectGetMidY(bounds))

    self.layer.addSublayer(background)
    self.layer.addSublayer(graph)
  }
  
  private func createGraphLayer(path: CGPath) -> CALayer {
    let layer = CAShapeLayer()
    layer.path = path
    layer.transform = CATransform3DMakeScale(1, -1, 1)
    layer.strokeColor = UIColor.blueColor().CGColor
    layer.lineWidth = 1
    layer.fillColor = nil
    return layer
  }
  
  private func createBackgroundLayer(rect: CGRect) -> CALayer {
    let layer = CALayer()
    layer.frame = rect
    let color = UIColor.blueColor().colorWithAlphaComponent(0.1)
    layer.backgroundColor = color.CGColor
    layer.anchorPoint = CGPoint(x: 0, y: 0)
    return layer
  }
  
  private func path(rect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()
    let start = rect.origin
    let end = CGPoint(x: CGRectGetMaxX(rect),
                      y: CGRectGetMaxY(rect))
    path.moveToPoint(start)
    let duration = Double(end.x)
    let from = Double(start.x)
    let to = Double(end.y)
    let delta = to - from
    for i in 0...Int(duration) {
      let y = ease(t: Double(i), b: from, c: delta, d: duration)
      let point = CGPoint(x: Double(i), y: y)
      path.addLineToPoint(point)
    }
    return path
  }

}
