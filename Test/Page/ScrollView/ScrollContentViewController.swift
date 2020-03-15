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
        let w = Int(changeHeightTargetView.frame.width)
        
        let label = UILabel(frame: CGRect(x: 0, y: labelHeight * labelCount, width: w, height: labelHeight))
        label.text = "test: \(labelCount)"
        
        let currentHeight = changeHeightTargetView.frame.height
        heightAnchor.constant = currentHeight + 50
        
        changeHeightTargetView.addSubview(label)
        labelCount += 1
    }
}
