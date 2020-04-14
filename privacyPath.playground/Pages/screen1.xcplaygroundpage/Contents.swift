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
    var lostDataNumber = 0
    var isAnswerCorrect = true
    let texts = Texts()
    
    //****UIs****
    //UIView
    let historyView = UIView()
    let questionView = UIView()
    
    //UIButton
    let nextButton = UIButton()
    let characterButton = UIButton()
    let firstQuestionButton = UIButton()
    let secondQuestionButton = UIButton()
    let thirdQuestionButton = UIButton()
    let confirmButton = UIButton()
    
    //UIImage
    let buttonImage: UIImage = UIImage(named: "next.png")!
    
    //UIImageView
    let backgroundImageView = UIImageView()
    let CharacterfaceOfHistoryViewImageView = UIImageView()
    let lockImageView = UIImageView()
    let cloudImageView = UIImageView()
    let elipseBlueImageView = UIImageView()
    let thiefFaceImageView = UIImageView()
    let characterFaceImageView = UIImageView()
    let fisrtCircleDataImageView = UIImageView()
    let secondCircleDataImageView = UIImageView()
    let thirdCircleDataImageView = UIImageView()
    
    //UILabel
    let questionLabel = UILabel()
    let lostDataLabel = UILabel()
    let securityLabel = UILabel()
    
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
        setupSubviewsOfView()
        setupSubviewsOfHistoryView()
        setupSubviewsOfQuestionView()
    }
    
    override func viewDidLoad() {
        nextButton.addTarget(self, action: #selector(MyViewController.touchedNextButton), for: .touchUpInside)
        characterButton.addTarget(self, action: #selector(MyViewController.touchedJoaoButton), for: .touchUpInside)
        firstQuestionButton.addTarget(self, action: #selector(MyViewController.touchedFirstQuestionButton), for: .touchUpInside)
        secondQuestionButton.addTarget(self, action: #selector(MyViewController.touchedSecondQuestionButton), for: .touchUpInside)
        thirdQuestionButton.addTarget(self, action: #selector(MyViewController.touchedThirdQuestionButton), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(MyViewController.touchedConfirmButton), for: .touchUpInside)
        tap.addTarget(self, action: #selector(MyViewController.handleTap))
    }
    
    @objc func handleTap() {
        print(tap.location(in: view))
    }
    
    //MARK: Setups
    func setupSubviewsOfQuestionView() {
        setupThiefFaceImageView()
        setupQuestionLabel()
        setupFirstQuestionButton()
        setupSecondQuestionButton()
        setupThirdQuestionButton()
        setupConfirmButton()
    }
    
    func setupThiefFaceImageView() {
        questionView.addSubview(thiefFaceImageView)
        thiefFaceImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        thiefFaceImageView.image = UIImage(named: "thief.png")
    }
    
    func setupQuestionLabel() {
        questionView.addSubview(questionLabel)
        questionLabel.frame = CGRect(x: 132, y: 22, width: 504, height: 110)
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name:"BalooThambi2-Bold", size: 20)
        questionLabel.text = texts.questionTexts[questionNumber]
        questionLabel.textAlignment = .center
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
    
    func setupConfirmButton() {
        questionView.addSubview(confirmButton)
        confirmButton.frame = CGRect(x: 372, y: 448, width: 90, height: 40)
        confirmButton.setTitle("Confirmar", for: .normal)
        confirmButton.backgroundColor = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.3647058824, alpha: 1) //#FFD35D
        confirmButton.isHidden = true
    }
    
    func setupSubviewsOfHistoryView() {
        setupCharacterFaceOfHistoryViewImageView()
        setupLockImageView()
        setupCloudImageView()
        setupTextLabel(pageNumber: pageNumber)
        setupNextButton()
    }
    
    func setupLockImageView() {
        historyView.addSubview(lockImageView)
        lockImageView.frame = CGRect(x: 650, y: 36, width: 68, height: 68)
        lockImageView.transform = CGAffineTransform(rotationAngle: 125.5)
        lockImageView.image = UIImage(named: "lock.png")
    }
    
    func setupCloudImageView(){
        historyView.addSubview(cloudImageView)
        cloudImageView.frame = CGRect(x: 15, y: 370, width: 97, height: 97)
        cloudImageView.transform = CGAffineTransform(rotationAngle: 24.8)
        cloudImageView.image = UIImage(named: "cloud.png")
    }
    
    func setupCharacterFaceOfHistoryViewImageView() {
        historyView.addSubview(CharacterfaceOfHistoryViewImageView)
        CharacterfaceOfHistoryViewImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        CharacterfaceOfHistoryViewImageView.image = UIImage(named: "faceJoao.png")
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
    
    func setupNextButton() {
        historyView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 700, y: 450, width: 35, height: 45)
        nextButton.setImage(buttonImage, for: .normal)
    }
    
    func setupSubviewsOfView() {
        setupBackgroundImageView()
        setupCharacterButton()
        setupProgressView()
        setupCharacterFaceImageView()
        setupSecurityLabel()
        setupLostDataLabel()
        setupCirclesDataImageView(view: fisrtCircleDataImageView, x: 370, y: 37)
        setupCirclesDataImageView(view: secondCircleDataImageView, x: 420, y: 37)
        setupCirclesDataImageView(view: thirdCircleDataImageView, x: 470, y: 37)
        setupHistoryView()
        setupQuestionView()
    }
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        backgroundImageView.image = UIImage(named: "background.png")
        backgroundImageView.alpha = 0.8
    }
    
    func setupCharacterButton() {
        view.addSubview(characterButton)
        characterButton.frame = CGRect(x: 128.5, y: 357, width: 28, height: 28)
        characterButton.setImage(UIImage(named:"dotJoao.png"), for: .normal)
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
    
    func setupCharacterFaceImageView() {
        view.addSubview(characterFaceImageView)
        characterFaceImageView.frame = CGRect(x:55, y:12, width: 60, height: 60)
        characterFaceImageView.image = UIImage(named: "faceJoao.png")
    }
    
    func setupSecurityLabel() {
        view.addSubview(securityLabel)
        securityLabel.frame = CGRect(x: 120, y: 5, width: 220, height: 40)
        securityLabel.numberOfLines = 1
        securityLabel.font = UIFont(name:"BalooThambi2-Bold", size: 18)
        securityLabel.text = "Segurança"
    }
    
    func setupLostDataLabel() {
        view.addSubview(lostDataLabel)
        lostDataLabel.frame = CGRect(x: 370, y: 5, width: 220, height: 40)
        lostDataLabel.numberOfLines = 1
        lostDataLabel.font = UIFont(name:"BalooThambi2-Bold", size: 18)
        lostDataLabel.text = "Dados perdidos"
    }
    
    func setupCirclesDataImageView(view myImageView: UIImageView, x: Int, y: Int) {
        view.addSubview(myImageView)
        myImageView.frame = CGRect(x: x, y: y, width: 26, height: 26)
        myImageView.image = UIImage(named: "circleData.png")
    }
    
    func setupHistoryView() {
        view.addSubview(historyView)
        historyView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        historyView.translatesAutoresizingMaskIntoConstraints = false
        historyView.layer.cornerRadius = 12
        historyView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(historyView)
    }
    
    func setupQuestionView() {
        view.addSubview(questionView)
        questionView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.layer.cornerRadius = 12
        questionView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(questionView)
        questionView.isHidden = true
    }
    
    //MARK: IBActions
    @IBAction func touchedNextButton() {
        if pageNumber < 3 {
            pageNumber += 1
            setupTextLabel(pageNumber: pageNumber)
        } else {
            historyView.isHidden = true
            backgroundImageView.alpha = 1
            characterButton.flash()
        }
    }
    
    @IBAction func touchedJoaoButton(_ sender:UIButton) {
        if questionNumber == 0 {
            showQuestionView()
            characterButton.isHidden = true
        } else {
            questionView.isHidden = false
        }
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
                isAnswerCorrect = true
                firstQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                isAnswerCorrect = false
                firstQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
            confirmButton.isHidden = false
            questionNumber += 1
        }
    }
    @IBAction func touchedSecondQuestionButton() {
        if areAllQuestionButtonsWhite() {
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
                isAnswerCorrect = true
                secondQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                isAnswerCorrect = false
                secondQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
            confirmButton.isHidden = false
            questionNumber += 1
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
            questionNumber += 1
        }
    }
    
    @IBAction func touchedConfirmButton() {
        questionView.isHidden = true
        characterButton.unflash()
        characterButton.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1.0) {
                if self.isAnswerCorrect {
                    self.progressBarNumber -= 0.06
                    self.progressView.setProgress(Float(self.progressBarNumber), animated: true)
                }
            }
        }
    }
    
    //MARK: Auxiliar Functions
    func showQuestionView() {
        questionView.isHidden = false
        questionView.addSubview(lockImageView)
        questionView.addSubview(cloudImageView)
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
    
    func areAllQuestionButtonsWhite() -> Bool {
        if buttonStateAuxiliar.0 == 0 && buttonStateAuxiliar.1 == 0 && buttonStateAuxiliar.2 == 0 {
            return true
        }
        return false
    }
    
    func animate() {
        UIView.animate(withDuration: 1.0) {
            self.thirdQuestionButton.frame = CGRect(x: self.thirdQuestionButton.frame.origin.x, y: 258, width: self.thirdQuestionButton.frame.size.width, height: self.thirdQuestionButton.frame.size.height)
            if answers[0].2 == true {
                self.thirdQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            } else {
                self.thirdQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            }
            self.confirmButton.isHidden = false
        }
    }
}

let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 768, height: 600)
PlaygroundPage.current.liveView = mvc
