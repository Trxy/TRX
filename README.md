![TRX](https://trxy.github.io/TRX/trx@2x.png)
---

[![Build Status](https://img.shields.io/travis/Trxy/TRX/master.svg)](https://travis-ci.org/Trxy/TRX) [![CocoaPods](https://img.shields.io/cocoapods/v/TRX.svg)](https://cocoapods.org/?q=trx) [![Carthage](https://img.shields.io/badge/carthage-complatible-green.svg)](https://github.com/Carthage/Carthage) [![License](https://img.shields.io/github/license/Trxy/TRX.svg)](LICENSE) ![Swift](https://img.shields.io/badge/swift-4.o-orange.svg)

**TRX** is a versatile animation framework built with ease of use, powerful features and performance in mind.
**TRX** is inspired by the excellent JavaScript animation framework [GSAP](http://greensock.com/gsap).

This version is works with **Swift 4**. For **Swift 3** compatible version use 0.5.0.

## Key Features

* Animate any numerical value
* Chain, overlap and group Tweens into Timelines
* Squeeze and stretch Tweens and Timelines
* Have total control, pause, play, seek any Tween or Timeline

## Examples

![Tricks](https://trxy.github.io/TRX/tricks.gif)

Take a look at [Tricks](https://github.com/Trxy/Tricks) the example app.

## Using TRX

### Basic Usage

Tween any value
```swift
Tween(from: 0, to: 20, time: 0.3) {
  object.value = $0
}.start()
```
Or, neater...

```swift
1.trx(to: 20) { object.value = $0 }.start()
```

Tween `Double`, `CGFloat`, `CGPoint`, `CGSize`, `CGRect`, `CGAffineTransform`, `CATransform3D` 
or even your own type (by extending the Morphable Protocol)

```swift
Tween(from: CGPoint.zero, to: CGPoint(x: 20, y: 15), time: 0.3) {
  layer.position = $0
}.start()
```

### Use optional parameters for fine-grained control

```swift
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
```

- `from`: Starting value (`Morphable`).
- `to`: End value (`Morphable`).
- `time`: Duration (`NSTimeInterval`).
- `delay`: **optional** Time offset (`NSTimeInterval`). *Defaults to 0*.
- `ease`: **optional** Timing function (`Ease.TimingFunction`). *Defaults to Ease.Quad.easeOut*.
- `key`: **optional** Tween key (`String`). Any other running animation with the same key will be stopped. *Defaults&nbsp;to&nbsp;nil*.
- `onStart`: **optional** Start callback. *Defaults to nil*.
- `onComplete`: **optional** Completion callback. *Defaults to nil*.
- `update`: Update callback


### Timelines

Use a Timeline to chain Tweens or even other timelines

```swift
TimeLine(tweens: [
  1.trx(to: 20) { object.value = $0 },
  30.trx(to: 40) { object.value = $0 },
  40.trx(to: 50) { object.value = $0 },
]).start()
```
![Timeline](https://trxy.github.io/TRX/docs/timeline.png)

Add Tweens with an overlap

```swift
let timeline: TimeLine = [
  1.trx(to: 20) { object.value = $0 }: 0,
  30.trx(to: 40) { anOtherObject.value = $0 }: -0.5,
  40.trx(to: 50) { anOtherObject.value = $0 }: -0.5
]
timeline.start()
```
![Timeline with an overlap](https://trxy.github.io/TRX/docs/timeline_overlap.png)

### Squeeze and stretch Tweens or timelines

```swift
let tween = Tween(from: 0,
                  to: 1,
                  time: 0.5) { print($0) }

tween.scale = 2 // duration: 1s
tween.duration = 2.0 // scale: 4
```

## UIView integration

Move to a new position
```swift
myView.trxCenter(to: CGPoint(x: 10, y: 15))
```
Move from a position to the current one
```swift
myView.trxCenter(from: CGPoint.zero)
```
Animate frame to a given `CGRect`
```swift
myView.trxFrame(to: someFrame)
```
Animate frame from a given `CGRect` to the current frame
```swift
myView.trxFrame(to: someFrame)
```

## Requirements

```
iOS: 8.4, tvOS: 9.0, Xcode 9, Swift 4.0
```

For swift 2.3 compatible version check out TRX 4.x

## Installation
### Cocoa Pods
```
pod "TRX"
```
Don't forget to add use_frameworks! to the Podfile. 
Requires CocoaPods 0.36.x or higher.
If you need more help use [CocoaPods Guides](https://guides.cocoapods.org/using/getting-started.html#getting-started).

### Carthage
Add to your [Cartfile](https://github.com/Carthage/Carthage):
```
github "Trxy/TRX"
```

### Swift Package Manager (Experimental)
Specify a dependency in [Package.swift](https://swift.org/package-manager/)
```
...
.Package(url: "https://github.com/Trxy/TRX.git", majorVersion: 0, minor: 3),
...
```

### Manual

1. Download or clone the project
2. Build the preferred target (eg. TRX iOS)
3. Locate the framework in finder (from the products group) file and add it to your project.
4. Add the framework as a dependency of your target in Build Phases
5. Add the framework to “Link Binary with Libraries” and in the “General” tab under “Embedded Binaries”
6. In order to distribute your app you need to build it for all possible architectures (armv7, armv7s, arm64, x86, etc)

## Contributions

**Contributions and suggestions are welcome!**

If you find any problems using TRX or have any feature requests feel free to create an issue and/or a pull request. 
In the event of a problem don't forget to add a detailed description, Xcode and target version as well as steps to reproduce.

If you'd like to ask a general question use [Stack Overflow](http://stackoverflow.com/) with tag **trx.swift**.

### Todos

- Mac version
- Custom Bezier Curve easing
- Short rotation plugin
- Bezier path plugin

## License

[MIT](LICENSE)

Contributors: 
- [@AKModzelewski](https://twitter.com/AKModzelewski)
- [Sawa](https://www.behance.net/SawaMac)
