//
//  ViewController.swift
//  balance
//
//  Created by Omar Brambilla on 10.11.20.
//  Copyright © 2020 Omar Brambilla. All rights reserved.
//

import UIKit

var date: NSDate

var timerStatus: Bool = false
var unixtime: Double = 0


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toggleTime(){
        date = NSDate() // current date
        unixtime = date.timeIntervalSince1970
               
    }

}

