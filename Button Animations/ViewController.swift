//
//  ViewController.swift
//  Button Animations
//
//  Created by Alex on 4/16/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myBottomBtn = UIButton(type: .custom)

    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeBottomBtn(sender: myBottomBtn)
    }
    
    // MARK: - Actions
    @IBAction func firstBtnPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0) {
            sender.frame = CGRect(x: sender.frame.origin.x/2, y: sender.frame.origin.y/2, width: sender.frame.height, height: sender.frame.height)
            sender.makeCircle()
        }
    }
    
    @IBAction func pulseBtnPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.2, options: [.repeat], animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (_) in
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
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
    
    // MARK: - Functions
    func makeBottomBtn(sender: UIButton){
        // Hover button - to show when there are no messages between chat participants
        sender.frame = CGRect(x: 50, y: 50, width: 150, height: 40) // centered
                sender.layer.cornerRadius = 20
                sender.setTitle("Say Hi", for: .normal)
                sender.layer.masksToBounds = true
        sender.layer.backgroundColor = UIColor.blue.cgColor
        sender.titleLabel?.text = "Say Hi!"
                sender.isUserInteractionEnabled = true
                sender.titleLabel?.textColor = .black
    }
    
}

extension UIButton {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.layer.masksToBounds = true;
    }
}
