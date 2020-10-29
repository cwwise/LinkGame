//
//  GameScene.swift
//  LinkGame
//
//  Created by chenwei on 2020/10/28.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var level: Level!

    let tileWidth: CGFloat = 32.0
    let tileHeight: CGFloat = 36.0

    let gameLayer = SKNode()
    let cookiesLayer = SKNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        background.size = size
        background.zPosition = -1
        addChild(background)
        
        addChild(gameLayer)

        let layerPosition = CGPoint(
            x: -tileWidth * CGFloat(numColumns) / 2,
            y: -tileHeight * CGFloat(numRows) / 2)

        cookiesLayer.position = layerPosition
        gameLayer.addChild(cookiesLayer)
    }
    
    func clearSprites() {
        for item in cookiesLayer.children {
            item.removeFromParent()
        }
    }
    
    func addSprites(for cookies: Set<Cookie>) {
      for cookie in cookies {
        let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
        sprite.size = CGSize(width: tileWidth, height: tileHeight)
        sprite.position = pointFor(column: cookie.column, row: cookie.row)
        cookiesLayer.addChild(sprite)
        cookie.sprite = sprite
      }
    }

    private func pointFor(column: Int, row: Int) -> CGPoint {
      return CGPoint(
        x: CGFloat(column) * tileWidth + tileWidth / 2,
        y: CGFloat(row) * tileHeight + tileHeight / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder) is not used in this app")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
