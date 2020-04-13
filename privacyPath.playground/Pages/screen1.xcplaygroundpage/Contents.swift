//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL1 = Bundle.main.url(forResource: "Montserrat-SemiBold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL1, CTFontManagerScope.process, nil)
let cfURL2 = Bundle.main.url(forResource: "BalooThambi2-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)

let answers = [(false, true, false)]
var buttonStateAuxiliar = (0, 0, 0)

class MyViewController : UIViewController {
    var pageNumber = 3
    var questionNumber = 0
    var progressBarNumber = 0.94
    let texts = Texts()
    
    //****UIs****
    //UIView
    let historyView = UIView()
    let questionView = UIView()
    
    //UIButton
    let nextButton = UIButton()
    let joaoButton = UIButton()
    let firstQuestionButton = UIButton()
    let secondQuestionButton = UIButton()
    let thirdQuestionButton = UIButton()
    let plusButton = UIButton()
    
    //UIImage
    let buttonImage: UIImage = UIImage(named: "next.png")!
    
    //UIImageView
    let backgroundImageView = UIImageView()
    let faceImageView = UIImageView()
    let lockImageView = UIImageView()
    let cloudImageView = UIImageView()
    let elipseBlueImageView = UIImageView()
    let thiefImageView = UIImageView()
    let faceJoaoImageView = UIImageView()
    
    //UILabel
    let questionLabel = UILabel()
    
    //UITextView
    let textLabel = UITextView()
    
    //UIProgressView
    let progressView = UIProgressView()
    
    //UITapGestureRecognizer
    let tap = UITapGestureRecognizer()
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupViews()
    }
    
    override func viewDidLoad() {
        nextButton.addTarget(self, action: #selector(MyViewController.touchedNextButton), for: .touchUpInside)
        joaoButton.addTarget(self, action: #selector(MyViewController.touchedJoaoButton), for: .touchUpInside)
        firstQuestionButton.addTarget(self, action: #selector(MyViewController.touchedFirstQuestionButton), for: .touchUpInside)
        secondQuestionButton.addTarget(self, action: #selector(MyViewController.touchedSecondQuestionButton), for: .touchUpInside)
        thirdQuestionButton.addTarget(self, action: #selector(MyViewController.touchedThirdQuestionButton), for: .touchUpInside)
        plusButton.addTarget(self, action:#selector(MyViewController.touchedPlusButton), for: .touchUpInside)
        view.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(MyViewController.handleTap))
    }
    
    @objc func handleTap() {
        print(tap.location(in: view))
    }
    
    //MARK: Setups
    func setupViews() {
        setupBackgroundImageView()
        setupJoaoButton()
        setupProgressView()
        //setupHistoryView()
        setupFaceImageView()
        setupLockImageView()
        setupCloudImageView()
        setupTextLabel(pageNumber: 0)
        setupNextButton()
    }
    
    func setupJoao
    
    @objc func touchedPlusButton() {
        progressBarNumber -= 0.06
        progressView.setProgress(Float(progressBarNumber), animated: true)
    }
    
    func setupPlusButton() {
        view.addSubview(plusButton)
        plusButton.backgroundColor = .red
        plusButton.frame = CGRect(x: 58, y: 163, width: 628, height: 73)
    }
    
    func setupProgressView() {
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 118, y: 50, width: 207, height: 1200)
        let gradientView = GradientView(frame: progressView.bounds)
        progressView.trackImage = UIImage(view: gradientView)
        progressView.transform = CGAffineTransform(scaleX: -1.0, y: 13)
        progressView.layer.cornerRadius = 12
        progressView.progressTintColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1) //#4D4D4D
        progressView.progress = 1
        progressView.setProgress(Float(progressBarNumber), animated: false)
    }
    
    func setupJoaoButton() {
        view.addSubview(joaoButton)
        joaoButton.frame = CGRect(x: 128.5, y: 357, width: 28, height: 28)
        joaoButton.setImage(UIImage(named:"dotJoao.png"), for: .normal)
    }
    
    func setupFirstQuestionButton() {
        questionView.addSubview(firstQuestionButton)
        firstQuestionButton.frame = CGRect(x: 58, y: 163, width: 628, height: 73)
        firstQuestionButton.layer.cornerRadius = 12
        firstQuestionButton.backgroundColor = .white
        firstQuestionButton.setTitle(texts.firstQuestionButtonTexts[questionNumber], for: .normal)
        firstQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal) //#2529A
    }
    
    func setupSecondQuestionButton() {
        questionView.addSubview(secondQuestionButton)
        secondQuestionButton.frame = CGRect(x: 58, y: 258, width: 628, height: 73)
        secondQuestionButton.layer.cornerRadius = 12
        secondQuestionButton.backgroundColor = .white
        secondQuestionButton.setTitle(texts.secondQuestionButtonTexts[questionNumber], for: .normal)
        secondQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal)
        secondQuestionButton.setTitleColor(.white, for: .selected)
    }
    
    func setupThirdQuestionButton() {
        questionView.addSubview(thirdQuestionButton)
        thirdQuestionButton.frame = CGRect(x: 58, y: 352, width: 628, height: 73)
        thirdQuestionButton.layer.cornerRadius = 12
        thirdQuestionButton.backgroundColor = .white
        thirdQuestionButton.setTitle(texts.thirdQuestionButtonTexts[questionNumber], for: .normal)
        thirdQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal)
        thirdQuestionButton.setTitleColor(.white, for: .selected)
    }
    
    func setupQuestionView() {
        view.addSubview(questionView)
        questionView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.layer.cornerRadius = 12
        questionView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(questionView)
    }
    
    func setupHistoryView() {
        view.addSubview(historyView)
        historyView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        historyView.translatesAutoresizingMaskIntoConstraints = false
        historyView.layer.cornerRadius = 12
        historyView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(historyView)
    }
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        backgroundImageView.image = UIImage(named: "background.png")
        //backgroundImageView.alpha = 0.8
    }
    
    func setupNextButton() {
        historyView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 700, y: 450, width: 35, height: 45)
        nextButton.setImage(buttonImage, for: .normal)
    }
    
    func setupFaceImageView() {
        historyView.addSubview(faceImageView)
        faceImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        historyView.translatesAutoresizingMaskIntoConstraints = false
        faceImageView.image = UIImage(named: "faceJoao.png")
    }
    
    func setupThiefImageView() {
        questionView.addSubview(thiefImageView)
        thiefImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        thiefImageView.image = UIImage(named: "thief.png")
    }
    
    func setupLockImageView() {
        historyView.addSubview(lockImageView)
        lockImageView.frame = CGRect(x: 650, y: 36, width: 68, height: 68)
        lockImageView.transform = CGAffineTransform(rotationAngle: 125.5)
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.image = UIImage(named: "lock.png")
    }
    
    func setupCloudImageView(){
        historyView.addSubview(cloudImageView)
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.frame = CGRect(x: 15, y: 370, width: 97, height: 97)
        cloudImageView.transform = CGAffineTransform(rotationAngle: 24.8)
        cloudImageView.image = UIImage(named: "cloud.png")
    }
    
    func setupTextLabel(pageNumber: Int) {
        historyView.addSubview(textLabel)
        textLabel.frame = CGRect(x: 138, y: 43, width: 510, height: 400)
        textLabel.attributedText = setLineSpacing(lineSpacing: 15, text: texts.presentetionTexts[pageNumber])
        textLabel.typeOn()
        textLabel.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        textLabel.backgroundColor = historyView.backgroundColor
        textLabel.isUserInteractionEnabled = false
    }
    
    func setupQuestionLabel() {
        questionView.addSubview(questionLabel)
        questionLabel.frame = CGRect(x: 132, y: 22, width: 504, height: 110)
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name:"BalooThambi2-Bold", size: 20)
        questionLabel.text = texts.questionTexts[questionNumber]
        questionLabel.textAlignment = .center
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
    
    func showQuestionView() {
        setupQuestionView()
        setupThiefImageView()
        setupQuestionLabel()
        questionView.addSubview(lockImageView)
        questionView.addSubview(cloudImageView)
        setupFirstQuestionButton()
        setupSecondQuestionButton()
        setupThirdQuestionButton()
    }
    
    @IBAction func touchedNextButton() {
        if pageNumber < 3 {
            pageNumber += 1
            setupTextLabel(pageNumber: pageNumber)
        } else {
            historyView.isHidden = true
            backgroundImageView.alpha = 1
            joaoButton.flash()
        }
    }
    
    @IBAction func touchedJoaoButton(_ sender:UIButton) {
        showQuestionView()
        joaoButton.isHidden = true
    }
    
    func areAllQuestionButtonsWhite() -> Bool {
        if buttonStateAuxiliar.0 == 0 && buttonStateAuxiliar.1 == 0 && buttonStateAuxiliar.2 == 0 {
            return true
        }
        return false
    }
    
    @IBAction func touchedFirstQuestionButton() {
        if areAllQuestionButtonsWhite() {
            buttonStateAuxiliar.0 = 1
            firstQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.0 != 1 {
            buttonStateAuxiliar.1 = 0; buttonStateAuxiliar.2 = 0
            secondQuestionButton.backgroundColor = .white; thirdQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.0 = 1
            firstQuestionButton.backgroundColor = .gray
        } else {
            secondQuestionButton.isUserInteractionEnabled = false
            thirdQuestionButton.isUserInteractionEnabled = false
            if answers[0].0 == true {
                firstQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                firstQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
        }
    }
    
    @IBAction func touchedSecondQuestionButton() {
        if areAllQuestionButtonsWhite() {
            let numberOne = 1
            buttonStateAuxiliar.1 = 1
            secondQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.1 != 1 {
            buttonStateAuxiliar.0 = 0; buttonStateAuxiliar.2 = 0
            firstQuestionButton.backgroundColor = .white; thirdQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.1 = 1
            secondQuestionButton.backgroundColor = .gray
        } else {
            firstQuestionButton.isUserInteractionEnabled = false
            thirdQuestionButton.isUserInteractionEnabled = false
            if answers[0].1 == true {
                secondQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                secondQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.questionView.isHidden = true
            }
        }
    }
    
    @IBAction func touchedThirdQuestionButton() {
        if areAllQuestionButtonsWhite() {
            buttonStateAuxiliar.2 = 1
            thirdQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.2 != 1 {
            buttonStateAuxiliar.0 = 0; buttonStateAuxiliar.1 = 0
            firstQuestionButton.backgroundColor = .white; secondQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.2 = 1
            thirdQuestionButton.backgroundColor = .gray
        } else {
            firstQuestionButton.isHidden = true
            secondQuestionButton.isHidden = true
            animate()
        }
    }
    
    func animate() {
        UIView.animate(withDuration: 1.0) {
            self.thirdQuestionButton.frame = CGRect(x: self.thirdQuestionButton.frame.origin.x, y: 258, width: self.thirdQuestionButton.frame.size.width, height: self.thirdQuestionButton.frame.size.height)
            if answers[0].2 == true {
                self.thirdQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                self.thirdQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
        }
    }
}

let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 768, height: 600)
PlaygroundPage.current.liveView = mvc

extension UIImage{
    convenience init(view: UIView) {

        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)

    }
}

@IBDesignable
class GradientView: UIView {

    private var gradientLayer = CAGradientLayer()
    private var vertical: Bool = false

    override func draw(_ rect: CGRect) {
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
