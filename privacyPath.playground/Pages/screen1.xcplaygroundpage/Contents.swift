//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURLMontserrat = Bundle.main.url(forResource: "Montserrat-SemiBold", withExtension: "ttf")! as CFURL
   CTFontManagerRegisterFontsForURL(cfURLMontserrat, CTFontManagerScope.process, nil)
let cfURLBalooThambi = Bundle.main.url(forResource: "BalooThambi2-Bold", withExtension: "ttf")! as CFURL
   CTFontManagerRegisterFontsForURL(cfURLBalooThambi, CTFontManagerScope.process, nil)

class MyViewController : UIViewController {
   

    let answers = [(false, true, false), (false, false, true), (false, true, false), (false, false, true), (false, false, true), (false, true, false), (true, false, false), (true, false, false), (false, false, true), (false, true, false), (false, false, true), (false, false, true), (true, false, false), (false, false, true), (true, false, false)]
    let characterCoordinates = [(x: 128.5, y: 357.0), (x: 171.0, y: 283.5), (x: 246.4, y: 262.2), (x: 305.0, y: 302.5), (x: 362.5, y: 326.0), (x: 428.6, y: 324), (x: 476.2, y: 313.0), (x: 492.1, y: 259.5), (x: 431.3, y: 211.0), (x: 407.3, y: 156.3), (x: 433.0, y: 99.8), (x: 497.3, y: 70.5), (x: 555.9, y: 70.25), (x: 625.0, y: 67.0), (x: 696.5, y: 63.8), (x: 705, y: 70)]
    let thiefCoordinates = [(x: 50, y: 562), (x: 63.5, y: 497.5), (x: 92.3, y: 420.8), (x: 128.5, y: 357.0), (x: 171.0, y: 283.5), (x: 246.4, y: 262.2), (x: 305.0, y: 302.5), (x: 362.5, y: 326.0), (x: 428.6, y: 324), (x: 476.2, y: 313.0), (x: 492.1, y: 259.5), (x: 431.3, y: 211.0), (x: 407.3, y: 156.3), (x: 433.0, y: 99.8), (x: 497.3, y: 70.5), (x: 555.9, y: 70.25), (x: 625.0, y: 67.0), (x: 696.5, y: 63.8)]
    var buttonStateAuxiliar = (0, 0, 0)
    
    var pageNumber = 0
    var questionNumber = 0
    var thiefDotPosition = 0
    var progressBarNumber = 0.85
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
    let closeButton = UIButton()
    
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
    let thiefDotImageView = UIImageView()
    
    //UILabel
    let questionTextView = UITextView()
    let lostDataLabel = UILabel()
    let securityLabel = UILabel()
    
    //UITextView
    let historyTextView = UITextView()
    
    //UIProgressView
    let progressView = UIProgressView()
    
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
        closeButton.addTarget(self, action: #selector(MyViewController.touchedCloseButton), for: .touchUpInside)
    }
    
    //MARK: Setups
    func setupSubviewsOfQuestionView() {
        setupThiefFaceImageView()
        setupQuestionTextView()
        setupFirstQuestionButton()
        setupSecondQuestionButton()
        setupThirdQuestionButton()
        setupCloseButton()
        setupConfirmButton()
    }
    
    func setupThiefFaceImageView() {
        questionView.addSubview(thiefFaceImageView)
        thiefFaceImageView.frame = CGRect(x: 44, y: 22, width: 75, height: 75)
        thiefFaceImageView.image = UIImage(named: "thiefFace.png")
    }
    
    func setupQuestionTextView() {
        questionView.addSubview(questionTextView)
        questionTextView.frame = CGRect(x: 125, y: 15, width: 520, height: 150)
        questionTextView.isUserInteractionEnabled = false
        questionTextView.backgroundColor = questionView.backgroundColor
        questionTextView.font = UIFont(name:"BalooThambi2-Bold", size: 20)
        questionTextView.text = texts.questionTexts[questionNumber]
        questionTextView.textAlignment = .justified
    }
    
