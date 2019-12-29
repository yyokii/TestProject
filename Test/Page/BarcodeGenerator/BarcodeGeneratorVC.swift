//
//  BarcodeGeneratorVC.swift
//  Test
//
//  Created by 東原与生 on 2019/12/29.
//  Copyright © 2019 yyokii. All rights reserved.
//
import UIKit

class BarcodeGeneratorVC: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var correctionLevelTextField: UITextField!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var code128Barcode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
        correctionLevelTextField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    enum InputCorrectionLevel: String {
        case L
        case M
        case Q
        case H
    }
    
    static func viewController() -> BarcodeGeneratorVC {
        let storyboard: UIStoryboard = UIStoryboard.init(name: "BarcodeGenerator", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! BarcodeGeneratorVC
        return vc
    }
    
    private var QRImage: UIImage? {
        guard let message = messageTextField.text,
            let correctionLevelString = correctionLevelTextField.text,
            let correctionLevel = InputCorrectionLevel(rawValue: correctionLevelString) else { return nil }
        let data = message.data(using: .utf8)!
        
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": correctionLevel.rawValue])!
        let image = UIImage(ciImage: qr.outputImage!)
        return image
    }
    
    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: .utf8)

        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
//            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
    @objc func textFieldDidChange() {
        qrImageView.image = QRImage
    }
    
    @IBAction func generateBarcode(_ sender: Any) {
        code128Barcode.image = generateBarcode(from: messageTextField.text!)
    }
}
