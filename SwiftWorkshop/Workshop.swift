
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

        ///
        /// Creates a new game workshop instance.
        ///
        init()
        {
            print( "Welcome to the " + ViewController.APP_TITLE )

            scene = Scene()

            demonstrateSpriteKitCapabilities()
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

        ///
        /// Demonstrates the capabilities of the SpriteKit library.
        ///
        func demonstrateSpriteKitCapabilities() -> Void
        {
            // add ground
            let ground = SKSpriteNode( color: NSColor.lightGray, size: NSSize( width: 800.0, height: 10.0 ) )
            ground.position = CGPoint( x: 400, y: 5 )
            ground.physicsBody = SKPhysicsBody( rectangleOf: ground.size )
            ground.physicsBody?.isDynamic = false
            scene.addChild( ground )

            // add box
            let box = SKShapeNode( rectOf: CGSize( width: 75.0, height: 75.0 ) )
            box.position = CGPoint( x: 400, y: 500 )
            box.fillColor = NSColor.red
            box.strokeColor = NSColor.clear
            box.physicsBody = SKPhysicsBody( polygonFrom: box.path! )
            scene.addChild( box )

            // add circle
            let circle = SKShapeNode( circleOfRadius: 37.5 )
            circle.position = CGPoint( x: 450, y: 600 )
            circle.fillColor = NSColor.orange
            circle.strokeColor = NSColor.clear
            circle.physicsBody = SKPhysicsBody( circleOfRadius: 37.5 )
            scene.addChild( circle )
        }
    }
