
    import Foundation
    import SpriteKit

    /**
     The input controller that recognizes key events.
     */
    class KeySystem
    {
        /**
         Creates a new key system by adding event monitoring for key up and down events.
         */
        init()
        {
            NSEvent.addLocalMonitorForEvents( matching: .keyDown )
            {
                print( "Key Down yields event: " )
                print( $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }

            NSEvent.addLocalMonitorForEvents( matching: .keyUp )
            {
                print( "Key Up yields event: " )
                print( $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }
        }
    }
