//
//  ViewController.swift
//  AnimationFun
//
//  Created by Karen Fuentes on 1/26/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit
import SnapKit 

class ViewController: UIViewController {
    
    //var dynamicAnimator: UIDynamicAnimator? = nil
    let viewanimotors = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: nil)
    let squareSize = CGSize(width: 100.0, height: 100.0)


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewHiearchy()
        constraintConfiguration()
        //self.dynamicAnimator = UIDynamicAnimator(referenceView: view)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        let gravityBehaivor = UIGravityBehavior(items: [leftYellowView,leftBlueView,leftPurpleView,
//                                                    middleYellowView,middleBlueView,middlePurpleView,
//                                                    rightYellowView,rightBlueView,rightPurpleView])
//        gravityBehaivor.magnitude = 0.2
//        self.dynamicAnimator?.addBehavior(gravityBehaivor)
//        
//        let collisionBehaivor = UICollisionBehavior(items: [leftYellowView,leftBlueView,leftPurpleView,
//                                                    middleYellowView,middleBlueView,middlePurpleView,
//                                                    rightYellowView,rightBlueView,rightPurpleView])
//        collisionBehaivor.translatesReferenceBoundsIntoBoundary = true
//        self.dynamicAnimator?.addBehavior(collisionBehaivor)
        
    }
    
// Mark: - Setting up view Hiearchy
    
    func viewHiearchy() {
        self.view.addSubview(leftPurpleView)
        self.view.addSubview(middlePurpleView)
        self.view.addSubview(rightPurpleView)
        self.view.addSubview(leftBlueView)
        self.view.addSubview(middleBlueView)
        self.view.addSubview(rightBlueView)
        self.view.addSubview(leftYellowView)
        self.view.addSubview(middleYellowView)
        self.view.addSubview(rightYellowView)
        self.view.addSubview(resetButton)
        
        self.resetButton.addTarget(self, action: #selector(snapBacktoPlace), for: .touchUpInside)

    }
    
    // Mark: - Movement 
    
    internal func move(view: UIView, to point: CGPoint) {
        view.snp.remakeConstraints { (view) in
            view.center.equalTo(point)
            view.size.equalTo(squareSize)
        }
        let animator = UIViewPropertyAnimator(duration: 2.0, dampingRatio: 0.9) { 
            self.view.layoutIfNeeded()
        }
        animator.addAnimations({
            view.transform = CGAffineTransform.identity
        }, delayFactor: 0.85)
        
        animator.startAnimation()
    }
    
    //Mark: - Tracking Touches 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            print("No touching!")
            return
        }
        
        let touchLocationInView = touch.location(in: view)
            print("Touch at: \(touchLocationInView)")
        
        let touchInLPurple = leftPurpleView.frame.contains(touch.location(in: view))
        let touchInMPurple = middlePurpleView.frame.contains(touch.location(in: view))
        let touchInRPurple = rightPurpleView.frame.contains(touch.location(in: view))
        
        let touchInLBlue = leftBlueView.frame.contains(touch.location(in: view))
        let touchInMBlue = middleBlueView.frame.contains(touch.location(in: view))
        let touchInRBlue = rightBlueView.frame.contains(touch.location(in: view))
        
        let touchInLYellow = leftYellowView.frame.contains(touch.location(in: view))
        let touchInMYellow = middleYellowView.frame.contains(touch.location(in: view))
        let touchInRYelow = rightYellowView.frame.contains(touch.location(in: view))
    
       
        
        if touchInLPurple{
            move(view: leftPurpleView, to: touchLocationInView)
        }
        if touchInMPurple{
             move(view: middlePurpleView, to: touchLocationInView)
        }
        if touchInRPurple{
            move(view: rightPurpleView, to: touchLocationInView)
        }
        
        
        if touchInLBlue{
            move(view: leftBlueView, to: touchLocationInView)
        }
        if touchInRBlue{
            move(view: rightBlueView, to: touchLocationInView)
        }
        if touchInMBlue{
            move(view: middleBlueView, to: touchLocationInView)
        }
        
        if touchInLYellow{
            move(view: leftYellowView, to: touchLocationInView)
        }
        if touchInMYellow{
            move(view: middleYellowView, to: touchLocationInView)
        }
        if touchInRYelow{
            move(view: rightYellowView, to: touchLocationInView)
        }
        

    }
    
