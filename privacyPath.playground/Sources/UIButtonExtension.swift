import Foundation
import UIKit

public extension UIButton {
    func flash(howManyTimes: Int) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = Float(howManyTimes)
        layer.add(flash, forKey: nil)
    }
    
    func unflash() {
        layer.removeAllAnimations()
    }
}
