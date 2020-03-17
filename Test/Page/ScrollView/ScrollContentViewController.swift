//
//  ScrollContentViewController.swift
//  Test
//
//  Created by 東原与生 on 2020/03/15.
//  Copyright © 2020 yyokii. All rights reserved.
//

import UIKit

class ScrollContentViewController: UIViewController {
    @IBOutlet weak var changeHeightTargetView: UIView!
    
    @IBOutlet weak var baseStackView: UIStackView!
    
    var heightAnchor:NSLayoutConstraint!
    
    let labelHeight = 50
    var labelCount:Int = 0
    
    static func viewController() -> ScrollContentViewController {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "ScrollContentViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ScrollContentViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentHeight = changeHeightTargetView.frame.height
        heightAnchor = changeHeightTargetView.heightAnchor.constraint(equalToConstant: currentHeight)
        heightAnchor.isActive = true
    }
    
    @IBAction func tapChangeHeightButton(_ sender: Any) {
        
        insertViewToStackView()
        
        //        let w = Int(changeHeightTargetView.frame.width)
        //
        //        let label = UILabel(frame: CGRect(x: 0, y: labelHeight * labelCount, width: w, height: labelHeight))
        //        label.text = "test: \(labelCount)"
        //
        //        let currentHeight = changeHeightTargetView.frame.height
        //        heightAnchor.constant = currentHeight + 50
        //
        //        changeHeightTargetView.addSubview(label)
        //        labelCount += 1
    }
    
    func insertViewToStackView() {
        //        let view1 = UIView()
        //        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        view1.backgroundColor = UIColor.green
        //
        //        let view2 = UIView()
        //        view2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        view2.backgroundColor = UIColor.orange
        //
        //        baseStackView.insertArrangedSubview(view1, at: 2)
        //        baseStackView.insertArrangedSubview(view2, at: 3)
        
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.green
        baseStackView.insertArrangedSubview(view1, at: 2)
        
        let additionalInfoView = AdditionalInfoView(frame: CGRect(x: 0, y: 0, width: baseStackView.frame.width, height: 10))
        additionalInfoView.configureView(descriptionText: "test_text\ntest_text\ntest_text\ntest_text\ntest_text", topImageUrlString: "test_url", imageWidth: 200, imageHeight: 100)
        additionalInfoView.translatesAutoresizingMaskIntoConstraints = false
        view1.addSubview(additionalInfoView)
        
        additionalInfoView.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 0.0).isActive = true
        additionalInfoView.topAnchor.constraint(equalTo: view1.topAnchor, constant: 0.0).isActive = true
        additionalInfoView.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0.0).isActive = true
        additionalInfoView.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0.0).isActive = true
        
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.green
        baseStackView.insertArrangedSubview(view2, at: 3)
        
        let additionalInfoView2 = AdditionalInfoView(frame: CGRect(x: 0, y: 0, width: baseStackView.frame.width, height: 10))
        additionalInfoView2.configureView(descriptionText: "test_text", topImageUrlString: "test_url", imageWidth: 300, imageHeight: 300)
        additionalInfoView2.translatesAutoresizingMaskIntoConstraints = false
        view2.addSubview(additionalInfoView2)
        
        additionalInfoView2.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 0.0).isActive = true
        additionalInfoView2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 0.0).isActive = true
        additionalInfoView2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0.0).isActive = true
        additionalInfoView2.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 0.0).isActive = true
    }
}
