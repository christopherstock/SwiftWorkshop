
    import Foundation
    import Cocoa
    import SpriteKit

    ///
    /// The game workshop context.
    ///
    class Workshop
    {
        /// The custom implementation of the SpriteKit scene.
        var scene :Scene
        /// The game level instance.
        var level :Level

        ///
        /// Creates a new game workshop instance.
        ///
        init()
        {
            print( "Welcome to the " + ViewController.APP_TITLE )

            scene = Scene()
            level = Level()
        }

        ///
        /// Appends the game workshop's SpriteKit view to the specified ViewController view
        /// and adjusts the ViewController view to the SpriteKit view size.
        ///
        /// - parameter to: The native view to append the workshop game view to.
        ///
        func appendWorkshopView( to view: NSView )
        {
            view.addSubview( scene.skView )
            view.setFrameSize( scene.skView.frame.size )
        }
    }
