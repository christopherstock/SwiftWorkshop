
    import Foundation
    import SpriteKit

    ///
    /// The input controller that recognizes key events.
    ///
    class KeySystem
    {
        /// Flags the 'pressed' state for all keyCodes.
        var pressed :[UInt16:Bool]

        ///
        /// Creates a new key system by adding event monitoring for key up and down events.
        ///
        init()
        {
            pressed = [:]

            NSEvent.addLocalMonitorForEvents( matching: .keyDown )
            {
                // flag this keyCode as pressed
                self.pressed[ $0.keyCode ] = true

                // returning 'nil' indicates the event as handled
                return nil
            }

            NSEvent.addLocalMonitorForEvents( matching: .keyUp )
            {
                // flag this keyCode as released
                self.pressed[ $0.keyCode ] = false

                // returning 'nil' indicates the event as handled
                return nil
            }
        }

        ///
        /// Determines if a key is currently pressed.
        ///
        /// - parameter keyCode: The keyCode to determine pressed behaviour for.
        ///
        /// - returns: *true* if the key with the queried keyCode is currently pressed. Otherwise *false*.
        ///
        func isPressed( keyCode:UInt16 ) -> Bool
        {
            if let pressed = pressed[ keyCode ]
            {
                return pressed
            }

            return false
        }
    }
