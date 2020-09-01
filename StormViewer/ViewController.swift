//
//  ViewController.swift
//  StormViewer
//
//  Created by Truong Nguyen on 9/1/20.
//  Copyright © 2020 Truong Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        print(fm, "fm")
        
        let path = Bundle.main.resourcePath!
        print(path, "path")
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        print("items", items)
        
        for item in items {
            if item.hasPrefix("nssl") {
                print(item)
            }
        }
    }


}

