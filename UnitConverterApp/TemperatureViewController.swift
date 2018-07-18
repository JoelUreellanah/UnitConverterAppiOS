//
//  TemperatureViewController.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 13/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.Celsius_txt.delegate = self
        self.Fahrenheit_txt.delegate = self
        self.Kelvin_txt.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Celsius_txt: UITextField!
    @IBOutlet weak var Fahrenheit_txt: UITextField!
    @IBOutlet weak var Kelvin_txt: UITextField!
    
    @IBOutlet weak var Minus_btn: UIButton!
    
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
    
    @IBAction func User_Typing_Celsius_txt(_ sender: Any) {
        let Celsius = (self.Celsius_txt.text! as NSString).floatValue
        let CelsiusString = Celsius_txt.text
        let dotFound:Bool = checkDot(str: Celsius_txt.text!)
        
        if dotFound == false {
            Fahrenheit_txt.text = conversion.Convert_Celsius_to_Fahrenheit(Celsius: Celsius)
            Kelvin_txt.text = conversion.Convert_Celsius_to_Kelvin(Celsius: Celsius)
        } else {
            let truncated = String(describing: CelsiusString!.dropLast())
            Celsius_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Fahrenheit_txt(_ sender: Any) {
        let Fahrenheit = (self.Fahrenheit_txt.text! as NSString).floatValue
        let FahrenheitString = Fahrenheit_txt.text
        let dotFound:Bool = checkDot(str: Fahrenheit_txt.text!)
        
        if dotFound == false {
            Celsius_txt.text = conversion.Convert_Fahrenheit_to_Celsius(Fahrenheit: Fahrenheit)
            Kelvin_txt.text = conversion.Convert_Fahrenheit_to_Kelvin(Fahrenheit: Fahrenheit)
        } else {
            let truncated = String(describing: FahrenheitString!.dropLast())
            Fahrenheit_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Kelvin_txt(_ sender: Any) {
        let Kelvin = (self.Kelvin_txt.text! as NSString).floatValue
        let KelvinString = Kelvin_txt.text
        let dotFound:Bool = checkDot(str: Kelvin_txt.text!)
        
        if dotFound == false {
            Celsius_txt.text = conversion.Convert_Kelvin_to_Celsius(Kelvin: Kelvin)
            Fahrenheit_txt.text = conversion.Convert_Kelvin_to_Fahrenheit(Kelvin: Kelvin)
        } else {
            let truncated = String(describing: KelvinString!.dropLast())
            Kelvin_txt.text = truncated
        }
    }
    
    @IBAction func SaveTemperature(_ sender: Any) {
        let coreDataHandler = CoreDataHandler()
        let celsius = Celsius_txt.text! + " Celsius = "
        let fahrenheit = Fahrenheit_txt.text! + " Fahrenheit = "
        let kelvin = Kelvin_txt.text! + " Kelvin"
        
        var message:[String] = []
        let Conversion_In_One_Line = celsius + fahrenheit + kelvin
        message = coreDataHandler.saveTemperatureConversion(conversion: Conversion_In_One_Line)
        DisplayAlert(title: message[0], message: message[1])
    }
    
    @IBAction func MinusPressed(_ sender: Any) {
        
        if(Celsius_txt.isEditing) {
            Celsius_txt.text = "-"
        } else if (Fahrenheit_txt.isEditing) {
            Fahrenheit_txt.text = "-"
        } else if (Kelvin_txt.isEditing) {
            Kelvin_txt.text = "-"
        } else {
            DisplayAlert(title: "No TextField selected", message: "Please select a TextField where to input the minus.")
        }
        
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
