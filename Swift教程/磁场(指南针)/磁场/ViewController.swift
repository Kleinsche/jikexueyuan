//
//  ViewController.swift
//  磁场
//
//  Created by 🍋 on 2016/12/7.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet var pointer: UIImageView!
    var lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.pointer.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        lm.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.pointer.transform = CGAffineTransform(rotationAngle: CGFloat(-newHeading.magneticHeading/180 * M_PI) + CGFloat(M_PI_4))
        print(newHeading)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lm.startUpdatingHeading()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        lm.stopUpdatingHeading()
    }
    

}

