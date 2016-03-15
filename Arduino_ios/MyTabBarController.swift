//
//  MyTabBarController.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/14.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
              super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITabBarControllerDelegateプロトコルを実装する
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("shouldSelectViewController")
        return true
    }
    //UITabBarControllerDelegateプロトコルを実装する
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print("didSelectViewController")
    }
    
}
