import UIKit

class LabelWithDoubleShadow2: UILabel {
    private let firstShadowLayer = CATextLayer()
    private let secondShadowLayer = CATextLayer()

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
            firstShadowLayer.fontSize = font.pointSize
            secondShadowLayer.fontSize = font.pointSize
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = false
        firstShadowLayer.masksToBounds = false
        secondShadowLayer.masksToBounds = false
        layer.addSublayer(firstShadowLayer)
        layer.addSublayer(secondShadowLayer)

        firstShadowLayer.shadowOffset = CGSize(width: 0, height: 2)
        firstShadowLayer.shadowColor = Self.firstShadowDefaultColor.cgColor
        firstShadowLayer.shadowOpacity = 0.5

        secondShadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        secondShadowLayer.shadowColor = Self.secondShadowDefaultColor.cgColor
        secondShadowLayer.shadowOpacity = 0.2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        firstShadowLayer.frame = bounds
        secondShadowLayer.frame = bounds
    }

    func setShadow(hasShadow: Bool, color: UIColor?) {
        guard hasShadow else {
            firstShadowLayer.shadowOpacity = 1
            secondShadowLayer.shadowOpacity = 1
            return
        }

        if let color, hasShadow {
            firstShadowLayer.shadowColor = color.cgColor
            secondShadowLayer.shadowColor = color.cgColor
            firstShadowLayer.shadowOpacity = 1
            secondShadowLayer.shadowOpacity = 1
            return
        }

        if hasShadow {
            firstShadowLayer.shadowColor = Self.firstShadowDefaultColor.cgColor
            secondShadowLayer.shadowColor = Self.secondShadowDefaultColor.cgColor
            firstShadowLayer.shadowOpacity = 1
            secondShadowLayer.shadowOpacity = 1
        }
    }
}

private extension LabelWithDoubleShadow2 {
    static let firstShadowDefaultColor = UIColor.green
    static let secondShadowDefaultColor = UIColor.red
}
