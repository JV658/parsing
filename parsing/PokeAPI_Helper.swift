//
//  PokeAPI_Helper.swift
//  concurrentcy
//
//  Created by Cambrian on 2023-09-11.
//

import Foundation

enum PokeAPI_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
    case CANNOT_PARSE_JSON_DATA
}

class PokeAPI_Helper{
    static private let baseURL_String = "https://pokeapi.co/api/v2/pokemon/ditto"
    
    static public func fetch() async throws -> [Ability]{
        guard
            let url = URL(string: baseURL_String)
        else {throw PokeAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
                        
            let jsonObject = try JSONSerialization.jsonObject(with: data)
        
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let result = jsonDictionary["abilities"] as? [[String:Any]]
            else {throw PokeAPI_Errors.CANNOT_PARSE_JSON_DATA}
            
            var abilities: [Ability] = []
            for ability in result {
                guard
                    let abDictionary = ability as? [AnyHashable:Any],
                    let ab = abDictionary["ability"] as? [String: String],
                    let name = ab["name"],
                    let url = ab["url"]
                else { preconditionFailure("error")}
                let newAbility = Ability(name: name, url: url)
                abilities.append(newAbility)
            }
            
            return abilities
        } catch {
            throw error
        }
    }
}
