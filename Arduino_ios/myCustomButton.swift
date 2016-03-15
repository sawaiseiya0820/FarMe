//
//  myCustomButton.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/16.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class myCustomButton: UIView {
    
    // subボタン(飛び出すボタン)を生成
    var subButton_1: UIButton = UIButton()
    var subButton_2: UIButton = UIButton()
    var subButton_3: UIButton = UIButton()
    var subButton_4: UIButton = UIButton()
    var subButton_5: UIButton = UIButton()
    var subButton_6: UIButton = UIButton()
    var subButton_7: UIButton = UIButton()
    var subButton_8: UIButton = UIButton()
    var subButton_9: UIButton = UIButton()
    var subButton_10: UIButton = UIButton()
    var subButton_11: UIButton = UIButton()
    var subButton_12: UIButton = UIButton()
    var mainButton: UIButton!
    
    var colors: NSMutableArray!
    
    var mainPosition: CGPoint!
    
    //var viewControll: UIViewController = ViewController()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /*
    メインボタンイベント(Down)
    */
    func onDownMainButton(sender: UIButton) {
        
        // 背景を黒色に設定.
         Alamofire.request(.GET, "http://1192.168.100.200", parameters: [ "name" : 1])
        
//        self.backgroundColor = UIColor.blackColor()
        
        UIView.animateWithDuration(0.06,
            
            // アニメーション中の処理.
            animations: { () -> Void in
                
                // 縮小用アフィン行列を生成する.
                sender.transform = CGAffineTransformMakeScale(0.9, 0.9)
            })
            { (Bool) -> Void in
        }
    }
    
    /*
    subボタンの座標を返すメソッド
    */
    func getPosition(angle: CGFloat, radius: CGFloat) -> CGPoint {
        
        // 度からラジアンに変換.
        let radian = angle * CGFloat(M_PI) / 180.0
        
        // x座標を計算.
        let x_position:CGFloat = mainButton.layer.position.x + radius * cos(radian)
        
        // y座標を計算.
        let y_position = mainPosition.y + radius * sin(radian)
        let position = CGPointMake(x_position, y_position)
        
        return position
    }
    
    /*
    メインボタンイベント(Up)
    */
    func onUpMainButton(sender: UIButton) {
        
        // subボタンを配列に格納.
        let buttons = [subButton_1, subButton_2, subButton_3, subButton_4, subButton_5,subButton_6,subButton_7,subButton_8,subButton_9,subButton_10,subButton_11,subButton_12]
        
        // subボタン用の　UIColorを配列に格納.
        colors = [UIColor.MainColor(), UIColor.MainColor(), UIColor.MainColor(), UIColor.MainColor(), UIColor.MainColor()] as NSMutableArray
        
        // mainボタンからの距離(半径).
        let radius: CGFloat = 160//150
        
        // subボタンに各種設定.
        for var i = 0; i < buttons.count; i++ {
            buttons[i].frame = CGRectMake(0, 0, 60, 60)
            buttons[i].layer.cornerRadius = 30.0
            buttons[i].backgroundColor = UIColor.MainColor()//colors[i] as? UIColor
            buttons[i].center = self.center
            buttons[i].addTarget(self, action: "onClickSubButtons:", forControlEvents: UIControlEvents.TouchUpInside)
            buttons[i].tag = i+1
            
            // subボタンをviewに追加.
            self.addSubview(buttons[i])
        }
        
        UIView.animateWithDuration(0.06,
            
            // アニメーション中の処理.
            animations: { () -> Void in
                
                // 拡大用アフィン行列を作成する.
                sender.transform = CGAffineTransformMakeScale(0.4, 0.4)
                
                sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(8.0,//0.7
            delay: 0.0,
            
            // バネを設定.
            usingSpringWithDamping: 0.5,
            
            // バネの弾性力.
            initialSpringVelocity: 1.5,
            options: UIViewAnimationOptions.CurveEaseIn,
            
            // アニメーション中の処理.
            animations: { () -> Void in
                
                // subボタンに座標を設定.
                self.subButton_1.layer.position = self.getPosition(-90, radius: radius)
                self.subButton_2.layer.position = self.getPosition(-30, radius: radius)
                self.subButton_3.layer.position = self.getPosition(-60, radius: radius)
                self.subButton_4.layer.position = self.getPosition(-120, radius: radius)
                self.subButton_5.layer.position = self.getPosition(-150, radius: radius)
                self.subButton_6.layer.position = self.getPosition(-180, radius: radius)
                self.subButton_7.layer.position = self.getPosition(-210, radius: radius)
                self.subButton_8.layer.position = self.getPosition(-240, radius: radius)
                self.subButton_9.layer.position = self.getPosition(-270, radius: radius)
                self.subButton_10.layer.position = self.getPosition(-300, radius: radius)
                self.subButton_11.layer.position = self.getPosition(-330, radius: radius)
                self.subButton_12.layer.position = self.getPosition(-360, radius: radius)
                
            }) { (Bool) -> Void in
                
                
                self.subButton_1.layer.position = self.getPosition(-90, radius: 0)
                self.subButton_2.layer.position = self.getPosition(-30, radius: 0)
                self.subButton_3.layer.position = self.getPosition(-60, radius: 0)
                self.subButton_4.layer.position = self.getPosition(-120, radius: 0)
                self.subButton_5.layer.position = self.getPosition(-150, radius: 0)
                self.subButton_6.layer.position = self.getPosition(-180, radius: 0)
                self.subButton_7.layer.position = self.getPosition(-210, radius: 0)
                self.subButton_8.layer.position = self.getPosition(-240, radius: 0)
                self.subButton_9.layer.position = self.getPosition(-270, radius: 0)
                self.subButton_10.layer.position = self.getPosition(-300, radius: 0)
                self.subButton_11.layer.position = self.getPosition(-330, radius: 0)
                self.subButton_12.layer.position = self.getPosition(-360, radius: 0)

                Alamofire.request(.GET, "http://1192.168.100.200", parameters: [ "name" : 0])
                self.post()
        }
    }
    
    
    /*
    subボタンイベント
    背景の色を設定.
    */
    func onClickSubButtons(sender: UIButton) {
        
        // 背景色をsubボタンの色に設定.
        switch(sender.tag) {
        case 1:
            self.backgroundColor = colors[0] as? UIColor
        case 2:
            self.backgroundColor = colors[1] as? UIColor
        case 3:
            self.backgroundColor = colors[2] as? UIColor
        case 4:
            self.backgroundColor = colors[3] as? UIColor
        case 5:
            self.backgroundColor = colors[4] as? UIColor
        case 6:
            self.backgroundColor = colors[0] as? UIColor
        case 7:
            self.backgroundColor = colors[1] as? UIColor
        case 8:
            self.backgroundColor = colors[2] as? UIColor
        case 9:
            self.backgroundColor = colors[3] as? UIColor
        case 10:
            self.backgroundColor = colors[4] as? UIColor
        case 11:
            self.backgroundColor = colors[3] as? UIColor
        case 12:
            self.backgroundColor = colors[4] as? UIColor

        default:
            self.backgroundColor = UIColor.blackColor()
        }
    }
    private func post(){
        let notif = UILocalNotification()
        notif.fireDate = NSDate(timeIntervalSinceNow: 5) //5秒後
        notif.timeZone = NSTimeZone.defaultTimeZone()
        notif.alertBody = "おいしかったよ！！！！ごちそうさま！"
        notif.alertAction = "OK"
        notif.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notif)
        

    }
    
}