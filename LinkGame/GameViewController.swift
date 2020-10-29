//
//  GameViewController.swift
//  LinkGame
//
//  Created by chenwei on 2020/10/28.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var level: Level!
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            self.scene = GameScene(size: self.view.frame.size)
            // Set the scale mode to scale to fit the window
            self.scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(self.scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        level = Level()
        scene.level = level
        beginGame()
    }
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.clearSprites()
        scene.addSprites(for: newCookies)
    }
    
    @IBAction func shuffleAction(_ sender: Any) {
        beginGame()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
