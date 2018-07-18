//
//  Volume.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 13/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.Gallon_txt.delegate = self
        self.Litre_txt.delegate = self
        self.Pint_txt.delegate = self
        self.Fluid_txt.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Gallon_txt: UITextField!
    @IBOutlet weak var Litre_txt: UITextField!
    @IBOutlet weak var Pint_txt: UITextField!
    @IBOutlet weak var Fluid_txt: UITextField!
    
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
    
    @IBAction func User_Typing_Gallon_txt(_ sender: Any) {
        let Gallon = (self.Gallon_txt.text! as NSString).floatValue
        let GallonString = Gallon_txt.text
        let dotFound:Bool = checkDot(str: Gallon_txt.text!)
        
        if dotFound == false {
            Litre_txt.text = conversion.Convert_Gallon_to_Litre(Gallon: Gallon)
            Pint_txt.text = conversion.Convert_Gallon_to_Pint(Gallon: Gallon)
            Fluid_txt.text = conversion.Convert_Gallon_to_Fluid(Gallon: Gallon)
        } else {
            let truncated = String(describing: GallonString!.dropLast())
            Gallon_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Litre_txt(_ sender: Any) {
        let Litre = (self.Litre_txt.text! as NSString).floatValue
        let LitreString = Litre_txt.text
        let dotFound:Bool = checkDot(str: Litre_txt.text!)
        
        if dotFound == false {
            Gallon_txt.text = conversion.Convert_Litre_to_Gallon(Litre: Litre)
            Pint_txt.text = conversion.Convert_Litre_to_Pint(Litre: Litre)
            Fluid_txt.text = conversion.Convert_Litre_to_Fluid(Litre: Litre)
        } else {
            let truncated = String(describing: LitreString!.dropLast())
            Litre_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Pint_txt(_ sender: Any) {
        let Pint = (self.Pint_txt.text! as NSString).floatValue
        let PintString = Pint_txt.text
        let dotFound:Bool = checkDot(str: Pint_txt.text!)
        
        if dotFound == false {
            Gallon_txt.text = conversion.Convert_Pint_to_Gallon(Pint: Pint)
            Litre_txt.text = conversion.Convert_Pint_to_Litre(Pint: Pint)
            Fluid_txt.text = conversion.Convert_Pint_to_Fluid(Pint: Pint)
        } else {
            let truncated = String(describing: PintString!.dropLast())
            Pint_txt.text = truncated
        }
    }
    
    @IBAction func User_Typing_Fluid_txt(_ sender: Any) {
        let Fluid = (self.Fluid_txt.text! as NSString).floatValue
        let FluidString = Fluid_txt.text
        let dotFound:Bool = checkDot(str: Fluid_txt.text!)
        
        if dotFound == false {
            Gallon_txt.text = conversion.Convert_Fluid_to_Gallon(Fluid: Fluid)
            Litre_txt.text = conversion.Convert_Fluid_to_Litre(Fluid: Fluid)
            Pint_txt.text = conversion.Convert_Fluid_to_Pint(Fluid: Fluid)
        } else {
            let truncated = String(describing: FluidString!.dropLast())
            Fluid_txt.text = truncated
        }
    }
    
    @IBAction func SaveVolume(_ sender: Any) {
        let coreDataHandler = CoreDataHandler()
        let gallon = Gallon_txt.text! + " Gallon = "
        let litre = Litre_txt.text! + " Litre = "
        let pint = Pint_txt.text! + " Pint = "
        let fluid = Fluid_txt.text! + " Fluid"
        
        var message:[String] = []
        let Conversion_In_One_Line = gallon + litre + pint + fluid
        message = coreDataHandler.saveLiquidsConversion(conversion: Conversion_In_One_Line)
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
