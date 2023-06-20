import UIKit
import FirebaseAuth
import FirebaseFirestore

class PokemonViewController: UIViewController {
    
    let displayScreen = PokemonView()
    
    let database = Firestore.firestore()
    
    var currentUser: FirebaseAuth.User?
    
    var currentTeam: Team?
    
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
        loadImage(pokemonName: receivedPokemon!.name)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditBarButtonTapped))
    }
    
    @objc func onEditBarButtonTapped() {
        let editViewController = EditViewController()
        editViewController.delegate = self
        editViewController.pokemon = receivedPokemon
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    func loadImage(pokemonName: String) {
        let formattedName = pokemonName.lowercased().replacingOccurrences(of: " ", with: "")
        if let image = UIImage(named: formattedName) {
            displayScreen.pokemonSprite.image = image
        } else {
            displayScreen.pokemonSprite.image = UIImage(named: "questionmark")
        }
    }
}

extension PokemonViewController: EditViewControllerDelegate {
    func didUpdatePokemon(_ pokemon: Pokemon) {
        receivedPokemon?.name = pokemon.name
        receivedPokemon?.move1 = pokemon.move1
        receivedPokemon?.move2 = pokemon.move2
        receivedPokemon?.move3 = pokemon.move3
        receivedPokemon?.move4 = pokemon.move4

        self.database.collection("users")
            .document((self.currentUser?.email)!)
            .collection("teams")
            .document(currentTeam!.id!)
            .collection("pokemon")
            .document(receivedPokemon!.id!)
            .updateData([
                "name": receivedPokemon!.name,
                "move1": receivedPokemon!.move1,
                "move2": receivedPokemon!.move2,
                "move3": receivedPokemon!.move3,
                "move4": receivedPokemon!.move4,
            ])

        // Update the displayed values
        displayScreen.name.text = receivedPokemon!.name
        displayScreen.move1.text = "Move 1: \(receivedPokemon!.move1)"
        displayScreen.move2.text = "Move 2: \(receivedPokemon!.move2)"
        displayScreen.move3.text = "Move 3: \(receivedPokemon!.move3)"
        displayScreen.move4.text = "Move 4: \(receivedPokemon!.move4)"

        // Update the sprite image
        loadImage(pokemonName: receivedPokemon!.name)
    }
}

