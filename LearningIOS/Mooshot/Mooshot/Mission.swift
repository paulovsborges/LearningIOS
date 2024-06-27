//
//  Mission.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import Foundation


struct Mission : Codable, Identifiable{
    
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName : String{
        "Apollo \(id)"
    }
    
    var image : String{
        "apollo\(id)"
    }
    
    var formattedDate : String {
         launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
