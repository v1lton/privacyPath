import Foundation
import UIKit

public extension UITextView {
    func typeOn() {
        let characterArray = self.text!.characterArray
        var characterIndex = 0
        self.text! = ""
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            while characterArray[characterIndex] == " " {
                self.text!.append(" ")
                characterIndex += 1
                if characterIndex == characterArray.count {
                    timer.invalidate()
                    return
                }
            }
            self.text!.append(characterArray[characterIndex])
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
            }
        }
    }
}
