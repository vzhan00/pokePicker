import UIKit
import FirebaseAuth
import FirebaseFirestore

class TeamViewController: UIViewController {

    let teamScreen = TeamView()
    
    var pokemonList = [Pokemon]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    var currentTeam: Team?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = teamScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.teamScreen.labelText.text = currentTeam!.name
        self.teamScreen.floatingButtonAddContact.isEnabled = true
        self.teamScreen.floatingButtonAddContact.isHidden = false
        
        //MARK: Observe Firestore database to display the contacts list...
        self.database.collection("users")
            .document((self.currentUser?.email)!)
            .collection("contacts")
            .document(self.currentTeam!.id!)
            .collection("pokemon")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.pokemonList.removeAll()
                    for document in documents{
                        do{
                            let pokemon  = try document.data(as: Pokemon.self)
                            self.pokemonList.append(pokemon)
                        }catch{
                            print(error)
                        }
                    }
                    self.pokemonList.sort(by: {$0.name < $1.name})
                    self.teamScreen.tableViewPokemon.reloadData()
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pokemon"
        
        //MARK: patching table view delegate and data source...
        teamScreen.tableViewPokemon.delegate = self
        teamScreen.tableViewPokemon.dataSource = self
        
        //MARK: removing the separator line...
        teamScreen.tableViewPokemon.separatorStyle = .none
        
        //MARK: Make the titles look large...
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(teamScreen.floatingButtonAddContact)
        
        //MARK: tapping the floating add contact button...
        teamScreen.floatingButtonAddContact.addTarget(self, action: #selector(addContactButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    @objc func addContactButtonTapped(){
        let addContactController = AddTeamViewController()
        addContactController.currentUser = self.currentUser
        navigationController?.pushViewController(addContactController, animated: true)
    }
}

