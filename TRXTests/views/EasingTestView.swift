@testable import TRX
import UIKit

class EasingTestView: UIView {
  
  fileprivate let ease: Ease.TimingFunction
  
  required init(easing: @escaping Ease.TimingFunction) {
    self.ease = easing
    super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    self.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    draw()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func draw() {
    let rect = CGRect(origin: CGPoint(x: 0, y: 0),
                      size: CGSize(width: self.bounds.width,
                                   height: self.bounds.height / 2))
    let graph = createGraphLayer(path(rect).cgPath)
    graph.anchorPoint = CGPoint.zero
    let centerY =  (bounds.height + rect.size.height) / 2
    graph.position = CGPoint(x: 0, y: centerY)
    let background = createBackgroundLayer(rect)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: bounds.midX,
                                  y: bounds.midY)

    self.layer.addSublayer(background)
    self.layer.addSublayer(graph)
  }
  
  fileprivate func createGraphLayer(_ path: CGPath) -> CALayer {
    let layer = CAShapeLayer()
    layer.path = path
    layer.transform = CATransform3DMakeScale(1, -1, 1)
    layer.strokeColor = UIColor.blue.cgColor
    layer.lineWidth = 1
    layer.fillColor = nil
    return layer
  }
  
  fileprivate func createBackgroundLayer(_ rect: CGRect) -> CALayer {
    let layer = CALayer()
    layer.frame = rect
    let color = UIColor.blue.withAlphaComponent(0.1)
    layer.backgroundColor = color.cgColor
    layer.anchorPoint = CGPoint(x: 0, y: 0)
    return layer
  }
  
  fileprivate func path(_ rect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()
    let start = rect.origin
    let end = CGPoint(x: rect.maxX,
                      y: rect.maxY)
    path.move(to: start)
    let duration = Double(end.x)
    let from = Double(start.x)
    let to = Double(end.y)
    let delta = to - from
    for i in 0...Int(duration) {
      let y = ease(Double(i), from, delta, duration)
      let point = CGPoint(x: Double(i), y: y)
      path.addLine(to: point)
    }
    return path
  }

}
