//
//  ViewController.swift
//  StormViewer
//
//  Created by Truong Nguyen on 9/1/20.
//  Copyright © 2020 Truong Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        // make large title like Setting app, scroll make it small
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        print(fm, "fm")
        
        // https://www.hackingwithswift.com/example-code/system/how-to-find-the-path-to-a-file-in-your-bundle
        // It’s common to store resource data like text files and sound effects inside your bundle
        
        // Bundle.main: Returns the bundle object that contains the current executable.
        
        let path = Bundle.main.resourcePath! // ios app always has resourcePath, but use ! for others
        print(path, "path")
        
        let items = try! fm.contentsOfDirectory(atPath: path) // force try, can crash if can not try
        print("items", items)
        
        print("pictures", pictures)
        
        for item in items {
            if item.hasPrefix("nssl") {
                print(item)
                
                pictures.append(item)
            }
        }
        
        print("pictures_2", pictures)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        print(indexPath, indexPath.row, "indexPath")
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { // check type of vc must be DetailViewController
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
