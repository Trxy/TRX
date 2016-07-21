import Foundation

protocol Subscriber: AnyObject {
  
  var keys: Set<String> { get }
  func tick(time: NSTimeInterval)
}