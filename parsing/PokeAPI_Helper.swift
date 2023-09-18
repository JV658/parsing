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
}

class PokeAPI_Helper{
    static private let baseURL_String = "https://pokeapi.co/api/v2/"
    
    static public func fetch() async throws -> Any{
        guard
            let url = URL(string: baseURL_String)
        else {throw PokeAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //print(response)
            
            let jsonObject = try JSONSerialization.jsonObject(with: data)
        
            return jsonObject
        } catch {
            throw error
        }
    }
}
