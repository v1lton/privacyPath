import Foundation
import UIKit


@IBDesignable
public class GradientView: UIView {
    private var gradientLayer = CAGradientLayer()
    private var vertical: Bool = false
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Drawing code
        //fill view with gradient layer
        gradientLayer.frame = self.bounds
        //style and insert layer if not already inserted
        if gradientLayer.superlayer == nil {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
            gradientLayer.colors = [#colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
