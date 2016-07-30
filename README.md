![TRX](https://trxy.github.io/TRX/trx@2x.png)
---

[![Build Status](https://img.shields.io/travis/Trxy/TRX/master.svg)](https://travis-ci.org/Trxy/TRX) [![CocoaPods](https://img.shields.io/cocoapods/v/TRX.svg)](https://cocoapods.org/?q=trx) [![License](https://img.shields.io/github/license/Trxy/TRX.svg)](LICENSE)

**TRX** is a versatile animation framework built with ease of use, powerful features and performance in mind.
**TRX** is inspired by the the excellent JavaScript animation framework [GSAP](http://greensock.com/gsap).

## Key Features

* Animate any numerical value
* Chain, overlap and group Tweens into Timelines
* Squeeze and stretch Tweens and Timelines
* Have total control, pause, play, seek any Tween or Timeline

## Using TRX

### Basic Usage

Tween any value
```swift
Tween(from: 0, to: 20, time: 0.3) {
  object.value = $0
}.start()
```
or neater...

```swift
1.trxTo(20) { object.value = $0 }.start()
```

Tween `Double`, `CGPoint`, `CGSize`, `CGRect` 
or even your own type (by extending the Morphable Protocol)

```swift
Tween(from: CGPointZero, to: CGPoint(x: 20, y: 15), time: 0.3) {
  layer.position = $0
}.start()
```

### Use optional parameters for fine grained control

```swift
Tween(from: 0,
      to: 1,
      time: 0.3,
      delay: 0.1,
      ease: Elastic.easeOut,
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
- `ease`: **optional** Timing function (`EaseFunction`). *Defaults to Linear.linear*.
- `key`: **optional** Tween key (`String`). Any other running animation with the same key will be stopped. *Defaults&nbsp;to&nbsp;nil*.
- `onStart`: **optional** Start callback. *Defaults to nil*.
- `onComplete`: **optional** Completion callback. *Defaults to nil*.
- `update`: Update callback


### Timelines

Use a Timeline to chain Tweens or even other timelines

```swift
TimeLine(tweens: [
  1.trxTo(20) { object.value = $0 },
  30.trxTo(40) { object.value = $0 },
  ]).start()
```

Add tween with an overlap

```swift
let timeline = TimeLine()
timeline.add(1.trxTo(20) { object.value = $0 })
timeline.add(30.trxTo(40) { anOtherObject.value = $0 }, shift: -0.5)
timeline.start()
```

Squeeze and stretch tweens or timelines

```swift
let tween = Tween(from: 0, to: 1, time: 0.5) { print($0) }

tween.scale = 2 // duration: 1s
timeline.duration = 2.0 // scale: 4
```

## UIView integration

Move to a new position
```swift
myView.trxCenterTo(CGPoint(x: 10, y: 15))
```
Move from a position to the current one
```swift
myView.trxCenterFrom(CGPointZero)
```
Animate frame to a given `CGRect`
```swift
myView.trxFrameTo(newFrame)
```
Animate frame from a given `CGRect` to the current frame
```swift
myView.trxFrameTo(someFrame)
```

## Requirements

```
iOS: 8.4, tvOS: 9.0, Swift
```
## Installation
### Cocoa Pods
```
pod "TRX"
```
Don't forget to add use_frameworks! to the Podfile. 
Requires CocoaPods 0.36.x or greater.
If you need more help use [CocoaPods Guides](https://guides.cocoapods.org/using/getting-started.html#getting-started).

### Carthage
Add to your [Cartfile](https://github.com/Carthage/Carthage):
```
github "Trxy/TRX"
```

### Manual

1. Download or clone the project
2. Build the the preferred target (eg. TRX iOS)
3. Locate the framework in finder (from the products group) file and add it to your project.
4. Add the framework as a dependency of your target in Build Phases
5. Add the framework to “Link Binary with Libraries” and in the “General” tab under “Embedded Binaries”
6. In order to distribute your app you need to build it for all possible architectures (armv7, armv7s, arm64, x86, etc)

## Contributions

**Contributions and suggestions are welcome!**

If you find any problems using TRX feel free to create an issue. 
Don't forget to add a detailed description and steps to reproduce.

If you'd like to ask a general question use [Stack Overflow](http://stackoverflow.com/) with tag **trx.swift**.

## License

[MIT](LICENSE)

Contributors: 
- [@AKModzelewski](https://twitter.com/AKModzelewski)
- [Sawa](https://www.behance.net/SawaMac)