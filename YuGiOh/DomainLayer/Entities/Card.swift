//
//  Card.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import Foundation

typealias Cards = [Card]

// MARK: - CardData
struct CardData: Codable {
    let data: [Card]
}

// MARK: - Card
struct Card: Codable, Equatable {
    let id: Int
    let name: String
    let desc: String
    let cardImages: [CardImage]
    let type: String
    static let monsterCardRaces = ["Aqua", "Beast", "Beast-Warrior", "Creator-God", "Cyberse", "Dinosaur", "Divine-Beast", "Dragon", "Fairy", "Fiend", "Fish", "Insect", "Machine", "Plant", "Psychic", "Pyro", "Reptile", "Rock", "Sea Serpent", "Spellcaster", "Thunder", "Warrior", "Winged Beast", "Wyrm", "Zombie"]
    
    enum CodingKeys: String, CodingKey {
        case id, name, desc, type
        case cardImages = "card_images"
    }
}

struct CardImage: Codable, Equatable {
    let id: Int
    let imageURL, imageURLSmall, imageURLCropped: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
        case imageURLCropped = "image_url_cropped"
    }
}

