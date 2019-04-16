//
//  ViewController.swift
//  Button Animations
//
//  Created by Alex on 4/16/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func firstBtnPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0) {
            sender.frame = CGRect(x: sender.frame.origin.x/2, y: sender.frame.origin.y/2, width: sender.frame.height, height: sender.frame.height)
            sender.makeCircle()
        }
    }
    
    @IBAction func lastBtnPressed(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })})
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
       
        // heartbeat animation
        sender.isUserInteractionEnabled = true
        sender.isEnabled = true
        
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 0.6
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.12
        pulse1.autoreverses = true
        pulse1.repeatCount = 1
        pulse1.initialVelocity = 0.5
        pulse1.damping = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.7
        animationGroup.repeatCount = 1000
        animationGroup.animations = [pulse1]
        
        sender.layer.add(animationGroup, forKey: "pulse")
    }
}

extension UIButton {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.layer.masksToBounds = true;
    }
}
