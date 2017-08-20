//
//  ViewController.swift
//  Task 11-1
//
//  Created by 🍋 on 2017/1/16.
//  Copyright © 2017年 🍋. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate {
    var dict = Dictionary<String,Int>()
    var age = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "data", ofType: "xml")!) as URL)
        parser?.delegate = self
        parser?.parse()
        
        print(self.dict)
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName=="person" {
            if  let age = attributeDict["age"]
            {
                self.age = Int(age)!
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let str = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if str != "" {
            self.dict["\(str)"] = self.age
        }
    }
}


