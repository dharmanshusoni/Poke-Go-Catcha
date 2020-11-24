//
//  PokemonDetailVC.swift
//  Poke Go Catcha!
//
//  Created by dharmanshu on 04/11/20.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var geoLocationScreen:GeoLocationVC?

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image=img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetails {
            // call after the data is downloaded
            self.updateUI()
        }
    }

    func updateUI(){
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func GeoLocationBtn(_ sender: UIButton) {
        //geoLocationScreen?.onUserAction(data: pokemon)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GeoLocationVC
        {
            let vc = segue.destination as? GeoLocationVC
            vc?.pokemon = pokemon
        }
    }
}
