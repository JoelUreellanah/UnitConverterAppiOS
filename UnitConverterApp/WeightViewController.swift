//
//  WeightViewController.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 13/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit
import CoreData

class WeightViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.   
        self.Kg_txt.delegate = self
        self.Grams_txt.delegate = self
        self.Ounces_txt.delegate = self
        self.Pounds_txt.delegate = self
        self.Stones_txt.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Kg_txt: UITextField!
    @IBOutlet weak var Grams_txt: UITextField!
    @IBOutlet weak var Ounces_txt: UITextField!
    @IBOutlet weak var Pounds_txt: UITextField!
    @IBOutlet weak var Stones_txt: UITextField!
    
    @IBOutlet weak var SPounds_txt: UITextField!
    
    //Hide Keyboard when user touches outside Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide Keyboard when user presses Return Key on Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    let Conversion = UnitConversion()
    
    //USER TYPING ON KG TEXT
    @IBAction func User_Typing_Kg_txt(_ sender: Any) {
        
        let Kilograms = (self.Kg_txt.text! as NSString).floatValue
        let KilogramsString = Kg_txt.text
        let dotFound:Bool = checkDot(str: Kg_txt.text!)
        
        if dotFound == false {
            Grams_txt.text = Conversion.Convert_Kg_to_Grams(Kg: Kilograms)
            Ounces_txt.text = Conversion.Convert_Kg_to_Ounces(Kg: Kilograms)
            Pounds_txt.text = Conversion.Convert_Kg_to_Pounds(Kg: Kilograms)
            Stones_txt.text = Conversion.Convert_Kg_to_Stones(Kg: Kilograms)
            SPounds_txt.text = Conversion.Convert_Kg_to_stonePounds(Kg: Kilograms)
        } else {
            //do nothing
            let truncated = String(describing: KilogramsString!.dropLast())
            Kg_txt.text = truncated
        }
        

    }
    
    @IBAction func User_Typing_Grams_txt(_ sender: Any) {
        let Grams = (self.Grams_txt.text! as NSString).floatValue
        let GramsString = Grams_txt.text
        let dotFound:Bool = checkDot(str: Grams_txt.text!)
        
        if dotFound == false {
            Kg_txt.text = Conversion.Convert_Grams_to_Kg(Grams: Grams)
            Ounces_txt.text = Conversion.Convert_Grams_to_Ounces(Grams: Grams)
            Pounds_txt.text = Conversion.Convert_Grams_to_Pounds(Grams: Grams)
            Stones_txt.text = Conversion.Convert_Grams_to_Stones(Grams: Grams)
            SPounds_txt.text = Conversion.Convert_Grams_to_stonePounds(Grams: Grams)
        } else {
            let truncated = String(describing: GramsString!.dropLast())
            Grams_txt.text = truncated
        }
        
    }
    
    @IBAction func User_Typing_Ounces_txt(_ sender: Any) {
        let Ounces = (self.Ounces_txt.text! as NSString).floatValue
        let OuncesString = Ounces_txt.text
        let dotFound:Bool = checkDot(str: Ounces_txt.text!)

        if dotFound == false {
            Kg_txt.text = Conversion.Convert_Ounces_to_Kg(Ounces: Ounces)
            Grams_txt.text = Conversion.Convert_Ounces_to_Grams(Ounces: Ounces)
            Pounds_txt.text = Conversion.Convert_Ounces_to_Pounds(Ounces: Ounces)
            Stones_txt.text = Conversion.Convert_Ounces_to_Stones(Ounces: Ounces)
            let Kg = (self.Kg_txt.text! as NSString).floatValue
            SPounds_txt.text = Conversion.Convert_Ounces_to_stonePounds(Kg: Kg)
        } else {
            let truncated = String(describing: OuncesString!.dropLast())
            Ounces_txt.text = truncated
        }

    }
    
    @IBAction func User_Typing_Pounds_txt(_ sender: Any) {
        let Pounds = (self.Pounds_txt.text! as NSString).floatValue
        let PoundsString = Pounds_txt.text
        let dotFound:Bool = checkDot(str: Pounds_txt.text!)

        if dotFound == false {
            Kg_txt.text = Conversion.Convert_Pounds_to_kg(Pounds: Pounds)
            Grams_txt.text = Conversion.Convert_Pounds_to_Grams(Pounds: Pounds)
            Ounces_txt.text = Conversion.Convert_Pounds_to_Ounces(Pounds: Pounds)
            Stones_txt.text = Conversion.Convert_Pounds_to_Stones(Pounds: Pounds)
            let Kg = (self.Kg_txt.text! as NSString).floatValue
            SPounds_txt.text = Conversion.Convert_Pounds_to_stonePounds(Kg: Kg)
        } else {
            let truncated = String(describing: PoundsString!.dropLast())
            Pounds_txt.text = truncated
        }

    }
    
    @IBAction func User_Typing_Stones_txt(_ sender: Any) {
        let Stones = (self.Stones_txt.text! as NSString).floatValue
        let StonesString = Stones_txt.text
        let dotFound:Bool = checkDot(str: Stones_txt.text!)
        
        if dotFound == false {
            Kg_txt.text = Conversion.Convert_Stones_to_Kg(Stones: Stones)
            Grams_txt.text = Conversion.Convert_Stones_to_Grams(Stones: Stones)
            Ounces_txt.text = Conversion.Convert_Stones_to_Ounces(Stones: Stones)
            Pounds_txt.text = Conversion.Convert_Stones_to_Pounds(Stones: Stones)
            SPounds_txt.text = "0.0"
        } else {
            let truncated = String(describing: StonesString!.dropLast())
            Stones_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_stonePounds_txt(_ sender: Any) {
        let stonePound = (self.SPounds_txt.text! as NSString).floatValue
        let stonePoundsString = SPounds_txt.text
        let dotFound:Bool = checkDot(str: SPounds_txt.text!)
        
        if dotFound == false {
            Kg_txt.text =  Conversion.Convert_stonePounds_to_Kg(stonePound: stonePound)
            Grams_txt.text = Conversion.Convert_stonePounds_to_Grams(stonePound: stonePound)
            Ounces_txt.text = Conversion.Convert_stonePounds_to_Ounces(stonePound: stonePound)
            Pounds_txt.text = SPounds_txt.text
            Stones_txt.text = Conversion.Convert_stonePounds_to_Stone(stonePound: stonePound)
        } else {
            let truncated = String(describing: stonePoundsString!.dropLast())
            SPounds_txt.text = truncated
        }
    }
    
    
    //SAVING CONVERSION
    @IBAction func SaveConversion_btn(_ sender: Any) {
        let coreDataHandler = CoreDataHandler()
        let kg = Kg_txt.text! + " Kilograms = "
        let grams = Grams_txt.text! + " Grams = "
        let ounces = Ounces_txt.text! + " Ounces = "
        let pounds = Pounds_txt.text! + " Pounds = "
        let stones = Stones_txt.text! + " Stones and "
        let spound = SPounds_txt.text! + " Pounds"
        
        var message:[String] = []
        let Conversion_In_One_Line = kg + grams + ounces + pounds + stones + spound
        message = coreDataHandler.saveWeightConversion(conversion: Conversion_In_One_Line)
        DisplayAlert(title: message[0], message: message[1])
    }
    
    func checkDot(str:String) -> Bool {
        let userInput = str.components(separatedBy: ".")
        let MultipleDotFound: Bool
        if userInput.count > 2 {
            MultipleDotFound = true
            DisplayAlert(title: "Multiple Dots", message: "Only one dot is allow")
        } else {
            MultipleDotFound = false
        }
        return MultipleDotFound
    }
    
    func DisplayAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:{ (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var keyBoardHeight:CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        //add a notification for when the keyboard shows and call keyboardWillShow when the keyboard is to be shown
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        //this moves the tab bar above the keyboard for all devices
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyBoardHeight = keyboardSize.origin.y - keyboardSize.height - (self.tabBarController?.tabBar.frame.height)!
        }
        //tabBarMoved = true
        var tabBarFrame: CGRect = (self.tabBarController?.tabBar.frame)!
        tabBarFrame.origin.y = self.keyBoardHeight
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.tabBarController?.tabBar.frame = tabBarFrame })
    }
    
    //move tab bar to his original position when keyboard disappear
    @objc func keyboardWillHide(notification:NSNotification) {
        var tabBarFrame: CGRect = CGRect(x: self.view.frame.minX, y: self.view.frame.maxY, width: self.view.frame.width, height: -49.0)
        tabBarFrame.origin.y = self.view.frame.maxY
        self.tabBarController?.tabBar.frame = tabBarFrame
    }

    
}
