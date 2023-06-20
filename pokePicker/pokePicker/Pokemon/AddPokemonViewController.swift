import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AddPokemonViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    
    var currentTeam:Team?
    
    let addPokemonScreen = AddPokemonView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = addPokemonScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Pokemon"
        
        addPokemonScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        let name = addPokemonScreen.textFieldName.text
        let move1 = addPokemonScreen.textMove1.text
        let move2 = addPokemonScreen.textMove2.text
        let move3 = addPokemonScreen.textMove3.text
        let move4 = addPokemonScreen.textMove4.text
        
        let pokemon = Pokemon(name: name!, move1: move1!, move2: move2!, move3: move3!, move4: move4!)
        
        savePokemonToFireStore(pokemon: pokemon)
        
        currentTeam?.pokemon.append(pokemon)
    }
    
    //MARK: logic to add a contact to Firestore...
    func savePokemonToFireStore(pokemon: Pokemon){
        if let userEmail = currentUser!.email{
            let collectionPokemon = database
                .collection("users")
                .document(userEmail)
                .collection("teams")
                .document(currentTeam!.id!)
                .collection("pokemon")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            do{
                try collectionPokemon.addDocument(from: pokemon, completion: {(error) in
                    if error == nil{
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    
    }
        
}

//MARK: adopting progress indicator protocol...
extension AddPokemonViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
