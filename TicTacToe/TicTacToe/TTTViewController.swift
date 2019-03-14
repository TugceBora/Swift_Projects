//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tugce Bora Ergen on 2/27/19.
//  Copyright © 2019 Tugce Bora Ergen. All rights reserved.
//

import UIKit

class TTTViewController: UIViewController {
    var player : Int!
    var game: Game!

    @IBOutlet var buttonsArray: [UIButton]!
    
    @IBOutlet weak var winning_label: UILabel!
    
    
    @IBAction func reset_button_pressed(_ sender: UIButton) {
        reset()
    }
    func reset (){
        game.reset()
        for button in buttonsArray{
            button.isEnabled = true
            button.backgroundColor = UIColor.lightGray
        }
        player = 1
        winning_label.text = " "
    }
    
    @IBOutlet var TTT_spaces: [UIButton]!
    
    @IBAction func space_pressed(_ sender: UIButton) {
        print("button was pressed", sender.tag)
        if player == 1{
            sender.backgroundColor = UIColor.blue
           
        }
        else {
            sender.backgroundColor = UIColor.yellow
           
        }
        
        game.moveByPlayer(player: player, space: sender.tag)
        let result = game.checkForWin(spotTaken: sender.tag)
        if result == "win" {
            winning_label.text = "Player \(player!) won!!!!"
            for button in buttonsArray{
                button.isEnabled = false
            }
        
        }
        else if result == "tie"{
            winning_label.text = "it's a tie"
        }
        else {
        if player == 1 {
            
            player = 2
        }
        else {
            player = 1
            }
        }
        
        sender.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game()
        reset()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

