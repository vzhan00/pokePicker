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
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditBarButtonTapped))
    }
    
    
//    EDIT TODO
//    @objc func onEditBarButtonTapped() {
//        let addEditViewController = EditViewController()
//        addEditViewController.delegate = self
//        navigationController?.pushViewController(addEditViewController, animated: true)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
