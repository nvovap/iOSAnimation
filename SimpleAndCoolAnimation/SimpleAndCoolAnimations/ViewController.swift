//
//  ViewController.swift
//  SimpleAndCoolAnimations
//
//  Created by nvovap on 10/13/16.
//  Copyright © 2016 nvovap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOneConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTwoConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonOneConstraint.constant -= view.bounds.width
        buttonTwoConstraint.constant -= view.bounds.width
        
    }
    
    
    var animateOnec = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if animateOnec == false {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.buttonOneConstraint.constant += self.view.bounds.width
            }, completion: nil)
            
            
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
                self.buttonTwoConstraint.constant += self.view.bounds.width
            }, completion: nil)
            
            animateOnec = true
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

