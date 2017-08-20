//
//  ViewController.swift
//  reachData
//
//  Created by Kleinsche on 2017/6/27.
//  Copyright © 2017年 Kleinsche. All rights reserved.
//

import UIKit

class ViewController: UIViewController,URLSessionDownloadDelegate {
    @IBOutlet var slider: UISlider!
    @IBOutlet var image: UIImageView!
    
    var downloadTask: URLSessionDownloadTask?
//    var resumeData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://localhost/basic/hello.php")
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "username=1&password=2".data(using: .utf8)
        //        request.httpBody = NSString(string: "username=1&password=2").data(using: String.Encoding.utf8.rawValue)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }
        
        task.resume()
        //        task.cancel()
        //        task.suspend()
        
    }
    
    
    //配置后台下载请求
    func backgroundSession() -> URLSession {
        let session: URLSession!
        
        let sessionConfig = URLSessionConfiguration.background(withIdentifier: "bgdownload")
        //请求超时5秒
        sessionConfig.timeoutIntervalForRequest = 5.0
        //最佳网络下载
        sessionConfig.isDiscretionary = true
        //限制最多连接
        sessionConfig.httpMaximumConnectionsPerHost = 5
        
        session = URLSession.init(configuration: sessionConfig, delegate: self, delegateQueue: nil)//指定配置和代理
        
        return session
    }
    
    //下载文件
    func downloadFile() {
        let string = "http://m2.pc6.com/mac/QvodPlayer_v1.1.26.dmg"
        if let url = URL(string: string){
            let request = URLRequest(url: url)
            
            self.downloadTask = self.backgroundSession().downloadTask(with: request)
            self.downloadTask?.resume()
        }
    }
    
    @IBAction func downloadStart(_ sender: UIButton) {
        self.downloadFile()
    }
    
    @IBAction func downloadPause(_ sender: UIButton) {
        self.downloadTask?.suspend()
        print("暂停")
//        self.downloadTask?.cancel(byProducingResumeData: { (resumeData) in
//            self.resumeData = resumeData
//        })
    }
    
    @IBAction func downloadResume(_ sender: UIButton) {
//        if self.resumeData == nil {
//            print("没有resumeData")
//            return
//        }
//        
//        print("继续")
//        if let resume = resumeData {
//            backgroundSession().downloadTask(withResumeData: resume)
//        }
        self.downloadTask?.resume()
    }
    
    
    
    // MARK: - - URLSessionDownloadDelegate
    //下载进度
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress:Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print(String(format: "%.4f", progress))
        
//        self.performSelector(onMainThread: #selector(self.showProgress), with: progress, waitUntilDone: false)
        
        OperationQueue.main.addOperation {
            self.slider.value = progress
        }
    }
    
    //断点续传
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        let pro = Float(fileOffset)/Float(expectedTotalBytes)
        print("断点续传：\(pro)")
    }
    
    //下载完成
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        let savePath = cachePath!.appending("/reach.dmg")
        print(savePath)
        let url = URL(fileURLWithPath: savePath)
        
        do {
            try
            FileManager.default.copyItem(at: location, to: url)
        } catch _ {
            print("错误")
        }
        
        OperationQueue.main.addOperation {
            self.image.image = UIImage(contentsOfFile: savePath)
        }
    
//        self.resumeData = nil
        self.downloadTask = nil
    }
    
    
    // MARK: - - URLSessionTaskDelegate
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        }
    }

}

