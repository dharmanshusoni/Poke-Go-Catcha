//
//  PokeAnnotation.swift
//  Poke Go Catcha!
//
//  Created by dharmanshu on 10/11/20.
//

import Foundation
import MapKit
let pokemon = ["bulbasaur","ivysaur","venusaur"]

class PokeAnnotation: NSObject,MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    var pokemonNumber: Int
    var pokemonName: String
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D,pokemonNumber: Int,pokemonName: String) {
        self.coordinate = coordinate
        self.pokemonNumber = pokemonNumber
        self.pokemonName = pokemonName
        self.title = self.pokemonName
    }
}
