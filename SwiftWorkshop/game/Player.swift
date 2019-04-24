
    import Foundation
    import SpriteKit

    ///
    /// The player being controlled by the user.
    ///
    class Player : GameObject
    {
        /// The player's horizontal moving speed.
        static let MOVE_VELOCITY :CGFloat = 500.0

        ///
        /// Creates a new player instance.
        ///
        /// - parmeter scene: The SpriteKit scene to add this game object to.
        /// - parmeter x:     The startup position x.
        /// - parmeter y:     The startup position y.
        ///
        init( scene: SKScene, x: CGFloat, y: CGFloat )
        {
            super.init( scene: scene, x: x, y: y, imageFile: "walkRight.png", physic: Physic.player )
        }

        ///
        /// Renders one iteration of the game loop for the player.
        ///
        func render( keySystem: KeySystem ) -> Void
        {
            if ( keySystem.isPressed( keyCode: KeyCode.ARROW_LEFT ) )
            {
                node.physicsBody?.velocity.dx = -Player.MOVE_VELOCITY
            }

            if ( keySystem.isPressed( keyCode: KeyCode.ARROW_RIGHT ) )
            {
                node.physicsBody?.velocity.dx = Player.MOVE_VELOCITY
            }
        }
    }
