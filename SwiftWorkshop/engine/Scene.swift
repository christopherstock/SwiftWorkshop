
    import Foundation
    import SpriteKit

    ///
    /// The custom SpriteKit scene.
    ///
    class Scene : SKScene
    {
        /// The width of the scene.
        static let WIDTH  :Int = 800
        /// The height of the scene.
        static let HEIGHT :Int = 600

        /// The SpriteKit view reference.
        var skView   :SKView
        /// A reference to the game loop.
        var gameLoop :GameLoop?
        /** The SpriteKit camera reference. */
        var skCamera :SKCameraNode

        ///
        /// Creates the custom SpriteKit scene and presents it in a SpriteKit view.
        ///
        override init()
        {
            skView   = SKView()
            skCamera = SKCameraNode()

            super.init( size: ( CGSize( width: Scene.WIDTH, height: Scene.HEIGHT ) ) )

            skView.frame = self.frame
            skView.presentScene( self )
            skView.showsFPS = true

            addChild( skCamera )
            self.camera = skCamera
        }

        ///
        /// This failable initializer is required to be specified in derived classes.
        /// It must be specified as a convenience initializer though it delegates
        /// the initialization to init().
        ///
        /// - parameter decoder: Supports coding and decoding functionality via NSKeyedArchiver.
        ///
        required convenience init?( coder decoder: NSCoder )
        {
            self.init()
        }

        ///
        /// Tells your app to perform any app-specific logic to update your scene.
        ///
        /// - parameter timeInterval: The passed time since the last update invocation.
        ///
        override open func update( _ timeInterval: TimeInterval ) -> Void
        {
            self.gameLoop?.render()
        }

        ///
        /// Sets the GameLoop callback for this scene.
        ///
        /// - parameter gameLoop: The game loop callback.
        ///
        func setGameLoop( _ gameLoop: GameLoop ) -> Void
        {
            self.gameLoop = gameLoop
        }
    }
