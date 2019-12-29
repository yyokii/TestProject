//
//  ViewController.swift
//  Test
//
//  Created by 東原与生 on 2019/12/29.
//  Copyright © 2019 yyokii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generateBarcode(_ sender: Any) {
        let vc = BarcodeGeneratorVC.viewController()
        self.present(vc, animated: true, completion: nil)
    }
}

