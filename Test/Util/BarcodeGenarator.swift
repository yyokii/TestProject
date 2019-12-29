//
//  BarcodeGenarator.swift
//  Test
//
//  Created by 東原与生 on 2019/12/29.
//  Copyright © 2019 yyokii. All rights reserved.
//

import UIKit

enum InputCorrectionLevel: String {
    case L
    case M
    case Q
    case H
}

struct BarcodeGenaratorUtil {
    
    static func generateQRImage(frog string: String, correctionLevel: InputCorrectionLevel) -> UIImage? {
        
        guard let data = string.data(using: .utf8), let filter = CIFilter(name: "CIQRCodeGenerator")else
        { return nil }
            
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(correctionLevel.rawValue, forKey: "inputCorrectionLevel")
        
        if let image = filter.outputImage {
            return UIImage(ciImage: image)
        }
        
        return nil
    }
    
    static func generateBarcode(from string: String) -> UIImage? {
            
        guard let data = string.data(using: .utf8), let filter = CIFilter(name: "CICode128BarcodeGenerator") else { return nil }
                
        filter.setValue(data, forKey: "inputMessage")
        //            let transform = CGAffineTransform(scaleX: 3, y: 3)

        if let output = filter.outputImage {
            return UIImage(ciImage: output)
        }
        
        return nil
    }
    
}
