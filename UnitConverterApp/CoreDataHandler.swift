//
//  CoreDataHandler.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 14/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: UIViewController {
    
    

    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let context = appDelegate.persistentContainer.viewContext
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveWeightConversion(conversion:String) -> Array<String> {
        var message:[String] = []

        //check if string contain any number. If not display alert to tell user to insert a number
        let numberRegEx  = ".*[1-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: conversion)
        
        if containsNumber == false {
            let emptyTitle = "No number inserted"
            let emptyMessage = "Please enter a number to convert."
            message.append(emptyTitle)
            message.append(emptyMessage)
        } else {
        
            let context = getContext()
            let newConversion = NSEntityDescription.insertNewObject(forEntityName: "Conversion", into:context)
            
            let titleSaved = "Saved!"
            let messageSaved = "Go to 'More' to see the History"
            
            let titleProblem = "Ops..!"
            let messageProblem = "A problem has occured. Please try later."
            
            newConversion.setValue(conversion, forKey: "weight")
            
            
            do {
                try context.save()
                message.append(titleSaved)
                message.append(messageSaved)
                print("WEIGHT SAVED")
            } catch {
                //Process ERROR
                message.append(titleProblem)
                message.append(messageProblem)
                print("Problem Occured")
            }
        }
        return message
    }
    
    func saveTemperatureConversion(conversion:String) -> Array<String> {
        var message:[String] = []
        
        //check if "conversion" is empty or not
        let numberRegEx  = ".*[1-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: conversion)
        
        if containsNumber == false {
            let emptyTitle = "No number inserted"
            let emptyMessage = "Please enter a number to convert."
            message.append(emptyTitle)
            message.append(emptyMessage)
        } else {
        
            let context = getContext()
            let newConversion = NSEntityDescription.insertNewObject(forEntityName: "Conversion", into:context)
            
            let titleSaved = "Saved!"
            let messageSaved = "Go to 'More' to see the History"
            
            let titleProblem = "Ops..!"
            let messageProblem = "A problem has occured. Please try later."
            
            newConversion.setValue(conversion, forKey: "temperature")
            
            do {
                try context.save()
                message.append(titleSaved)
                message.append(messageSaved)
                print("TEMPERATURE SAVED")
            } catch {
                //Process ERROR
                message.append(titleProblem)
                message.append(messageProblem)
               print("Problem Occured")
            }
        }
        return message
    }
    
    func saveLiquidsConversion(conversion:String) -> Array<String> {
        var message:[String] = []
        
        //check if "conversion" is empty or not
        let numberRegEx  = ".*[1-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: conversion)
        
        if containsNumber == false {
            let emptyTitle = "No number inserted"
            let emptyMessage = "Please enter a number to convert."
            message.append(emptyTitle)
            message.append(emptyMessage)
        } else {
            let context = getContext()
            let newConversion = NSEntityDescription.insertNewObject(forEntityName: "Conversion", into:context)
            
            let titleSaved = "Saved!"
            let messageSaved = "Go to 'More' to see the History"
            
            let titleProblem = "Ops..!"
            let messageProblem = "A problem has occured. Please try later."
            
            newConversion.setValue(conversion, forKey: "liquids")
            
            do {
                try context.save()
                message.append(titleSaved)
                message.append(messageSaved)
                print("LIQUIDS SAVED")
            } catch {
                //Process ERROR
                message.append(titleProblem)
                message.append(messageProblem)
               print("Problem Occured")
            }
        }
        return message
    }
    
    func saveSpeedConversion(conversion:String) -> Array<String> {
        var message:[String] = []
        
        //check if "conversion" is empty or not
        let numberRegEx  = ".*[1-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: conversion)
        
        if containsNumber == false {
            let emptyTitle = "No number inserted"
            let emptyMessage = "Please enter a number to convert."
            message.append(emptyTitle)
            message.append(emptyMessage)
        } else {
            let context = getContext()
            let newConversion = NSEntityDescription.insertNewObject(forEntityName: "Conversion", into:context)
            
            let titleSaved = "Saved!"
            let messageSaved = "Go to 'More' to see the History"
            
            let titleProblem = "Ops..!"
            let messageProblem = "A problem has occured. Please try later."
            
            newConversion.setValue(conversion, forKey: "speed")
            
            do {
                try context.save()
                message.append(titleSaved)
                message.append(messageSaved)
                print("SPEED SAVED")
            } catch {
                //Process ERROR
                message.append(titleProblem)
                message.append(messageProblem)
                print("Problem Occured")
            }
        }
        return message
    }
    
    func displayWeightConversion() -> Array<String> {
        var weightArr:[String] = []
        let context = getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Conversion")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let con = result.value(forKey: "weight") as? String {
                        weightArr.append(con)
                    }
                }
            }
        } catch {
            //process ERROR
            print("Problem Occured")
        }
        return weightArr
    }
    
    func displayTemperatureConversion() -> Array<String> {
        var temperatureArr:[String] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Conversion")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let con = result.value(forKey: "temperature") as? String {
                        temperatureArr.append(con)
                    }
                }
            }
        } catch {
            //process ERROR
            print("Problem Occured")
        }
        return temperatureArr
    }
    
    func displayLiquidsConversion() -> Array<String> {
        var volumeArr:[String] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Conversion")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let con = result.value(forKey: "liquids") as? String {
                     volumeArr.append(con)
                    }
                }
            }
        } catch {
            //process ERROR
            print("Problem Occured")
        }
        return volumeArr
    }
    
    func displaySpeedConversion() -> Array<String> {
        var speedArr:[String] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Conversion")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let con = result.value(forKey: "speed") as? String {
                        speedArr.append(con)
                    }
                }
            }
        } catch {
            //process ERROR
            print("Problem Occured")
        }
        return speedArr
    }
    
    func DisplayAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:{ (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
