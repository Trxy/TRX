import Foundation

protocol Subscriber: class {
  
  var keys: Set<String> { get }
  func tick(time: TimeInterval)
}
