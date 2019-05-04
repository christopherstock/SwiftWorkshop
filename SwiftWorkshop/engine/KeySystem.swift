
    import Foundation
    import SpriteKit

    ///
    /// Offers all cocoa specific keyCodes for the primal game keys.
    ///
    enum KeyCode : UInt16
    {
        /// Arrow Left key.
        case ARROW_LEFT  = 123
        /// Arrow Right key.
        case ARROW_RIGHT = 124
        /// Arrow Up key.
        case ARROW_UP    = 126
    }

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

            NSEvent.addLocalMonitorForEvents(
                matching: .keyDown,
                handler: {

                    // flag this keyCode as pressed
                    self.pressed[ $0.keyCode ] = true

                    // returning 'nil' indicates the event as handled
                    return nil
                }
            )

            NSEvent.addLocalMonitorForEvents(
                matching: .keyUp,
                handler: {

                    // flag this keyCode as released
                    self.pressed[ $0.keyCode ] = false

                    // returning 'nil' indicates the event as handled
                    return nil
                }
            )
        }

        ///
        /// Determines if a key is currently pressed.
        ///
        /// - parameter keyCode: The keyCode to determine pressed behaviour for.
        ///
        /// - returns: *true* if the key with the queried keyCode is currently pressed. Otherwise *false*.
        ///
        func isPressed( keyCode:KeyCode ) -> Bool
        {
            if let pressed = pressed[ keyCode.rawValue ]
            {
                return pressed
            }

            return false
        }
    }
