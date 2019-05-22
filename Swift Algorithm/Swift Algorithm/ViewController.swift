//
//  ViewController.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/19.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "LEETCODEISHIRING"
        let zco = ZConvert()
        print(zco.convert(string, 3))
    }
}

