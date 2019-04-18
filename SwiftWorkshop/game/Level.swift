
    import SpriteKit

    ///
    /// The game level that manages all game objects.
    ///
    class Level
    {
        /// Non collidable decoration.
        private var decos  :[GameObject]
        /// Collidable static walls.
        private var walls  :[GameObject]
        /// Collidable dynamic boxes objects.
        private var boxes  :[GameObject]
        /// Collectable game items.
        private var items  :[GameObject]

        /// The game object being controlled by the user.
        private var player :GameObject

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

            decos.append( GameObject( scene: scene, x: 0,    y: 0,   imageFile: "foreground.png" ) )
            walls.append( GameObject( scene: scene, x: 500,  y: 0,   imageFile: "stone1.png"     ) )
            boxes.append( GameObject( scene: scene, x: 300,  y: 0,   imageFile: "box1.png"       ) )
            items.append( GameObject( scene: scene, x: 300,  y: 250, imageFile: "raspberry.png"  ) )

            player = GameObject( scene: scene, x: 150, y: 0, imageFile: "walkRight.png" )
        }
    }
