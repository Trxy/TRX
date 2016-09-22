import Foundation

protocol Subscriber: class {
  
  var keys: Set<String> { get }
  func tick(_ time: TimeInterval)
}
