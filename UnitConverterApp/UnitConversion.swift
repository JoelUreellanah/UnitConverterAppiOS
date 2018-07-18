//
//  UnitConversion.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 15/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import Foundation
import UIKit

class UnitConversion:UIViewController {
    let DecimalNumber: String = "%.2f"
    // -------------------------------- WEIGHT CONVERSION --------------------------------
    
    //CONVERTING KILOGRAMS
    func Convert_Kg_to_Grams(Kg:Float)->String {
        var grams: Float = 0
        grams = (Kg * 1000)
        let gram: NSString = NSString(format: DecimalNumber as NSString, grams)
        return String(gram)
    }
    
    func Convert_Kg_to_Ounces(Kg:Float) -> String {
        var ounces:Float = 0
        ounces = (Kg * 35.274)
        let ounce: NSString = NSString(format: DecimalNumber as NSString, ounces)
        return String(ounce)
    }
    
    func Convert_Kg_to_Pounds(Kg:Float) -> String {
        var pounds:Float = 0
        pounds = (Kg * 2.2046)
        let pound: NSString = NSString(format: DecimalNumber as NSString, pounds)
        return String(pound)
    }
    
    func Convert_Kg_to_Stones(Kg:Float) -> String {
        var stones:Float = 0
        stones = Kg * 0.157473
        let stone: Int = Int(stones)
        //let stone : NSString = NSString(format: "%.2f", stones)
        return String(stone)
    }
    
    func Convert_Kg_to_stonePounds(Kg:Float) -> String{
        var sPound:Float = 0
        sPound = (Kg * 2.2046)
        
        var a = Int(sPound / 14)
        a = a * 14
        if sPound >= 14 {
            sPound = sPound - Float(a)
        } else {
            //do nothing
        }
        let sP: NSString = NSString(format: DecimalNumber as NSString, sPound)
        return String(sP)
    }
    
    //CONVERTING GRAMS
    func Convert_Grams_to_Kg(Grams:Float) -> String {
        var kg:Float = 0
        kg = (Grams / 1000)
        return String(kg)
    }
    
    func Convert_Grams_to_Ounces(Grams:Float) -> String {
        var ounces:Float = 0
        ounces = (Grams * 0.035274)
        return String(ounces)
    }
    
    func Convert_Grams_to_Pounds(Grams:Float) -> String {
        var pounds:Float = 0
        pounds = (Grams * 0.00220462)
        return String(pounds)
    }
    
    func Convert_Grams_to_Stones(Grams:Float) -> String {
        var stones:Float = 0
        stones = (Grams * 0.000157473)
        let stone: Int = Int(stones)
        return String(stone)
    }
    
    func Convert_Grams_to_stonePounds(Grams:Float) -> String{
        var sPound:Float = 0
        sPound = (Grams * 0.0022046)
        
        var a = Int(sPound / 14)
        a = a * 14
        if sPound >= 14 {
            sPound = sPound - Float(a)
        } else {
            //do nothing
        }
        return String(sPound)
    }
    
    //CONVERTING OUNCES
    func Convert_Ounces_to_Kg(Ounces:Float) -> String {
        var kg:Float = 0
        kg = (Ounces * 0.0283495)
        return String(kg)
    }
    
    func Convert_Ounces_to_Grams(Ounces:Float) -> String {
        var grams:Float = 0
        grams = (Ounces * 28.3495)
        return String(grams)
    }
    
    func Convert_Ounces_to_Pounds(Ounces:Float) -> String {
        var pounds:Float = 0
        pounds = (Ounces * 0.0625)
        return String(pounds)
    }
    
    func Convert_Ounces_to_Stones(Ounces:Float) -> String {
        var stones:Float = 0
        stones = (Ounces * 0.00446429)
        let stone: Int = Int(stones)
        return String(stone)
    }
    
