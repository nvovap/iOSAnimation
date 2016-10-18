//
//  ViewController.swift
//  CoreAnimation
//
//  Created by nvovap on 10/18/16.
//  Copyright © 2016 nvovap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: ShakingText!
    @IBOutlet weak var passwordTextField2: ShakingTextTwo!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self
        passwordTextField2.delegate = self
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addPulse))
        
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(passwordTextField){
            passwordTextField.shake()
            passwordTextField2.shake()
        } else {
            passwordTextField2.shake()
        }
        
        return true
    }
    
    func addPulse() {
        let pulse = Pulsing(numberOfPulses: 1, radios: 110, position: avatarImageView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        
        self.view.layer.insertSublayer(pulse, below: avatarImageView.layer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

