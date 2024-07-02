//
//  ViewController.swift
//  DoubleShadowOnText
//
//  Created by FIX PRICE on 7/2/24.
//

import UIKit

final class LabelWithShadow: UILabel {
    
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

