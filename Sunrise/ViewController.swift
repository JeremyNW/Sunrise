//
//  ViewController.swift
//  Sunrise
//
//  Created by Jeremy Warren on 5/10/22.
//
// https://api.sunrise-sunset.org/json?lat=40.2969&lng=111.6946&date=today

import UIKit

class ViewController: UIViewController {
    
    let manager = SunriseManager()
    
    @IBOutlet weak var SunriseTextLabel: UILabel!
    @IBOutlet weak var SunsetTextLabel: UILabel!
    @IBOutlet weak var DayLengthTextLabel: UILabel!
    @IBOutlet weak var SolarNoonTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        Task {
            do {
                let sunrise = try await manager.searchForSunrise()
                print("fetched")
                
                
                SunriseTextLabel.text = "The sunrise in Provo, UT is at \(sunrise.results.sunrise)."
                SunsetTextLabel.text = "The sunset in Provo, UT is at \(sunrise.results.sunset)."
                DayLengthTextLabel.text = "Today will last \(sunrise.results.dayLength) hours"
                SolarNoonTextLabel.text = "Solar noon today is at \(sunrise.results.solarNoon)"
            } catch {
                print(error)
            }
        }
    }
}

