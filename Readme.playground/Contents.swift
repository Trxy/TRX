import TRX
import UIKit

struct ExampleObject {
  var value: Double
}

var object = ExampleObject(value: 0)
var anOtherObject = object

struct ExampleLayer {
  var position: CGPoint
}

var layer = ExampleLayer(position: CGPoint.zero)
var myView = UIView()
var someFrame = CGRect()
      
Tween(from: 0, to: 20, time: 0.3) {
  object.value = $0
}.start()

1.trx(to: 20) { object.value = $0 }.start()

Tween(from: CGPoint.zero, to: CGPoint(x: 20, y: 15), time: 0.3) {
  layer.position = $0
}.start()

Tween(from: 0,
      to: 1,
      time: 0.3,
      delay: 0.1,
      ease: Ease.Elastic.easeOut,
      key: "MyOwnKey",
      onStart: { print("start") },
      onComplete: { done in print("complete and done: \(done)") }) { value in
        object.value = value
}.start()

TimeLine(tweens: [
  1.trx(to: 20) { object.value = $0 },
  30.trx(to: 40) { object.value = $0 },
  40.trx(to: 50) { object.value = $0 },
]).start()


let timeline: TimeLine = [
  1.trx(to: 20) { object.value = $0 }: 0,
  30.trx(to: 40) { anOtherObject.value = $0 }: -0.5,
  40.trx(to: 50) { anOtherObject.value = $0 }: -0.5
]
timeline.start()

let tween = Tween(from: 0,
                  to: 1,
                  time: 0.5) { print($0) }
      
tween.scale = 2 // duration: 1s
tween.duration = 2.0 // scale: 4

myView.trxCenter(to: CGPoint(x: 10, y: 15))

myView.trxCenter(from: CGPoint.zero)

myView.trxFrame(to: someFrame)

myView.trxFrame(to: someFrame)
