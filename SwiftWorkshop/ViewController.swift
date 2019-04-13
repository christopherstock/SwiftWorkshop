
    import Cocoa

    ///
    /// The native ViewController.
    ///
    class ViewController : NSViewController
    {
        /// The application title.
        static let APP_TITLE = "Swift / SpriteKit Workshop, (c) 2019 Mayflower GmbH"

        ///
        /// Being invoked after the view has been loaded.
        /// Sets up the view after being loaded.
        ///
        override func viewDidLoad() -> Void
        {
            super.viewDidLoad()

            let workshop = Workshop()
            workshop.appendWorkshopView( to: self.view )
        }

        ///
        /// Being invoked after the view has appeared on the screen.
        ///
        override func viewDidAppear() -> Void
        {
            super.viewDidAppear()

            self.view.window?.title = ViewController.APP_TITLE
            self.view.window?.styleMask.remove( .resizable )
        }
    }
