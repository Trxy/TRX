protocol Dispatcher {
  
  func subscribe(_ subscriber: Subscriber)
  func unsubscribe(_ subscriber: Subscriber)
  var timeStamp: TimeInterval { get }
}
