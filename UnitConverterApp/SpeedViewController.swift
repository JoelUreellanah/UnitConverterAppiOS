//
//  SpeedViewController.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 13/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.Metre_txt.delegate = self
        self.Km_txt.delegate = self
        self.Miles_txt.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Metre_txt: UITextField!
    @IBOutlet weak var Km_txt: UITextField!
    @IBOutlet weak var Miles_txt: UITextField!
    
    //Hide Keyboard when user touches outside Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide Keyboard when user presses Return Key on Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    let conversion = UnitConversion()
    
    @IBAction func User_Typing_Metre_txt(_ sender: Any) {
        let Metre = (self.Metre_txt.text! as NSString).floatValue
        let MetreString = Metre_txt.text
        let dotFound:Bool = checkDot(str: Metre_txt.text!)
        
        if dotFound == false {
            Km_txt.text = conversion.Convert_Metre_to_Km(Metre: Metre)
            Miles_txt.text = conversion.Convert_Metre_to_Miles(Metre: Metre)
        } else {
            let truncated = String(describing: MetreString!.dropLast())
            Metre_txt.text = truncated
        }
    }
    
    
    @IBAction func User_Typing_Km_txt(_ sender: Any) {
        let Km = (self.Km_txt.text! as NSString).floatValue
        let KmString = Km_txt.text
        let dotFound:Bool = checkDot(str: Km_txt.text!)
        
        if dotFound == false {
            Metre_txt.text = conversion.Convert_Km_to_Metre(Km: Km)
            Miles_txt.text = conversion.Convert_Km_to_Miles(Km: Km)
        } else {
            let truncated = String(describing: KmString!.dropLast())
            Km_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Miles_txt(_ sender: Any) {
        let Miles = (self.Miles_txt.text! as NSString).floatValue
        let MilesString = Miles_txt.text
        let dotFound:Bool = checkDot(str: Miles_txt.text!)
        
        if dotFound == false {
            Metre_txt.text = conversion.Convert_Miles_to_Metre(Miles: Miles)
            Km_txt.text = conversion.Convert_Miles_to_Km(Miles: Miles)
        } else {
            let truncated = String(describing: MilesString!.dropLast())
            Miles_txt.text = truncated
        }
    }
    
    @IBAction func SaveSpeed(_ sender: Any) {
        let coreDataHandler = CoreDataHandler()
        let metre = Metre_txt.text! + " Metre = "
        let km = Km_txt.text! + " Km = "
        let miles = Miles_txt.text! + " Miles"
        
        var message:[String] = []
        let Conversion_In_One_Line = metre + km + miles
        message = coreDataHandler.saveSpeedConversion(conversion: Conversion_In_One_Line)
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
}
