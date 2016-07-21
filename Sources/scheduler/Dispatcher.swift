import Foundation

protocol Dispatcher {
  
  func subscribe(subscriber: Subscriber)
  func unsubscribe(subscriber: Subscriber)
  var timeStamp: NSTimeInterval { get }
}
