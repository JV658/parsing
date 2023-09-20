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
    
    static public func fetch() async throws -> Pokemon{
        guard
            let url = URL(string: baseURL_String)
        else {throw PokeAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
                        
            let decoder = JSONDecoder()
            
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            
            print(pokemon)
            
            return pokemon
        } catch {
            throw error
        }
    }
}
