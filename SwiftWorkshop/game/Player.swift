
    import Foundation
    import SpriteKit

    ///
    /// The player being controlled by the user.
    ///
    class Player : GameObject
    {
        /// The player's horizontal moving speed.
        static let MOVE_VELOCITY :CGFloat = 500.0
        /// The player's jumping force.
        static let JUMP_VELOCITY :CGFloat = 1000.0

        /// The texture for the player moving left.
        private var leftTexture  :SKTexture
        /// The texture for the player moving right.
        private var rightTexture :SKTexture

        ///
        /// Creates a new player instance.
        ///
        /// - parmeter scene: The SpriteKit scene to add this game object to.
        /// - parmeter x:     The startup position x.
        /// - parmeter y:     The startup position y.
        ///
        init( scene: SKScene, x: CGFloat, y: CGFloat )
        {
            leftTexture  = SKTexture( image: NSImage( named: "walkLeft.png"  )! )
            rightTexture = SKTexture( image: NSImage( named: "walkRight.png" )! )

            super.init( scene: scene, x: x, y: y, imageFile: "walkRight.png", physic: Physic.player )

            node.physicsBody?.allowsRotation = false
        }

        ///
        /// Renders one iteration of the game loop for the player.
        ///
        func render( keySystem: KeySystem ) -> Void
        {
            if ( keySystem.isPressed( keyCode: KeyCode.ARROW_LEFT ) )
            {
                node.physicsBody?.velocity.dx = -Player.MOVE_VELOCITY
                node.texture = leftTexture
            }
            else if ( keySystem.isPressed( keyCode: KeyCode.ARROW_RIGHT ) )
            {
                node.physicsBody?.velocity.dx = Player.MOVE_VELOCITY
                node.texture = rightTexture
            }
            else
            {
                node.physicsBody?.velocity.dx = 0.0
            }

            if ( keySystem.isPressed( keyCode: KeyCode.ARROW_UP ) && isVerticalResting() )
            {
                node.physicsBody?.velocity.dy = Player.JUMP_VELOCITY
            }
        }
    }
