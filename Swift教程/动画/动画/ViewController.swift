//
//  ViewController.swift
//  动画
//
//  Created by 🍋 on 16/7/29.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        

        
        UIView.beginAnimations(nil, context: nil)
        
        UIView.setAnimationDuration(5)
        UIView.setAnimationDelay(3)
        UIView.setAnimationRepeatCount(4)
        UIView.setAnimationRepeatAutoreverses(true)
        
        self.redView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        self.redView.transform = self.redView.transform.rotated(by: CGFloat(M_PI))
        
        UIView.commitAnimations()
    }
    
}

