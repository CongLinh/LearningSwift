//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by nguyen van cong linh on 25/06/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//


//ĐÂY LÀ BÀI HỌC VỀ GESTURERECOGNIZER

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        view.backgroundColor = UIColor.white
        
        view.addSubview(avatar)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": avatar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": avatar]))
        avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        //SwipeGester
        //let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        //swipeGesture.direction = .left
        //view.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        print("đang vuốt")
    }
    
    //Khai báo phải là lazy var, khai báo let không Tap được, chưa hiểu vì sao lại thế???
    lazy var avatar: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "avatar")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 50
        imgView.translatesAutoresizingMaskIntoConstraints = false

        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        //imgView.addGestureRecognizer(tapGesture)
        
        //imgView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(handleScale(sender:))))
        
        //imgView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(handleRota(sender:))))
        
        //PanGesture:
        //let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        //panGesture.minimumNumberOfTouches = 1
        //imgView.addGestureRecognizer(panGesture)
        
        
        
        
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    
    //Xử lý hành động chạm vào ảnh
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("Hhâhhahah")
    }
    
    //Xử lý hành động phóng to hoặc thu nhỏ ảnh
    @objc func handleScale(sender: UIPinchGestureRecognizer) {
        avatar.transform = avatar.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    
    //Xoay hình ảnh bằng 2 ngón tay:
    @objc func handleRota(sender: UIRotationGestureRecognizer) {
        print("Đang xoay ảnh")
        avatar.transform = avatar.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    //Xử lý di chuyển ảnh:
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        print("Đang di chuyển")
        avatar.transform = avatar.transform.translatedBy(x: sender.translation(in: view).x, y: sender.translation(in: view).y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    
    
    
}



























