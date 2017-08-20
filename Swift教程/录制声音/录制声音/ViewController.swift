//
//  ViewController.swift
//  录制声音
//
//  Created by 🍋 on 16/9/3.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var avRec:AVAudioRecorder!
    var audioFileUrl:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        audioFileUrl = NSFileManager.default.urls(for:SearchPathDirectory.documentDirectory,in:SearchPathDomainMask.allDomainsMask)
        audioFileUrl = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.allDomainsMask)[0] as URL
        
        avRec = AVAudioRecorder(URL: audioFileUrl, settings:nil)
        avRec.prepareToRecord()
        
        
    }


}

