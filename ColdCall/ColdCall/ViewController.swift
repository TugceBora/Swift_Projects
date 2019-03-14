//
//  ViewController.swift
//  ColdCall
//
//  Created by Tugce Bora Ergen on 2/15/19.
//  Copyright © 2019 Tugce Bora Ergen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var NumberLabel: UILabel!
    let names = [ "Ready?", "Tugce", "Ismail", "Atlas", "Chris", "Kim" ]
    
    var currentIndex = 0
    var randomNumber: Int = 0
    
    @IBAction func ColdCall(_ sender: UIButton) {
        
        if NumberLabel?.isHidden ?? <#default value#> {
            NumberLabel?.isHidden = false
        }
       
        currentIndex = Int(arc4random_uniform(UInt32(names.count-1))+1)
        randomNumber = Int(arc4random_uniform(5)+1)
        
        if randomNumber == 1 || randomNumber == 2
        {
            NumberLabel.textColor = UIColor.red
        }
        else if randomNumber == 3 || randomNumber == 4
        {
            NumberLabel.textColor = UIColor.orange
        }
        else
        {
            NumberLabel.textColor = UIColor.green
        }
        
        updateUI()
    }
    

    func updateUI() {
        
        nameLabel?.text = names[currentIndex]
        NumberLabel?.text = String(randomNumber)
       
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NumberLabel?.isHidden = true
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

