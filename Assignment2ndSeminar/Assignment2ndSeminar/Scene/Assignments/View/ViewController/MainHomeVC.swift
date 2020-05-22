//
//  MainHomeVC.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/27.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class MainHomeVC: UIViewController {
    
    //MARK:- Parallex
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var headerImageHeightConstraint:
    NSLayoutConstraint!
    
    let originHeaderImageHeight: CGFloat = 210
    let minimunImageHeight: CGFloat = 88
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScrollView.delegate = self
        mainScrollView.contentInsetAdjustmentBehavior = .never
        setImagesLooksLike()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setImagesLooksLike() {
        for i in 0..<images.count {
            let _: UIImageView = {
                let img = images[i]
                img.layer.cornerRadius = 20
                img.layer.borderWidth = 1
                img.layer.borderColor = UIColor.white.cgColor
                img.clipsToBounds = true
                
                return img
            }()
        }
    }
}

extension MainHomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            headerImageHeightConstraint.constant =
                originHeaderImageHeight - scrollView.contentOffset.y
        } else {
            var height = originHeaderImageHeight - scrollView.contentOffset.y
            height = height > minimunImageHeight ? height : minimunImageHeight
            headerImageHeightConstraint.constant = height
        }
    }
}
