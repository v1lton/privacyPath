//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "Montserrat-SemiBold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

class MyViewController : UIViewController {
    let questionView = UIView()
    let backgroundImageView = UIImageView()
    let faceImageView = UIImageView()
    let lockImageView = UIImageView()
    let cloudImageView = UIImageView()
    let textLabel = UILabel()
    let nextButton = UIButton()
    let buttonImage: UIImage = UIImage(named: "next.png")!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupViews()
    }
    
    func setupViews() {
        setupBackgroundImageView()
        setupQuestionView()
        setupFaceImageView()
        setupLockImageView()
        setupCloudImageView()
        setupTextLabel()
        setupButton()
    }
    
    func setupQuestionView() {
        view.addSubview(questionView)
        questionView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.layer.cornerRadius = 12
        questionView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(questionView)
    }
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        backgroundImageView.image = UIImage(named: "background.png")
        backgroundImageView.alpha = 0.8
    }
    
    func setupButton() {
        questionView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 613, y: 354, width: 35, height: 45)
        nextButton.setImage(buttonImage, for: .normal)
    }
    
    func setupFaceImageView() {
        questionView.addSubview(faceImageView)
        faceImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        faceImageView.image = UIImage(named: "faceJoao.png")
    }
    
    func setupLockImageView() {
        questionView.addSubview(lockImageView)
        lockImageView.frame = CGRect(x: 636, y: 36, width: 68, height: 68)
        lockImageView.transform = CGAffineTransform(rotationAngle: 125.5)
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.image = UIImage(named: "lock.png")
    }
    
    func setupCloudImageView(){
        questionView.addSubview(cloudImageView)
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.frame = CGRect(x: 15, y: 370, width: 97, height: 97)
        cloudImageView.transform = CGAffineTransform(rotationAngle: 24.8)
        cloudImageView.image = UIImage(named: "cloud.png")
    }
    
    func setupTextLabel() {
        questionView.addSubview(textLabel)
        textLabel.frame = CGRect(x: 138, y: 43, width: 510, height: 400)
        textLabel.numberOfLines = 0
        let text = "Opa! Me chamo João e acredito que você possa me ajudar. (;\nEu estava andando em um parque e acabei me perdendo.\nEu até estou usando meu celular para encontrar o caminho de casa, mas percebi alguém me perseguindo..."
        textLabel.attributedText = setLineSpacing(lineSpacing: 15, text: text)
        textLabel.typeOn {
            self.textLabel.text = ""
        }
        textLabel.font = UIFont(name: "Montserrat-SemiBold", size: 26)
    }
    
    func setupShadow(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 12
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setLineSpacing(lineSpacing: Int,text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpacing)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        return attributedString
    }
}

let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 768, height: 600)
PlaygroundPage.current.liveView = mvc

extension UILabel {
    func typeOn(completion: (() -> Void)? = nil) {
        let characterArray = self.text!.characterArray
        var characterIndex = 0
        self.text! = ""
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
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
                completion?()
            }
        }
    }
}

extension String {
    var characterArray: [Character]{
        var characterArray = [Character]()
        for character in self {
            characterArray.append(character)
        }
        return characterArray
    }
}



