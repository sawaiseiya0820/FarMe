//
//  SecondViewController.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/16.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SecondViewController: UIViewController {

     var mainButton: UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
            setLayout()
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func setLayout() {
                // mainボタン生成.
        mainButton = UIButton(frame: CGRectMake(0, 0, 180, 180))//100
        mainButton.center = self.view.center
        
        // myCustomButtonクラスのインスタンス生成.
        let myCusButton: myCustomButton = myCustomButton(frame: self.view.frame)
        myCusButton.mainButton = self.mainButton
        myCusButton.mainPosition = self.mainButton.layer.position
        
        // インスタンスをviewに追加.
        self.view.addSubview(myCusButton)
        
        // mainボタン各設定.
        mainButton.layer.masksToBounds = true
        mainButton.layer.cornerRadius = 90//50.0
        mainButton.backgroundColor = UIColor.MainColor()
        mainButton.setTitle("Water!", forState: .Normal)
        mainButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mainButton.addTarget(myCusButton, action: "onDownMainButton:", forControlEvents: UIControlEvents.TouchDown)
       mainButton.addTarget(myCusButton, action: "onUpMainButton:", forControlEvents: UIControlEvents.TouchUpInside)
        //| UIControlEvents.TouchDragOutside)
        mainButton.tag = 0
        
        // mainボタンをviewに追加.
        self.view.addSubview(mainButton)

    }
    
}
extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    class func MainColor() -> UIColor {
        return UIColor.rgb(117, g: 216, b: 213, alpha: 1.0)
    }
}
