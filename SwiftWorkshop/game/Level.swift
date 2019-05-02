
    import SpriteKit

    ///
    /// The game level that manages all game objects.
    ///
    class Level
    {
        /// Level width in px.
        static let WIDTH  :Int = 5120
        /// Level height in px.
        static let HEIGHT :Int = 720

        /// Non collidable decoration.
        private var decos  :[GameObject]
        /// Collidable static walls.
        private var walls  :[GameObject]
        /// Collidable dynamic boxes objects.
        private var boxes  :[GameObject]
        /// Collectable game items.
        private var items  :[GameObject]

        /// The game object being controlled by the user.
        private var player :Player

        ///
        /// Creates a new instance of the game level.
        ///
        /// - parameter scene: The SpriteKit scene to add all game objects to.
        ///
        init( scene: SKScene )
        {
            decos = []
            walls = []
            boxes = []
            items = []

            decos.append( GameObject( scene: scene, x: 0,    y: 0,   imageFile: "foreground.png", physic: Physic.none  ) )
            walls.append( GameObject( scene: scene, x: 500,  y: 0,   imageFile: "stone1.png",     physic: Physic.wall  ) )
            boxes.append( GameObject( scene: scene, x: 300,  y: 0,   imageFile: "box1.png",       physic: Physic.crate ) )
            items.append( GameObject( scene: scene, x: 300,  y: 250, imageFile: "raspberry.png",  physic: Physic.none  ) )

            player = Player( scene: scene, x: 150, y: 0 )

            // add level bounds
            createLevelBounds( scene: scene )
        }

        ///
        /// Creates the four level bounds that surround this level.
        ///
        /// - parameter scene: The SpriteKit scene to apply the level bounds to.
        ///
        private func createLevelBounds( scene:SKScene ) -> Void
        {
            let boundaries :[SKShapeNode] = [
                SKShapeNode( rect: CGRect( x: 0,           y: 0           , width: Level.WIDTH, height: 0            ) ),
                SKShapeNode( rect: CGRect( x: 0,           y: 0           , width: 0,           height: Level.HEIGHT ) ),
                SKShapeNode( rect: CGRect( x: Level.WIDTH, y: 0           , width: Level.WIDTH, height: Level.HEIGHT ) ),
                SKShapeNode( rect: CGRect( x: 0,           y: Level.HEIGHT, width: Level.WIDTH, height: Level.HEIGHT ) ),
            ]

            for boundary in boundaries
            {
                boundary.physicsBody = SKPhysicsBody( edgeChainFrom: boundary.path! )

                scene.addChild( boundary )
            }
        }

        ///
        /// Renders one game loop cycle for the level.
        ///
        /// - parameter keySystem: The app's key system to determine currently pressed keys.
        ///
        func render( keySystem: KeySystem ) -> Void
        {
            player.render( keySystem: keySystem )

            for item in items
            {
                item.node.zRotation += 0.01

                if ( item.node.intersects( node ) )
                {
                    let DURATION = 0.3

                    let fadeOut = SKAction.fadeOut( withDuration: DURATION )
                    let rotate  = SKAction.rotate( byAngle: 0.05, duration: DURATION )
                    let scaleUp = SKAction.scale( to: 17.5, duration: DURATION )

                    item.node.run( fadeOut )
                    item.node.run( rotate  )
                    item.node.run( scaleUp )
                }
            }
        }

        ///
        /// Returns the current poistion of the player node.
        ///
        /// - return: The point of the current player position.
        ///
        func getPlayerPosition() -> CGPoint
        {
            return player.node.position
        }
    }
