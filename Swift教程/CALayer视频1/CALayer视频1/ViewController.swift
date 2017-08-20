//
//  ViewController.swift
//  CALayer视频1
//
//  Created by 🍋 on 16/7/30.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.redView.layer.borderWidth = 10
        self.redView.layer.borderColor = UIColor.blue.cgColor
        
        self.redView.layer.shadowColor = UIColor.black.cgColor
        self.redView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.redView.layer.shadowOpacity = 1
        
        self.redView.layer.cornerRadius = 10
        self.redView.layer.contents = UIImage.init(named: "1.png")?.cgImage
////        内容和子视图剪到视图的边界
//        self.redView.clipsToBounds = true
        self.redView.layer.masksToBounds = true
    }



}

