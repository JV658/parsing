//
//  DogAPI_Helper.swift
//  parsing
//
//  Created by Cambrian on 2023-09-18.
//

import Foundation

class DogAPI_Helper {
    private static let urlString = "https://dog.ceo/api/breeds/list/all"
    
    public static func fetch() async -> [String:[String]]{
        guard
            let url = URL(string: urlString)
        else { preconditionFailure("cannot convert urlstring to url") }
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        let jsonObject = try! JSONSerialization.jsonObject(with: data)
        
        guard
            let jsonDictionary = jsonObject as? [AnyHashable: Any],
            let breeds = jsonDictionary["message"] as? [String:[String]]
        else { preconditionFailure("something went wrong when parsing")}
        
        return breeds
    }
}
