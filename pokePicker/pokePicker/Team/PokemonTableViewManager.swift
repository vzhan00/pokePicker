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
        
        
        // Load the sprite image
        let pokemonName = pokemonList[indexPath.row].name.lowercased()
        let image = UIImage(named: "\(pokemonName).png") ?? UIImage(named: "questionmark.png")
        cell.pokemonSprite.image = image
        
        // button for editing/deleting
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        
        buttonOptions.menu = UIMenu(title: "Edit/Delete",
                                    children: [
                                        UIAction(title:"Edit", handler: {(_) in self.editSelectedFor(pokemon: indexPath.row)}),
                                        UIAction(title:"Delete", handler: {(_) in self.deleteSelectedFor(pokemon: indexPath.row)})
                                    ]
        )
        
        cell.accessoryView = buttonOptions
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonVC = PokemonViewController()
        
        pokemonVC.receivedPokemon = pokemonList[indexPath.row]
        pokemonVC.currentTeam = currentTeam
        pokemonVC.currentUser = currentUser
        
        navigationController?.pushViewController(pokemonVC, animated: true)
    }
}
