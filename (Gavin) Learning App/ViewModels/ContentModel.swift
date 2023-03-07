//
//  ContentModel.swift
//  (Gavin) Learning App
//
//  Created by Gavin Kwon on 3/5/23.
//

import Foundation

class ContenModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
            
        } catch {
            print("Couldn't parse local data") // parshing Data error
        }
        
        // Parse the style data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
            
        } catch {
            print("Couldn't parse style data")
        }
        
    }
    
}
