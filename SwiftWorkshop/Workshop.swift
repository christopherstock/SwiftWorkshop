
    import Foundation
    import Cocoa
    import SpriteKit

    ///
    /// The game workshop context.
    ///
    class Workshop
    {
        /// The custom implementation of the SpriteKit scene.
        var scene     :Scene
        /// The game level instance.
        var level     :Level
        /// The key system.
        var keySystem :KeySystem

        ///
        /// Creates a new game workshop instance.
        ///
        init()
        {
            print( "Welcome to the " + ViewController.APP_TITLE )

            scene     = Scene()
            level     = Level( scene: scene )
            keySystem = KeySystem()

            scene.setGameLoop( self )
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

    ///
    /// Extends the game workshop with game loop functionality.
    ///
    extension Workshop : GameLoop
    {
        ///
        /// Renders one iteration of the game loop.
        ///
        func render() -> Void
        {
            print( "Workshop.render() being invoked at millis " + String( NSDate().timeIntervalSince1970 ) )
        }
    }
