//
//  SimpleViewController.swift
//  Test
//
//  Created by 東原与生 on 2020/03/19.
//  Copyright © 2020 yyokii. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func viewController() -> SimpleViewController {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "Simple", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! SimpleViewController
        return vc
    }
    
    @IBAction func tapButton(_ sender: Any) {
        let vc = SimpleSecondViewController.viewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
