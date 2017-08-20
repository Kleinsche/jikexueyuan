//
//  ViewController.swift
//  播放乐库音乐
//
//  Created by 🍋 on 16/9/22.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController,MPMediaPickerControllerDelegate {
    var picker:MPMediaPickerController!
    var player:MPMusicPlayerController!

    @IBAction func Play(_ sender: UIButton) {
        present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker = MPMediaPickerController(mediaTypes: MPMediaType.music)
        picker.allowsPickingMultipleItems = true
        picker.delegate = self
        
        player = MPMusicPlayerController.systemMusicPlayer()
    }

    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
//        mediaPicker.dismiss(animated: true, completion: nil)
        
        player.setQueue(with: mediaItemCollection)
        player.play()
        
        let firstName:String = mediaItemCollection.items[0].value(forProperty: MPMediaItemPropertyTitle) as! String
        
        print("\(firstName)")
    }

    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        mediaPicker.dismiss(animated: true, completion: nil)
        print("Cancel")
    }

}

