//
//  ButtonViewController.swift
//  SimpleAndCoolAnimations
//
//  Created by nvovap on 10/13/16.
//  Copyright © 2016 nvovap. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bounce(_ sender: UIButton) {
        let bounce = sender.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            
            sender.bounds = CGRect(x: bounce.origin.x-20 , y: bounce.origin.y, width: bounce.size.width+60, height: bounce.size.height)
            
        },  completion: {(success: Bool) -> Void in
            if success {
                
                UIView.animate(withDuration: 0.5, animations: { 
                     sender.bounds = bounce
                })
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
