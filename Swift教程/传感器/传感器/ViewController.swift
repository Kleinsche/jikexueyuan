//
//  ViewController.swift
//  传感器
//
//  Created by 🍋 on 2016/12/4.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var cmm = CMMotionManager()
    let q = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startDeviceMotion()
//        startAccelerometerUpdate()
//        startGyroUpdate()
//        startListenProximity()
//        startListenBattery()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopDeviceMotion()
//        stopAccelerometerUpdate()
        stopGyroUpdate()
//        stopListenProximity()
//        stopListenBattery()
    }
    
    func startDeviceMotion() {
        cmm.deviceMotionUpdateInterval = 0.01
        if cmm.isDeviceMotionAvailable {
            cmm.startDeviceMotionUpdates(to: q, withHandler: { (data:CMDeviceMotion?, err:Error?) in
                print("角速度\(data!.rotationRate.y)")
            })
        }
    }
    
    func stopDeviceMotion() {
        if cmm.isDeviceMotionActive {
            cmm.stopDeviceMotionUpdates()
        }
    }
    
    
    func startAccelerometerUpdate() {
        cmm.accelerometerUpdateInterval = 1
        if cmm.isAccelerometerAvailable {
            cmm.startAccelerometerUpdates(to: q, withHandler: { (data:CMAccelerometerData?, err:Error?) in
                print(data!)
            })
        }else{
            print("加速度不可用")
        }
    }
    
    func stopAccelerometerUpdate() {
        if cmm.isAccelerometerActive {
            cmm.stopAccelerometerUpdates()
        }
    }
    
    
    func startGyroUpdate() {
        cmm.gyroUpdateInterval = 10
        if cmm.isGyroAvailable{
            let queue = OperationQueue.current
            cmm.startGyroUpdates(to: queue!, withHandler: {
                (data:CMGyroData?,err:Error?) in
//                print(data!)
                print("     \(data!.rotationRate.y)")
            })
        }else {
            print("陀螺仪感器不可用")
        }
    }
    
    func stopGyroUpdate() {
        if cmm.isGyroActive {
            cmm.stopGyroUpdates()
        }
    }
    
    
    func startListenProximity() {
        UIDevice.current.isProximityMonitoringEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.proximityChanged), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)
    }
    
    func proximityChanged() {
        print(UIDevice.current.proximityState)
    }
    
    func stopListenProximity() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceBatteryStateDidChange, object: nil)
    }
    
    
    func startListenBattery() {
        print(-UIDevice.current.batteryLevel*100,"%")
        UIDevice.current.isBatteryMonitoringEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.batteryChanged), name: NSNotification.Name.UIDeviceBatteryStateDidChange, object: nil)
    }
    
    func batteryChanged() {
        print(UIDevice.current.batteryLevel/100,"%")
    }
    
    func stopListenBattery() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceBatteryStateDidChange, object: nil)
    }
    
}

