//
//  SunriseManager.swift
//  Sunrise
//
//  Created by Jeremy Warren on 5/12/22.
//

import Foundation
import UIKit


struct SunriseResponse: Codable {
    let results: Sunrise
}
struct Sunrise: Codable {
    let sunrise: String
    let sunset: String
    let dayLength: String
    let solarNoon: String
}

struct SunriseManager {
    
    // We write this line so we can type delegate.didFetch/delegate.didFail in our functions
    
    func searchForSunrise() async {
        
        // we make this guard let because we need a url to pass to our URLSession.shared.DataTask
        guard let SunriseURL = URL(string: "https://api.sunrise-sunset.org/json?lat=40.2969&lng=111.6946&date=today") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: SunriseURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let sunrise = try decoder.decode(Sunrise.self, from: data)
            self.sunrise = sunrise
            
            
        } catch {
            print(error)
        }
        
        
        
        
        
        
    }
}
