import UIKit
import CoreImage.CIFilterBuiltins

final class ViewController: UIViewController {
    private let label: LabelWithDoubleShadow2 = {
        let label = LabelWithDoubleShadow2()
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .semibold)
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
