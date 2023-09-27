//
//  ViewController.swift
//  XO Game
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var position0: UIButton!
    @IBOutlet weak var position1: UIButton!
    @IBOutlet weak var position2: UIButton!
    @IBOutlet weak var position3: UIButton!
    @IBOutlet weak var position4: UIButton!
    @IBOutlet weak var position5: UIButton!
    @IBOutlet weak var position6: UIButton!
    @IBOutlet weak var position7: UIButton!
    @IBOutlet weak var position8: UIButton!
    
    var gameIsActive = true
    var player: Int = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningIndexes = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func determineWinner() {
        for index in winningIndexes {
            if gameState[index[0]] == gameState[index[1]] &&
               gameState[index[1]] == gameState[index[2]] &&
               gameState[index[2]] != 0 {
                
                print("got a winner")
                winnerLabel.text = "Player \(player) won"
                gameIsActive = false
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        selectPosition(button: sender)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        resetGame()
        gameIsActive = true
    }
    
    func resetGame() {
        winnerLabel.text = ""
        position0.setImage(nil, for: .normal)
        position1.setImage(nil, for: .normal)
        position2.setImage(nil, for: .normal)
        position3.setImage(nil, for: .normal)
        position4.setImage(nil, for: .normal)
        position5.setImage(nil, for: .normal)
        position6.setImage(nil, for: .normal)
        position7.setImage(nil, for: .normal)
        position8.setImage(nil, for: .normal)
        
        for i in 0...8 {
            gameState[i] = 0
        }
    
    }
    
    func selectPosition(button: UIButton) {
        if gameIsActive {
            if button.image(for: .normal) == nil {
                if player == 1 {
                    button.setImage(UIImage(named: "x3"), for: .normal)
                } else {
                    button.setImage(UIImage(named: "o2"), for: .normal)
                }
                gameState[button.tag] = player
                determineWinner()
                if player == 1 {
                    player = 2
                } else {
                    player = 1
                }
            }
        }
        print(gameState)
    }
}

