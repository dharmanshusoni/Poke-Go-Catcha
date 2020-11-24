//
//  PokeCell.swift
//  Poke Go Catcha!
//
//  Created by dharmanshu on 03/11/20.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 1.0

    }
    
    func configureCell(pokemon : Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
    
}
