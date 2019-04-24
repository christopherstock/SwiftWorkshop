
    import Foundation
    import SpriteKit

    ///
    /// The player being controlled by the user.
    ///
    class Player : GameObject
    {
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
    }
