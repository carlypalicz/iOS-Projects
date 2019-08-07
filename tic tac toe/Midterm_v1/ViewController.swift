//
//  ViewController.swift
//  Midterm_v1
//
//  Created by user155318 on 7/12/19.
//  Copyright © 2019 user155318. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {

    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBAction func start(_ sender: UIButton) {
    
    
    }
    @IBOutlet weak var winner: UILabel!
    
    func userDidWin(info: String) {
        winner.text = info
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondScreen = segue.destination as! screen2
        secondScreen.name1 = player1.text!
        secondScreen.name2 = player2.text!
        secondScreen.delegate = self
    }


}

