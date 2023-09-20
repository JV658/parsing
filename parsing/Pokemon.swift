//
//  Pokemon.swift
//  parsing
//
//  Created by Cambrian on 2023-09-20.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let is_default: Bool
    let abilities: [Abilities]
    let sprites: Sprites
    
    struct Abilities: Codable {
        let ability: Ability
        let is_hidden: Bool
        let slot: Int
    }
    
    struct Ability: Codable {
        let name: String
        let url: String
    }
    
    struct Sprites: Codable {
        let back_default: String?
        let back_female: String?
        let back_shiny: String?
        let back_shiny_female: String?
        let front_default: String?
        let front_female: String?
        let front_shiny: String?
        let front_shiny_female: String?
    }
}
