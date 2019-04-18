
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
        /// - parameter x:         The startup position x.
        /// - parameter y:         The startup position y.
        /// - parameter imageFile: The image that represents this game object.
        ///
        init( x: CGFloat, y: CGFloat, imageFile: String )
        {
            // load image file
            let image   = NSImage( named: imageFile )!
            let texture = SKTexture( image: image )

            // create SpriteKit node
            node          = SKSpriteNode( texture: texture )
            node.size     = texture.size()
            node.position = CGPoint( x: x, y: y )
        }
    }
