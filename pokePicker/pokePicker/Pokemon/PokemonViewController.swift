import UIKit

class PokemonViewController: UIViewController {
    
    let displayScreen = PokemonView()
    
    var receivedPokemon: Pokemon?
    
    override func loadView() {
        view = displayScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        displayScreen.name.text = receivedPokemon!.name
        displayScreen.move1.text = "Move 1: \(receivedPokemon!.move1)"
        displayScreen.move2.text = "Move 2: \(receivedPokemon!.move2)"
        displayScreen.move3.text = "Move 3: \(receivedPokemon!.move3)"
        displayScreen.move4.text = "Move 4: \(receivedPokemon!.move4)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditBarButtonTapped))
    }
    
    @objc func onEditBarButtonTapped() {
        let editViewController = EditViewController()
        editViewController.delegate = self
        editViewController.pokemon = receivedPokemon
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension PokemonViewController: EditViewControllerDelegate {
    func didUpdatePokemon(_ pokemon: Pokemon) {
        receivedPokemon = pokemon
        
        // Update the displayed values
        displayScreen.name.text = receivedPokemon!.name
        displayScreen.move1.text = "Move 1: \(receivedPokemon!.move1)"
        displayScreen.move2.text = "Move 2: \(receivedPokemon!.move2)"
        displayScreen.move3.text = "Move 3: \(receivedPokemon!.move3)"
        displayScreen.move4.text = "Move 4: \(receivedPokemon!.move4)"
    }
}
