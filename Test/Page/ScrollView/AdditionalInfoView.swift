//
//  AdditionalInfoView.swift
//  cliiip-app-ios
//
//  Created by 東原　与生 on 2020/03/16.
//  Copyright © 2020 PCPhase. All rights reserved.
//

import UIKit

class AdditionalInfoView: UIView {
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var imageHeightAnchor: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    private func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
        
        let currentHeight = topImageView.frame.height
        imageHeightAnchor = topImageView.heightAnchor.constraint(equalToConstant: currentHeight)
        imageHeightAnchor.isActive = true
    }
    
    func configureView(descriptionText: String, topImageUrlString: String, imageWidth: Int, imageHeight: Int) {
        
        descriptionLabel.text = descriptionText

        // imageViewのサイズは、横幅固定（カードサイズの横幅100%）で画像アスペクト比に 合わせて縦幅可変にする
        let imageSizeRatio: CGFloat = CGFloat(imageHeight) / CGFloat(imageWidth)
        imageHeightAnchor.constant = self.frame.width * imageSizeRatio
    }
}
