import Foundation

protocol Schedulable {
  
  var scheduler: Dispatcher { get set }
}