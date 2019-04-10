
    import Foundation
    import SpriteKit

    /**
        The custom SpriteKit scene.
    */
    class Scene : SKScene
    {
        /** The width of the scene. */
        static let WIDTH  :Int = 800
        /** The height of the scene. */
        static let HEIGHT :Int = 600

        /**
            Creates the custom camera, adds it to the scene and assigns it to the SpriteKitScene.
        */
        override init()
        {
            super.init( size: ( CGSize( width: Scene.WIDTH, height: Scene.HEIGHT ) ) )
        }

        /**
            This failable initializer is required to be specified in derived classes.
            It must be specified as a convenience initializer though it delegates
            the initialization to init().

            - parameter decoder: Supports coding and decoding functionality via NSKeyedArchiver.
        */
        required convenience init?( coder decoder: NSCoder )
        {
            self.init()
        }
    }
