//
//  SimpleSecondViewController.swift
//  Test
//
//  Created by 東原与生 on 2020/03/19.
//  Copyright © 2020 yyokii. All rights reserved.
//

import UIKit

class SimpleSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "simple second"
        
        // バックボタンのテキストを隠す、この画面では消えない。次の画面から消える
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = item
    }
    
    
    static func viewController() -> SimpleSecondViewController {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "SimpleSecond", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! SimpleSecondViewController
        return vc
    }
    
    @IBAction func tapButton(_ sender: Any) {
        let vc = SimpleSecondViewController.viewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
