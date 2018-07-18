//
//  HistoryViewController.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 14/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var Weight_btn: UIButton!
    
    @IBOutlet weak var Temperature_btn: UIButton!
    
    @IBOutlet weak var Liquids_btn: UIButton!
    
    @IBOutlet weak var Speed_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DisplayHistory_txt.text = "Press one of the top icon to see the History"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let coreDataHandler = CoreDataHandler()
    
    @IBAction func WeightButtonPressed(_ sender: UIButton) {
        let weight:Array<String> = coreDataHandler.displayWeightConversion()
        if weight.isEmpty {
            DisplayHistory_txt.text = "No History found!"
        } else {
            let weight5 = weight.suffix(5)
            DisplayHistory_txt.text = weight5.joined(separator: "\n\n")
        }
        sender.shake() //animation when button is pressed
        
        Weight_btn.backgroundColor = UIColor.white
        Temperature_btn.backgroundColor = UIColor.clear
        Liquids_btn.backgroundColor = UIColor.clear
        Speed_btn.backgroundColor = UIColor.clear
    }

    
    @IBAction func TemperaturePressed(_ sender: UIButton) {
        let temperature:Array<String> = coreDataHandler.displayTemperatureConversion()
        
        if temperature.isEmpty {
            DisplayHistory_txt.text = "No History found!"
        } else {
            let temperature5 = temperature.suffix(5)
            DisplayHistory_txt.text = temperature5.joined(separator: "\n\n")
        }
        
        sender.shake() //animation when button is pressed
        Weight_btn.backgroundColor = UIColor.clear
        Temperature_btn.backgroundColor = UIColor.white
        Liquids_btn.backgroundColor = UIColor.clear
        Speed_btn.backgroundColor = UIColor.clear
    }
    
    
    @IBAction func LiquidsPressed(_ sender: UIButton) {
        let liquids:Array<String> = coreDataHandler.displayLiquidsConversion()
        if liquids.isEmpty {
            DisplayHistory_txt.text = "No History found!"
        } else {
            let liquids5 = liquids.suffix(5)
            DisplayHistory_txt.text = liquids5.joined(separator: "\n\n")
        }
        sender.shake() //animation when button is pressed
        
        Weight_btn.backgroundColor = UIColor.clear
        Temperature_btn.backgroundColor = UIColor.clear
        Liquids_btn.backgroundColor = UIColor.white
        Speed_btn.backgroundColor = UIColor.clear
    }
    @IBAction func SpeedPressed(_ sender: UIButton) {
        let speed:Array<String> = coreDataHandler.displaySpeedConversion()
        
        if speed.isEmpty {
            DisplayHistory_txt.text = "No History found!"
        } else {
            let speed5 = speed.suffix(5)
            DisplayHistory_txt.text = speed5.joined(separator: "\n\n")
        }
        
        sender.shake() //animation when button is pressed
        Weight_btn.backgroundColor = UIColor.clear
        Temperature_btn.backgroundColor = UIColor.clear
        Liquids_btn.backgroundColor = UIColor.clear
        Speed_btn.backgroundColor = UIColor.white
    }
    
    
    
    
    @IBOutlet weak var DisplayHistory_txt: UILabel!
    
    @IBAction func DeleteHistory_btn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let delete = NSBatchDeleteRequest(fetchRequest: Conversion.fetchRequest())
        
        do {
            try context.execute(delete)
            DisplayAlert(title: "History Deleted!", message: "All history has been deleted.")
            print("ALL DELETE")
            DisplayHistory_txt.text = "No History found."
        } catch {
            //Process ERROR
            DisplayAlert(title: "Ops..!", message: "A problem has occured. Please try later.")
            print("NOT DELETE")
        }
    }
    
    func DisplayAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:{ (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