    func setupFirstQuestionButton() {
        questionView.addSubview(firstQuestionButton)
        firstQuestionButton.frame = CGRect(x: 58, y: 163, width: 628, height: 73)
        firstQuestionButton.layer.cornerRadius = 12
        firstQuestionButton.backgroundColor = .white
        firstQuestionButton.setTitle(texts.firstQuestionButtonTexts[questionNumber], for: .normal)
        firstQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal) //#2529A
        firstQuestionButton.titleLabel!.numberOfLines = 0
        firstQuestionButton.titleLabel!.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        firstQuestionButton.titleLabel!.textAlignment = .center
    }
    
    func setupSecondQuestionButton() {
        questionView.addSubview(secondQuestionButton)
        secondQuestionButton.frame = CGRect(x: 58, y: 258, width: 628, height: 73)
        secondQuestionButton.layer.cornerRadius = 12
        secondQuestionButton.backgroundColor = .white
        secondQuestionButton.setTitle(texts.secondQuestionButtonTexts[questionNumber], for: .normal)
        secondQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal)
        secondQuestionButton.titleLabel!.numberOfLines = 0
        secondQuestionButton.titleLabel!.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        secondQuestionButton.titleLabel!.textAlignment = .center
    }
    
    func setupThirdQuestionButton() {
        questionView.addSubview(thirdQuestionButton)
        thirdQuestionButton.frame = CGRect(x: 58, y: 352, width: 628, height: 73)
        thirdQuestionButton.layer.cornerRadius = 12
        thirdQuestionButton.backgroundColor = .white
        thirdQuestionButton.setTitle(texts.thirdQuestionButtonTexts[questionNumber], for: .normal)
        thirdQuestionButton.setTitleColor(#colorLiteral(red: 0.1450980392, green: 0.1607843137, blue: 0.1647058824, alpha: 1), for: .normal)
        thirdQuestionButton.setTitleColor(.white, for: .selected)
        thirdQuestionButton.titleLabel!.numberOfLines = 0
        thirdQuestionButton.titleLabel!.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        thirdQuestionButton.titleLabel!.textAlignment = .center
        
    }
    
    func setupCloseButton() {
        questionView.addSubview(closeButton)
        closeButton.frame = CGRect(x: 320, y: 440, width: 110, height: 40)
        closeButton.setTitle("Fechar", for: .normal)
        closeButton.layer.cornerRadius = 12
        closeButton.titleLabel!.font = UIFont(name: "BalooThambi2-Bold", size: 18)
        closeButton.setTitleShadowColor(.black, for: .normal)
        closeButton.titleLabel!.textColor = .white
        closeButton.backgroundColor = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.3647058824, alpha: 1) //#FFD35D
        closeButton.isHidden = true
    }
    
    func setupConfirmButton() {
        questionView.addSubview(confirmButton)
        confirmButton.frame = CGRect(x: 320, y: 440, width: 110, height: 40)
        confirmButton.setTitle("Confirmar", for: .normal)
        confirmButton.layer.cornerRadius = 12
        confirmButton.titleLabel!.font = UIFont(name: "BalooThambi2-Bold", size: 18)
        confirmButton.setTitleShadowColor(.black, for: .normal)
        confirmButton.titleLabel!.textColor = .white
        confirmButton.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1) //#C4C4C4
        confirmButton.isEnabled = false
    }
    
    func setupSubviewsOfHistoryView() {
        setupCharacterFaceOfHistoryViewImageView()
        setupLockImageView()
        setupCloudImageView()
        setupHistoryTextView(pageNumber: pageNumber)
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
        CharacterfaceOfHistoryViewImageView.frame = CGRect(x: 44, y: 35, width: 75, height: 75)
        CharacterfaceOfHistoryViewImageView.image = UIImage(named: "athlete.png")
    }
    
    func setupHistoryTextView(pageNumber: Int) {
        historyView.addSubview(historyTextView)
        historyTextView.frame = CGRect(x: 138, y: 43, width: 510, height: 320)
        historyTextView.attributedText = setLineSpacing(lineSpacing: 15, text: texts.presentetionTexts[pageNumber])
        historyTextView.typeOn {
            self.nextButton.isEnabled = true
            if (pageNumber == 0) {
                self.nextButton.flash(howManyTimes: 2)
            }
        }
        historyTextView.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        historyTextView.backgroundColor = historyView.backgroundColor
        historyTextView.isUserInteractionEnabled = false
    }
    
    func setupNextButton() {
        historyView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 660, y: 390, width: 55, height: 55)
        nextButton.setImage(UIImage(named: "next.png"), for: .normal)
        nextButton.setImage(UIImage(named: "nextInactive.png"), for: .disabled)
        nextButton.isEnabled = false
    }
    
    func setupSubviewsOfView() {
        setupBackgroundImageView()
        setupCharacterButton()
        setupThiefDotImageView()
        setupProgressView()
        setupSecurityLabel()
        setupCharacterFaceImageView()
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
        //backgroundImageView.alpha = 0.8
    }
    
    func setupCharacterButton() {
        view.addSubview(characterButton)
        characterButton.frame = CGRect(x: characterCoordinates[questionNumber].x, y: characterCoordinates[questionNumber].y, width: 28, height: 28)
        characterButton.setImage(UIImage(named:"dotJoao.png"), for: .normal)
    }
    
    func setupThiefDotImageView() {
        view.addSubview(thiefDotImageView)
        thiefDotImageView.frame = CGRect(x: thiefCoordinates[thiefDotPosition].x, y: thiefCoordinates[thiefDotPosition].y, width: 28, height: 28)
        thiefDotImageView.image = UIImage(named: "dotThief.png")
    }
    
    func setupProgressView() {
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 98, y: 50, width: 160, height: 1200)
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
        characterFaceImageView.frame = CGRect(x:45, y:19, width: 60, height: 60)
        characterFaceImageView.image = UIImage(named: "athlete.png")
    }
    
    func setupSecurityLabel() {
        view.addSubview(securityLabel)
        securityLabel.frame = CGRect(x: 135, y: 5, width: 220, height: 40)
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
        historyView.layer.cornerRadius = 12
        historyView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(historyView)
    }
    
    func setupQuestionView() {
        view.addSubview(questionView)
        questionView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        questionView.layer.cornerRadius = 12
        questionView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
        setupShadow(questionView)
        questionView.isHidden = true
    }
    
    //MARK: IBActions
    @IBAction func touchedNextButton() {
        nextButton.isEnabled = false
        if pageNumber < 3 {
            pageNumber += 1
            setupHistoryTextView(pageNumber: pageNumber)
        } else {
            historyView.isHidden = true
            backgroundImageView.alpha = 1
            characterButton.flash(howManyTimes: 100000)
        }
    }
    
    @IBAction func touchedJoaoButton(_ sender:UIButton) {
        if questionNumber == 0 {
            showQuestionView()
            characterButton.isHidden = true
        } else {
            questionView.isHidden = false
            confirmButton.isHidden = false
            confirmButton.isEnabled = false
            confirmButton.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
            closeButton.isHidden = true
        }
        //showSucceedView()
    }
    
    @IBAction func touchedFirstQuestionButton() {
        if areAllQuestionButtonsWhite() {
            enableConfirmButton()
            buttonStateAuxiliar.0 = 1
            firstQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.0 != 1 {
            buttonStateAuxiliar.1 = 0; buttonStateAuxiliar.2 = 0
            secondQuestionButton.backgroundColor = .white; thirdQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.0 = 1
            firstQuestionButton.backgroundColor = .gray
        }
    }
    
    @IBAction func touchedSecondQuestionButton() {
        if areAllQuestionButtonsWhite() {
            enableConfirmButton()
            buttonStateAuxiliar.1 = 1
            secondQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.1 != 1 {
            buttonStateAuxiliar.0 = 0; buttonStateAuxiliar.2 = 0
            firstQuestionButton.backgroundColor = .white; thirdQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.1 = 1
            secondQuestionButton.backgroundColor = .gray
        }
    }
    
    @IBAction func touchedThirdQuestionButton() {
        if areAllQuestionButtonsWhite() {
            enableConfirmButton()
            buttonStateAuxiliar.2 = 1
            thirdQuestionButton.backgroundColor = .gray
        } else if buttonStateAuxiliar.2 != 1 {
            buttonStateAuxiliar.0 = 0; buttonStateAuxiliar.1 = 0
            firstQuestionButton.backgroundColor = .white; secondQuestionButton.backgroundColor = .white
            buttonStateAuxiliar.2 = 1
            thirdQuestionButton.backgroundColor = .gray
        }
    }
    
    @IBAction func touchedConfirmButton() {
        changeConfirmButtonToCloseButton()
        disableQuestionButtons()
        if !areAllQuestionButtonsWhite() {
            modifyQuestionButtons()
        }
    }
    
    @IBAction func touchedCloseButton() {
        if questionNumber < 15 {
            questionNumber += 1
            updateQuestionViewLabels()
            updateQuestionViewButtons()
            enableQuestionButtons()
            setButtonStateAuxiliarValuesToZero()
        } else {
            //CHAMAAFUNCAOQUEFAZAPARECER A VIEW DO SUCESSO
        }
        questionView.isHidden = true
        characterButton.isHidden = false
        characterButton.unflash()
        animateCharacterButton()
        if isAnswerCorrect {
            animateProgressionBar()
        } else {
            animateLostData()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateThiefDotImageView {
                self.characterButton.flash(howManyTimes: 100)
            }
        }
    }
    
//    func showSucceedView() {
//        histo.isHidden = false
//        questionTextView.isHidden = true
//        firstQuestionButton.isHidden = true
//        secondQuestionButton.isHidden = true
//        thirdQuestionButton.isHidden = true
//        confirmButton.isHidden = true
//        closeButton.isHidden = true
//        let succeedTopLabel = UILabel()
//        succeedTopLabel.frame = CGRect(x:132, y: 58, width: 504, height: 100)
//        succeedTopLabel.text = "Parabéns!\nVocê conseguiu me salvar com"
//        succeedTopLabel.font = UIFont(name:"BalooThambi2-Bold", size: 36)
//        succeedTopLabel.numberOfLines = 0
//        questionView.addSubview(succeedTopLabel)
//
//    }
    //MARK: Auxiliar Functions
    func enableQuestionButtons() {
        firstQuestionButton.isEnabled = true
        secondQuestionButton.isEnabled = true
        thirdQuestionButton.isEnabled = true
    }
    
    func changeConfirmButtonToCloseButton() {
        confirmButton.isHidden = true
        closeButton.isHidden = false
    }
    
    func modifyQuestionButtons() {
        if buttonStateAuxiliar.0 == 1 {
            modifyFirstQuestionButton()
        } else if buttonStateAuxiliar.1 == 1 {
            modifySecondQuestionButton()
        } else {
            modifyThirdQuestionButton()
        }
    }
    
    func modifyFirstQuestionButton() {
        if isFirstButtonTrue() {
            isAnswerCorrect = true
            firstQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
        } else {
            isAnswerCorrect = false
            firstQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            setTrueButtonToGreen()
        }
    }
    
    func modifySecondQuestionButton() {
        if isSecondButtonTrue() {
            isAnswerCorrect = true
            secondQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
        } else {
            isAnswerCorrect = false
            secondQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            setTrueButtonToGreen()
        }
    }
    
    func modifyThirdQuestionButton() {
        if isThirdButtonTrue() {
            isAnswerCorrect = true
            thirdQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
        } else {
            isAnswerCorrect = false
            thirdQuestionButton.backgroundColor = #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1) //#FF5555
            setTrueButtonToGreen()
        }
    }
    
    func setTrueButtonToGreen() {
        if answers[questionNumber].0 {
            firstQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1) //#8BF359
            firstQuestionButton.shake()
        } else if answers[questionNumber].1 {
            secondQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1)
            secondQuestionButton.shake()
        } else {
            thirdQuestionButton.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1)
            thirdQuestionButton.shake()
        }
    }
    
    func disableQuestionButtons() {
        firstQuestionButton.isEnabled = false
        secondQuestionButton.isEnabled = false
        thirdQuestionButton.isEnabled = false
    }
    
    func enableConfirmButton() {
        confirmButton.backgroundColor = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.3647058824, alpha: 1) //#FFD35D
        confirmButton.isEnabled = true
    }
    
    func animateThiefDotImageView(completion: (() -> Void)? = nil) {
        if isAnswerCorrect {
            thiefDotAnimation(howManyTimes: 1)
        } else {
            thiefDotAnimation(howManyTimes: 2)
        }
        completion?()
    }
    
    func thiefDotAnimation (howManyTimes: Int) {
        for _ in 1...howManyTimes {
            thiefDotPosition += 1
            UIView.animate(withDuration: TimeInterval(howManyTimes)) {
                self.thiefDotImageView.frame = CGRect(x: self.thiefCoordinates[self.thiefDotPosition].x, y: self.thiefCoordinates[self.thiefDotPosition].y, width: Double(self.thiefDotImageView.frame.size.width), height: Double(self.thiefDotImageView.frame.size.height))
            }
        }
    }
    
    func animateLostData() {
        if lostDataNumber == 0 {
            UIView.transition(with: fisrtCircleDataImageView , duration: 2.0, options: [.transitionFlipFromLeft, .curveEaseOut], animations: {self.fisrtCircleDataImageView.image = UIImage(named: "lostdata.png")})
        } else if lostDataNumber == 1 {
            UIView.transition(with: secondCircleDataImageView , duration: 2.0, options: [.transitionFlipFromLeft, .curveEaseOut], animations: {self.secondCircleDataImageView.image = UIImage(named: "lostdata.png")})
        } else {
            UIView.transition(with: thirdCircleDataImageView , duration: 2.0, options: [.transitionFlipFromLeft, .curveEaseOut], animations: {self.thirdCircleDataImageView.image = UIImage(named: "lostdata.png")})
        }
        lostDataNumber += 1
    }
    
    func changeImage(){
        self.fisrtCircleDataImageView.image = UIImage(named:"lostdata.png")
    }
    
    func animateProgressionBar() {
        UIView.animate(withDuration: 1.0) {
            if self.isAnswerCorrect {
                self.progressBarNumber -= 0.057
                self.progressView.setProgress(Float(self.progressBarNumber), animated: true)
            }
        }
    }
    
    func setButtonStateAuxiliarValuesToZero() {
        buttonStateAuxiliar.0 = 0
        buttonStateAuxiliar.1 = 0
        buttonStateAuxiliar.2 = 0
    }
    
    func updateQuestionViewLabels() {
        questionTextView.text = texts.questionTexts[questionNumber]
    }
    
    func updateQuestionViewButtons() {
        setupFirstQuestionButton()
        setupSecondQuestionButton()
        setupThirdQuestionButton()
        confirmButton.isHidden = true
    }
    
    func showQuestionView() {
        questionView.isHidden = false
        questionView.addSubview(lockImageView)
        questionView.addSubview(cloudImageView)
        setupThirdQuestionButton()
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
    
    func animateCharacterButton() {
        UIView.animate(withDuration: 1.0) {
            self.characterButton.frame = CGRect(x: self.characterCoordinates[self.questionNumber].x, y: self.characterCoordinates[self.questionNumber].y, width: Double(self.characterButton.frame.size.width), height: Double(self.characterButton.frame.size.height))
        }
    }
    
    func isFirstButtonTrue() -> Bool {
        if answers[questionNumber].0 == true {
            return true
        }
        return false
    }
    func isSecondButtonTrue() -> Bool {
        if answers[questionNumber].1 == true {
            return true
        }
        return false
    }
    func isThirdButtonTrue() -> Bool {
        if answers[questionNumber].2 == true {
            return true
        }
        return false
    }
}

let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 768, height: 600)
PlaygroundPage.current.liveView = mvc
//
