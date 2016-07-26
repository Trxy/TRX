/**
 
 Conform to this protocol to enable scheduling and aggregating by Timelines.
 
 */

import Foundation

public typealias StartClosure = () -> ()
public typealias CompletionClosure = (done: Bool) -> ()

public protocol Tweenable: class {
  
  /// Duration (seconds)
  var duration: NSTimeInterval { get set }
  
  /// Scale. Defaults to 1.0
  var scale: Double { get set }
  
  /// Current time offset (seconds)
  var head: NSTimeInterval { get }
  
  /// Pause or resume animation
  var paused: Bool { get set }
  
  /// Start callback
  var onStart: StartClosure? { get set }
  
  /// Completion callback
  var onComplete: CompletionClosure? { get set }
  
  /// Start the animation
  func start()
  
  /// Stop the animation
  func stop()
  
  /**
   Move head to a specific time offset
   
   - Parameter delta: Time offset (seconds)
   */
  func seek(delta: NSTimeInterval)
  
}