    func Convert_Ounces_to_stonePounds(Kg:Float) -> String{
        var sPound:Float = 0
        sPound = (Kg * 2.2046)
        
        var a = Int(sPound / 14)
        a = a * 14
        if sPound >= 14 {
            sPound = sPound - Float(a)
        } else {
            //do nothing
        }
        return String(sPound)
    }
    
    //CONVERTING POUNDS
    func Convert_Pounds_to_kg(Pounds:Float) -> String {
        var kg:Float = 0
        kg = (Pounds * 0.453592)
        return String(kg)
    }
    
    func Convert_Pounds_to_Grams(Pounds:Float) -> String {
        var grams:Float = 0
        grams = (Pounds * 453.592)
        return String(grams)
    }
    
    func Convert_Pounds_to_Ounces(Pounds:Float) -> String {
        var ounces:Float = 0
        ounces = (Pounds * 16)
        return String(ounces)
    }
    
    func Convert_Pounds_to_Stones(Pounds:Float) -> String {
        var stones:Float = 0
        stones = (Pounds / 14)
        let stone: Int = Int(stones)
        return String(stone)
    }
    
    func Convert_Pounds_to_stonePounds(Kg:Float) -> String{
        var sPound:Float = 0
        sPound = (Kg * 2.2046)
        
        var a = Int(sPound / 14)
        a = a * 14
        if sPound >= 14 {
            sPound = sPound - Float(a)
        } else {
            //do nothing
        }
        return String(sPound)
    }
    
    //CONVERTING STONES
    func Convert_Stones_to_Kg(Stones:Float) -> String {
        var kg:Float = 0
        kg = (Stones * 6.35029)
        return String(kg)
    }
    
    func Convert_Stones_to_Grams(Stones:Float) -> String {
        var grams:Float = 0
        grams = (Stones * 6350.29)
        return String(grams)
    }
    
    func Convert_Stones_to_Ounces(Stones:Float) -> String {
        var ounces:Float = 0
        ounces = (Stones * 224)
        return String(ounces)
    }
    
    func Convert_Stones_to_Pounds(Stones:Float) -> String {
        var pounds:Float = 0
        pounds = (Stones * 14)
        return String(pounds)
    }
    
    //CONVERTING STONE-POUNDS
    func Convert_stonePounds_to_Kg(stonePound:Float) -> String {
        var kg:Float = 0
        kg = (stonePound * 0.453592)
        return String(kg)
    }
    
    func Convert_stonePounds_to_Grams(stonePound:Float) -> String {
        var grams:Float = 0
        grams = (stonePound * 453.592)
        return String(grams)
    }
    
    func Convert_stonePounds_to_Ounces(stonePound:Float) -> String {
        var ounces:Float = 0
        ounces = (stonePound * 16)
        return String(ounces)
    }
    
    func Convert_stonePounds_to_Stone(stonePound:Float) -> String {
        var stone:Float = 0
        stone = stonePound / 14
        let stones:Int = Int(stone)
        return String(stones)
    }
    
    // -------------------------------- TEMPERATURE CONVERSION --------------------------------
    
    //CELSIUS CONVERSION
    func Convert_Celsius_to_Fahrenheit(Celsius:Float) -> String {
        var fahrenheit:Float = 0
        fahrenheit = Celsius*(9/5) + 32
        return String(fahrenheit)
    }
    
    func Convert_Celsius_to_Kelvin(Celsius:Float) -> String {
        var kelvin:Float = 0
        kelvin = (Celsius + 275.15)
        return String(kelvin)
    }
    
    //FAHRENHEIT CONVERSION
    func Convert_Fahrenheit_to_Celsius(Fahrenheit:Float) -> String {
        var celsius:Float = 0
        celsius = ((Fahrenheit - 32) * (5/9))
        return String(celsius)
    }
    
    func Convert_Fahrenheit_to_Kelvin(Fahrenheit:Float) -> String {
        var kelvin:Float = 0
        kelvin = ((Fahrenheit + 459.67) * (5/9))
        return String(kelvin)
    }
    
