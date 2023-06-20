//
//  PokemonTableViewManager.swift
//  pokePicker
//
//  Created by Bob Joe on 6/18/23.
//

import Foundation
import UIKit

extension TeamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewPokemonID, for: indexPath) as! PokemonTableViewCell
        cell.labelName.text = pokemonList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonVC = PokemonViewController()
        
//        if let firebaseUser = currentUser {
//            teamVC.currentUser = User(firebaseUser: firebaseUser)
//        }
//
        pokemonVC.receivedPokemon = pokemonList[indexPath.row]
        navigationController?.pushViewController(pokemonVC, animated: true)
    }
}
