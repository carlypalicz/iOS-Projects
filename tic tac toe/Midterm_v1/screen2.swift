//
//  screen2.swift
//  Midterm_v1
//
//  Created by user155318 on 7/12/19.
//  Copyright © 2019 user155318. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate: class {
    func userDidWin(info: String)
}

class screen2: UIViewController {
    
    
    weak var delegate: DataEnteredDelegate? = nil
    
    func endGame(outcome : Int?) {
        if (outcome==1){
            delegate?.userDidWin(info: name1 + " WINS")
        }
        else if (outcome==2){
            delegate?.userDidWin(info: name2 + " WINS")
        }
        
        else {
            delegate?.userDidWin(info: "TIE!")
        }
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    var curPlayer = 1 // X
    var turnCount=0
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0] // which places on the board have been filled
    var possibleWins = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameOver = false
    
    @IBAction func move(_ sender: AnyObject) {
        if (game[sender.tag-1] == 0 && !gameOver) //square is free
        {
            turnCount = turnCount+1
            game[sender.tag-1] = curPlayer //tracks what square the current player went on
            if (curPlayer == 1) //place an X
            {
                sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                curPlayer=2

            }
            
            else //place an O
            {
                sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                curPlayer=1
                if (!gameOver)
                {
                    turn.text = name1 + "'s turn"
                }
            }
        }
        checkWinner()
    }
    
    func checkWinner()
    {
        for win in possibleWins
        {
            if (game[win[0]] != 0 && game[win[0]] == game[win[1]] && game[win[1]] == game[win[2]]) //if each square req'd for win combo is filled AND each square is filled by the same player, then we have a win
            {
                gameOver = true
                if (curPlayer == 1) //would be player 1s turn but 2 just won
                {
                    print( name2 + " won")
                    endGame(outcome: 2)
                }
                
                else{ //would be player 2s turn but 1 just won
                    print(name1 + " won")
                    endGame(outcome: 1)
                }
            }
        }
        
        if (turnCount == 9 && !gameOver)
        {
            gameOver = true
            print("tie :(")
            endGame(outcome: 3)
        }
        
        if (!gameOver && curPlayer == 2)
        {
            turn.text = name2 + "'s turn"
        }
        else if (!gameOver && curPlayer == 1)
        {
            turn.text = name1 + "'s turn"
        }
    }
    @IBOutlet weak var turn: UILabel!
    
    var name1 = ""
    var name2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        turn.text = name1 + "'s turn"
        
        
    }
    
    
}