    //KELVIN CONVERSION
    func Convert_Kelvin_to_Celsius(Kelvin:Float) -> String {
        var celsius:Float = 0
        celsius = (Kelvin - 273.15)
        return String(celsius)
    }
    
    func Convert_Kelvin_to_Fahrenheit(Kelvin:Float) -> String {
        var fahrenheit:Float = 0
        fahrenheit = ( (Kelvin * (9/5)) - 459.67)
        return String(fahrenheit)
    }
    
    // -------------------------------- VOLUME CONVERSION --------------------------------
    
    //GALLON CONVERTER
    func Convert_Gallon_to_Litre(Gallon:Float) -> String {
        var litre:Float = 0
        litre = (Gallon * 4.54609)
        return String(litre)
    }
    
    func Convert_Gallon_to_Pint(Gallon:Float) -> String {
        var pint:Float = 0
        pint = (Gallon * 8)
        return String(pint)
    }
    
    func Convert_Gallon_to_Fluid(Gallon:Float) -> String {
        var fluid:Float = 0
        fluid = (Gallon * 160)
        return String(fluid)
    }
    
    //LITRE CONVRTER
    func Convert_Litre_to_Gallon(Litre:Float) -> String {
        var gallon:Float = 0
        gallon = (Litre * 0.219969)
        return String(gallon)
    }
    
    func Convert_Litre_to_Pint(Litre:Float) -> String {
        var pint:Float = 0
        pint = (Litre * 1.75975)
        return String(pint)
    }
    
    func Convert_Litre_to_Fluid(Litre:Float) -> String {
        var fluid:Float = 0
        fluid = (Litre * 35.1951)
        return String(fluid)
    }
    
    //PINT CONVERTER
    func Convert_Pint_to_Gallon(Pint:Float) -> String {
        var gallon:Float = 0
        gallon = (Pint * 0.125)
        return String(gallon)
    }
    
    func Convert_Pint_to_Litre(Pint:Float) -> String {
        var litre:Float = 0
        litre = (Pint * 0.568261)
        return String(litre)
    }
    
    func Convert_Pint_to_Fluid(Pint:Float) -> String {
        var fluid:Float = 0
        fluid = (Pint * 20)
        return String(fluid)
    }
    
    //FLUID CONVERTER
    func Convert_Fluid_to_Gallon(Fluid:Float) -> String {
        var gallon:Float = 0
        gallon = (Fluid * 0.00625)
        return String(gallon)
    }
    
    func Convert_Fluid_to_Litre(Fluid:Float) -> String {
        var litre:Float = 0
        litre = (Fluid * 0.0284131)
        return String(litre)
    }
    
    func Convert_Fluid_to_Pint(Fluid:Float) -> String {
        var pint:Float = 0
        pint = (Fluid * 0.05)
        return String(pint)
    }
    
    // -------------------------------- SPEED CONVERSION --------------------------------
    
    //METRE CONVERSION
    func Convert_Metre_to_Km(Metre:Float) -> String {
        var km:Float = 0
        km = (Metre * 3.6)
        return String(km)
    }
    
    func Convert_Metre_to_Miles(Metre:Float) -> String {
        var miles:Float = 0
        miles = (Metre * 2.23694)
        return String(miles)
    }
    
    //KM CONVERSION
    func Convert_Km_to_Metre(Km:Float) -> String {
        var metre:Float = 0
        metre = (Km * 0.277778)
        return String(metre)
    }
    
    func Convert_Km_to_Miles(Km:Float) -> String {
        var miles:Float = 0
        miles = (Km * 0.621371)
        return String(miles)
    }
    
    //MILES CONVERSION
    func Convert_Miles_to_Metre(Miles:Float) -> String {
        var metre:Float = 0
        metre = (Miles * 0.44704)
        return String(metre)
    }
    
    func Convert_Miles_to_Km(Miles:Float) -> String {
        var km:Float = 0
        km = (Miles * 1.60934)
        return String(km)
    }
}
