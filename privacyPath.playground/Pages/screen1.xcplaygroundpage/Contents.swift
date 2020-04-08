//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL1 = Bundle.main.url(forResource: "Montserrat-SemiBold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL1, CTFontManagerScope.process, nil)
let cfURL2 = Bundle.main.url(forResource: "BalooThambi2-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)


class MyViewController : UIViewController {
    var pageNumber = 3
    var questionNumber = 0
    let texts = Texts()
    
    //****UIs****
    //UIView
    let historyView = UIView()
    let questionView = UIView()
    
    //UIButton
    let nextButton = UIButton()
    let joaoButton = UIButton()
    
    //UIImage
    let buttonImage: UIImage = UIImage(named: "next.png")!
    
    //UIImageView
    let backgroundImageView = UIImageView()
    let faceImageView = UIImageView()
    let lockImageView = UIImageView()
    let cloudImageView = UIImageView()
    let elipseBlueImageView = UIImageView()
    let thiefImageView = UIImageView()
    
    //UILabel
    let questionLabel = UILabel()
    
    //UITextView
    let textLabel = UITextView()
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupViews()
    }
    
    override func viewDidLoad() {
        nextButton.addTarget(self, action: #selector(MyViewController.touchedNextButton), for: .touchUpInside)
        joaoButton.addTarget(self, action: #selector(MyViewController.touchedJoaoButton), for: .touchUpInside)

        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
    
    //MARK: Setups
    func setupViews() {
        setupBackgroundImageView()
        //setupElipseBlueImageView()
        setupJoaoButton()
        setupHistoryView()
        setupFaceImageView()
        setupLockImageView()
        setupCloudImageView()
        setupTextLabel(pageNumber: 0)
        setupNextButton()
    }
    
    func setupJoaoButton() {
        view.addSubview(joaoButton)
        joaoButton.frame = CGRect(x: 124, y: 354, width: 34, height: 34)
        joaoButton.setImage(UIImage(named:"elipseBlue.png"), for: .normal)
    }
    
    
    func setupElipseBlueImageView() {
        view.addSubview(elipseBlueImageView)
        elipseBlueImageView.frame = CGRect(x: 124, y: 354, width: 34, height: 34)
        elipseBlueImageView.image = UIImage(named: "elipseBlue.png")
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
        backgroundImageView.alpha = 0.8
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
        setupQuestionView()
        setupThiefImageView()
        setupQuestionLabel()
        questionView.addSubview(lockImageView)
        questionView.addSubview(cloudImageView)
        joaoButton.isHidden = true
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
