protocol Schedulable {
  
  var scheduler: Dispatcher { get set }
}

protocol Updatable {
  func update()
}
