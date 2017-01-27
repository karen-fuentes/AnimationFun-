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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewHiearchy()
        constraintConfiguration()
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
    
//MARK: - Constraint Configuration 
    func constraintConfiguration() {
        self.edgesForExtendedLayout = []
        
        //first row
        leftPurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.trailing.equalTo(middlePurpleView.snp.leading).offset(-20.0)
            view.top.equalToSuperview().offset(80.0)
        }
        middlePurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.centerX.equalToSuperview()
            view.top.equalToSuperview().offset(80.0)
        }
        rightPurpleView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.leading.equalTo(middlePurpleView.snp.trailing).offset(20.0)
            view.top.equalToSuperview().offset(80.0)
        }
        
        //second row
        leftBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.trailing.equalTo(middleBlueView.snp.leading).offset(-20.0)
            view.top.equalTo(leftPurpleView.snp.bottom).offset(20.0)
        }
        middleBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.centerX.equalToSuperview()
            view.top.equalTo(middlePurpleView.snp.bottom).offset(20.0)
        }
        rightBlueView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.leading.equalTo(middleBlueView.snp.trailing).offset(20.0)
            view.top.equalTo(rightPurpleView.snp.bottom).offset(20.0)
        }
        
        //third row
        leftYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.trailing.equalTo(middleYellowView.snp.leading).offset(-20.0)
            view.top.equalTo(leftBlueView.snp.bottom).offset(20.0)
        }
        middleYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.centerX.equalToSuperview()
            view.top.equalTo(middleBlueView.snp.bottom).offset(20.0)
        }
        rightYellowView.snp.makeConstraints { (view) in
            view.size.equalTo(CGSize(width: 100.00, height: 100.00))
            view.leading.equalTo(middleYellowView.snp.trailing).offset(20.0)
            view.top.equalTo(rightBlueView.snp.bottom).offset(20.0)
        }
        
        //button 
        resetButton.snp.makeConstraints { (button) in
            button.centerX.equalToSuperview()
            button.bottom.equalToSuperview().inset(20.0)
        }
    }
    
//Mark: - Reset Button functionality
    internal func snapBacktoPlace() {
        
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

