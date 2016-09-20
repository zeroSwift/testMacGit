//
//  ViewController.swift
//  tapColor
//
//  Created by www on 16/9/19.
//  Copyright © 2016年 www. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bView = UIButton(frame:CGRectMake(100,400,100,100))
    let colorAry = [UIColor.redColor(),UIColor.yellowColor(),UIColor.blueColor()]
    let nowColorAry:NSArray = [UIColor.redColor(),UIColor.yellowColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bView.layer.masksToBounds = true
        bView.layer.cornerRadius = 50
        bView.backgroundColor = nowColorAry[0] as? UIColor
        bView.tag = 1
        
        self.view.addSubview(self.bView)
        
        let tap = UITapGestureRecognizer(target: self,action: #selector(ViewController.tapAction(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tap)
        
    }
    
    var viewAry:[UIView] = []
    
    func tapAction(sener:UITapGestureRecognizer) {
        
        let timeView = UIView(frame:CGRectMake(100,400,100,100))
        timeView.layer.masksToBounds = true
        timeView.layer.cornerRadius = 50
        timeView.backgroundColor = self.bView.backgroundColor
        viewAry.append(timeView)
        if viewAry.count >= 2 {
            self.view.insertSubview(viewAry[viewAry.count-1], belowSubview: viewAry[viewAry.count-2])
        }else {
            self.view.addSubview(timeView)
        }
        
        self.bView.backgroundColor = self.nowColorAry[1-self.nowColorAry.indexOfObject(self.bView.backgroundColor!)] as? UIColor
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2)
        timeView.transform = CGAffineTransformMakeScale(0.001, 0.001)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(ViewController.animationOver))
        UIView.commitAnimations()
    }
    
    func animationOver() {
        
        if viewAry.count>0 {
            viewAry[0].removeFromSuperview()
            viewAry.removeAtIndex(0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

