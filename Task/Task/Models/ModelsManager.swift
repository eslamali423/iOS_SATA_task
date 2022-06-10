//
//  ModelsManager.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import Foundation


struct APIResponse : Codable {
    let categories : [Category]
    let sliders : [Slider]
    let newoffers : [Offer]
}

struct Category : Codable {
    let name: String
    let photo : String
    let id : Int
}

struct Slider : Codable {
    let photo : String
}


struct Offer : Codable {
    let name : String
    let RestauranthId : Int
    let description : String
    let cover : String
    let cuisines : [Cusin]
}

struct Cusin : Codable {
    let name : String
}


