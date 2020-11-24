//
//  Pokemon.swift
//  Poke Go Catcha!
//
//  Created by dharmanshu on 02/11/20.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _defense:String!
    private var _height:String!
    private var _weight:String!
    private var _attack:String!
    private var _nextEvolutionText:String!
    private var _pokemonURL:String!
    
    var description : String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type : String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense : String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height : String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight : String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack : String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionText : String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var name : String{
        return _name
    }
    
    var pokedexId : Int{
        return _pokedexId
    }
    
    init(name : String,pokedexId : Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete){
        AF.request(_pokemonURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonDate = [value]
                 for pokemons in jsonDate {
                    if let obj = pokemons as? [String: Any] {
                        if let weight = obj["weight"] as? Int{
                            self._weight = "\(weight)"
                        }
                        
                        if let height = obj["height"] as? Int{
                            self._height = "\(height)"
                        }
                        
                        if let defense = obj["base_experience"] as? Int{
                            self._defense = "\(defense)"
                        }
                        
                        if let attack = obj["base_experience"] as? Int{
                            self._attack = "\(attack)"
                        }
                        if let type = obj["types"] as? [AnyObject],type.count>0{
                            let tList = type
                            for x in 0..<tList.count {
                                if let name = tList[x]["type"] as? Dictionary<String,String>{
                                    if let typeName = name["name"] {
                                        if typeName != nil {
                                            if self.type != nil{
                                                self._type! += " \(typeName)"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        print(self._type ?? "Unknown")
                    }
                    completed()
                }
                break
            case .failure(let error):
                break
            }
            completed()
        }
    }
}
