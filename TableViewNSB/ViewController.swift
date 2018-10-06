//
//  ViewController.swift
//  TableViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/6/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "TableViewNSB"
        navigationController?.navigationBar.barTintColor = UIColor(r: 0, g: 255, b: 198)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
    }
}
