
    import Foundation
    import SpriteKit

    ///
    /// Represents one game entity.
    ///
    class GameObject
    {
        /// The SpriteKit node that represents this game object in the SpriteKit scene.
        internal var node :SKSpriteNode

        ///
        /// Creates a new game object.
        ///
        /// - parameter scene:         The SpriteKit scene to add this game object to.
        /// - parameter x:             The startup position x.
        /// - parameter y:             The startup position y.
        /// - parameter imageFile:     The image that represents this game object.
        /// - parameter enablePhysics: Enable a testwise physical body.
        ///
        init( scene: SKScene, x: CGFloat, y: CGFloat, imageFile: String, enablePhysics: Bool )
        {
            // load image file
            let image   = NSImage( named: imageFile )!
            let texture = SKTexture( image: image )

            // create SpriteKit node
            node          = SKSpriteNode( texture: texture )
            node.size     = texture.size()
            node.position = CGPoint(
                x: x + ( node.size.width  / 2 ),
                y: y + ( node.size.height / 2 )
            )

            // set testwise physical behaviour
            if ( enablePhysics )
            {
                self.addPhysicsBody()
            }

            // add SpriteKit node to the SpriteKit scene
            scene.addChild( node )
        }

        ///
        /// Creates the physical body for this game object.
        ///
        private func addPhysicsBody() -> Void
        {
            node.physicsBody = SKPhysicsBody( texture: node.texture!, size: node.size )

            node.physicsBody?.isDynamic   = true

            node.physicsBody?.mass        = 1.0
            node.physicsBody?.restitution = 1.0
            node.physicsBody?.friction    = 0.0
        }
    }