//MARK: - Constraint Configuration 
    func constraintConfiguration() {
        self.edgesForExtendedLayout = []
        
        leftPurpleView.snp.removeConstraints()
        middlePurpleView.snp.removeConstraints()
        rightPurpleView.snp.removeConstraints()
        
        leftBlueView.snp.removeConstraints()
        middleBlueView.snp.removeConstraints()
        rightBlueView.snp.removeConstraints()
        
        leftYellowView.snp.removeConstraints()
        middleYellowView.snp.removeConstraints()
        rightYellowView.snp.removeConstraints()
        
        //first row
        leftPurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(-120.0)
            view.top.equalToSuperview().offset(80.0)
        }
        middlePurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview()
            view.top.equalToSuperview().offset(80.0)
        }
        rightPurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(120.0)
            view.top.equalToSuperview().offset(80.0)
        }
        
        //second row
        leftBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(-120.0)
             view.top.equalToSuperview().offset(200.00)
        }
        middleBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview()
            view.top.equalToSuperview().offset(200.00)
        }
        rightBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(120.0)
            view.top.equalToSuperview().offset(200.00)
        }
        
        //third row
        leftYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(-120.0)
            view.top.equalToSuperview().offset(320.00)
        }
        middleYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview()
            view.top.equalToSuperview().offset(320.00)
        }
        rightYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(squareSize)
            view.centerX.equalToSuperview().offset(120.0)
            view.top.equalToSuperview().offset(320.00)
        }
        
        //button 
        resetButton.snp.makeConstraints { (button) in
            button.centerX.equalToSuperview()
            button.bottom.equalToSuperview().inset(20.0)
        }
    }
    
//Mark: - Reset Button functionality
    internal func snapBacktoPlace() {
    viewanimotors.isReversed = true
    let _ = [
        leftPurpleView,
        middlePurpleView,
        rightPurpleView,
        leftBlueView,
        middleBlueView,
        rightBlueView,
        leftYellowView,
       middleYellowView,
        rightYellowView
    ].map{$0.transform = CGAffineTransform.identity}
        constraintConfiguration()
    }
    
    
//MARK: - View Instances
  
    //first row
  internal lazy var leftPurpleView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor(red: 190/253, green: 144/253, blue: 212/253, alpha: 1.0)
    return view
  }()
    
    internal lazy var middlePurpleView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 155/253, green: 89/253, blue: 182/253, alpha: 1.0)
        return view
    }()
    
    internal lazy var rightPurpleView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 103/253, green: 65/253, blue: 114/250, alpha: 1.0)
        return view
    }()
    
    //second row 
    internal lazy var leftBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 107/253, green: 185/253, blue: 240/253, alpha: 1.0)
        return view
    }()
    
    internal lazy var middleBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 52/253, green: 152/253, blue: 219/253, alpha: 1.0)
        return view
    }()
    
    internal lazy var rightBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 37/253, green: 116/253, blue: 164/250, alpha: 1.0)
        return view
    }()
    //third row
    internal lazy var leftYellowView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 244/253, green: 179/253, blue: 80/253, alpha: 1.0)
        return view
    }()
    
    internal lazy var middleYellowView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 235/253, green: 151/253, blue: 78/253, alpha: 1.0)
        return view
    }()
    
    internal lazy var rightYellowView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 196/253, green: 115/253, blue: 57/250, alpha: 1.0)
        return view
    }()
    // reset button
    internal lazy var resetButton: UIButton = {
        let button: UIButton = UIButton(type: .roundedRect)
        button.setTitle("Reset", for: .normal)
        return button
    }()
}

