//
//  ViewController.swift
//  SpyApp
//
//  Created by Wafi Mohameds on 5/15/19.
//  Copyright © 2019 sadiw wafi. All rights reserved.
//
import UIKit


extension UIViewController {
    func dismissKeyboard(){
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
        
    }
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}
class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    @IBOutlet weak var buttonFour: UIButton!
    
    @IBOutlet weak var buttonSIX: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Spy App"
        buttonTwo.buttonTwoDesign()
        buttonOne.buttonOneDesign()
        buttonThree.buttonThreeDesign()
        buttonFour.buttonFourDesign()
        buttonFive.buttonFiveDesign()
        buttonSIX.buttonSixDesign()
    
       self.dismissKeyboard()
    }
   
  
    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        self.input.resignFirstResponder()
        self.secret.resignFirstResponder()
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
    }

    @IBAction func button2(_ sender: Any) {
        self.input.resignFirstResponder()
        self.secret.resignFirstResponder()
    }
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
       self.input.resignFirstResponder()
       self.secret.resignFirstResponder()
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    @IBAction func decryptButtonPressed(_ sender: UIButton) {
        self.input.resignFirstResponder()
        self.secret.resignFirstResponder()
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decrypted = cipher.decrypt(plaintext, secret: secretText){
            output.text = decrypted
        } else {
            output.text = "Error decrypting"
        }
    }
    
}

extension UIButton{
    func buttonTwoDesign(){
        self.backgroundColor = UIColor.init(red: 57/255, green: 150/255, blue: 188/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 200/255, green: 80/255, blue: 200/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func buttonOneDesign(){
        self.backgroundColor = UIColor.init(red: 200/255, green: 50/255, blue: 80/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 100/255, green: 180/255, blue: 20/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func buttonThreeDesign(){
        self.backgroundColor = UIColor.init(red: 100/255, green: 0/255, blue: 120/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 100/255, green: 180/255, blue: 20/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func buttonFourDesign(){
        self.backgroundColor = UIColor.init(red: 180/255, green: 102/255, blue: 220/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 100/255, green: 180/255, blue: 20/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func buttonFiveDesign(){
        self.backgroundColor = UIColor.init(red: 205/255, green: 188/255, blue: 40/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 100/255, green: 180/255, blue: 20/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    func buttonSixDesign(){
        self.backgroundColor = UIColor.init(red: 60/255, green: 188/255, blue: 200/255, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.init(red: 100/255, green: 180/255, blue: 20/255, alpha: 1).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    
}
