//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "Montserrat-SemiBold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let presentetionTexts = ["Opa! Me chamo João e acredito que você possa me ajudar. (;\nEu estava andando em um parque e acabei me perdendo.\nEu até estou usando meu celular para encontrar o caminho de casa, mas tem alguém me perseguindo...", "Pelo o que eu consegui perceber, quem está me perseguindo quer roubar todos os meus dados. \nEu estou assustado porque não quero minhas informações com um desconhecido...", "Preciso que você me ajude a despitá-lo!\nEu tenho que aumentar meu nível de segurança para conseguir fugir. Para isso, você precisa responder algumas perguntas...", "Mas cuidado! 3 respostas erradas significam a perda de todos os meus dados.\nPronto para me ajudar?"]

class MyViewController : UIViewController {
    var pageNumber = 0
    
    
    //****UIs****
    //UIView
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
        joaoButton.flash()
    }
    
    //MARK: Setups
    func setupViews() {
        setupBackgroundImageView()
         //setupElipseBlueImageView()
        setupJoaoButton()
        setupQuestionView()
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
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        backgroundImageView.image = UIImage(named: "background.png")
        backgroundImageView.alpha = 0.8
    }
    
    func setupNextButton() {
        questionView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 700, y: 450, width: 35, height: 45)
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
        lockImageView.frame = CGRect(x: 650, y: 36, width: 68, height: 68)
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
    
    func setupTextLabel(pageNumber: Int) {
        questionView.addSubview(textLabel)
        textLabel.frame = CGRect(x: 138, y: 43, width: 510, height: 400)
        //textLabel.numberOfLines = 0
        textLabel.attributedText = setLineSpacing(lineSpacing: 15, text: presentetionTexts[pageNumber])
        textLabel.typeOn()
        textLabel.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        textLabel.backgroundColor = questionView.backgroundColor
        textLabel.isUserInteractionEnabled = false
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
            questionView.isHidden = true
            backgroundImageView.alpha = 1
            joaoButton.flash()
        }
    }
    
    @IBAction func touchedJoaoButton(_ sender:UIButton) {
        joaoButton.flash()
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






