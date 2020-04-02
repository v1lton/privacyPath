//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let questionView = UIView()
    let backgroundImageView = UIImageView()
    let faceImageView = UIImageView()
    let lockImageView = UIImageView()
    let cloudImageView = UIImageView()
    let textLabel = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupBackgroundImageView()
        setupQuestionView()
        setupFaceImageView()
        setupLockImageView()
        setupCloudImageView()
        setupTextLabel()
    }
    
    func setupQuestionView() {
        view.addSubview(questionView)
        questionView.frame = CGRect(x: 12, y: 51, width: 744, height: 498)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.layer.cornerRadius = 12
        questionView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9411764706, blue: 0.9647058824, alpha: 1) //#E4F0F6
    }
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 768, height: 600)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "background.png")
        backgroundImageView.alpha = 0.8
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
        textLabel.frame = CGRect(x: 138, y: 33, width: 510, height: 320)
        textLabel.text = "Opa! Me chamo João e acredito que você possa me ajudar. (;\n Eu estava andando em um parque e me acabei me perdendo. Eu até estou usando meu celular para encontrar o caminho de casa, mas percebi alguém me perseguindo."
    }
}

let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 768, height: 600)
PlaygroundPage.current.liveView = mvc
