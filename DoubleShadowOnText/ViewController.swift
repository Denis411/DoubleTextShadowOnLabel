//
//  ViewController.swift
//  DoubleShadowOnText
//
//  Created by FIX PRICE on 7/2/24.
//

import UIKit
import CoreImage.CIFilterBuiltins

final class LabelWithShadow: UILabel {
    let firstShadowLayer = CATextLayer()
    let secondShadowLayer = CATextLayer()
    
    let firstShadowBlur = CIFilter.bokehBlur()
    let secondShadowBlur = CIFilter.bokehBlur()
    
    override var text: String? {
        didSet {
            firstShadowLayer.string = text
            secondShadowLayer.string = text
        }
    }
    
    override var font: UIFont! {
        didSet {
            firstShadowLayer.font = font
            secondShadowLayer.font = font
            firstShadowLayer.fontSize = 40
            secondShadowLayer.fontSize = 40
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = false
        firstShadowLayer.masksToBounds = false
        secondShadowLayer.masksToBounds = false
        layer.addSublayer(firstShadowLayer)
        layer.addSublayer(secondShadowLayer)
        
        firstShadowLayer.shadowOffset = CGSize(width: 0, height: 2)
        firstShadowLayer.shadowColor = Self.firstShadowDefaultColor.cgColor
        firstShadowLayer.shadowOpacity = 0.5
        
        firstShadowBlur.radius = 2.0
        firstShadowLayer.filters = [firstShadowBlur]
        
        secondShadowLayer.shadowOffset = CGSize(width: 0, height: 2)
        secondShadowLayer.shadowColor = Self.secondShadowDefaultColor.cgColor
        secondShadowLayer.shadowOpacity = 0.2
        
        secondShadowBlur.radius = 16.0
        secondShadowLayer.filters = [secondShadowBlur]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstShadowLayer.frame = self.bounds
        secondShadowLayer.frame = self.bounds
    }
    
    func setShadowColor(color: UIColor) {
        firstShadowLayer.shadowColor = color.cgColor
        secondShadowLayer.shadowColor = color.cgColor
    }
}

private extension LabelWithShadow {
    static let firstShadowDefaultColor = UIColor(red: 0, green: 0, blue: 85, alpha: 1)
    static let secondShadowDefaultColor = UIColor(red: 0, green: 0, blue: 119, alpha: 1)
}

final class ViewController: UIViewController {
    private let label: LabelWithShadow = {
        let label = LabelWithShadow()
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.text = "Новинки"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(label)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.frame.size = label.intrinsicContentSize
        label.center = view.center
    }

}

