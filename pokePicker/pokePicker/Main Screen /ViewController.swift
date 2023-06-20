import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    
    var teamsList = [Team]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.mainScreen.labelText.text = "Please sign in to see the teams!"
                self.mainScreen.floatingButtonAddContact.isEnabled = false
                self.mainScreen.floatingButtonAddContact.isHidden = true
                
                //MARK: Reset tableView...
                self.teamsList.removeAll()
                self.mainScreen.tableViewTeams.reloadData()
                
                //MARK: Sign in bar button...
                self.setupRightBarButton(isLoggedin: false)
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
                self.mainScreen.floatingButtonAddContact.isEnabled = true
                self.mainScreen.floatingButtonAddContact.isHidden = false
                
                //MARK: Logout bar button...
                self.setupRightBarButton(isLoggedin: true)
                
                //MARK: Observe Firestore database to display the contacts list...
                self.database.collection("users")
                    .document((self.currentUser?.email)!)
                    .collection("teams")
                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                        if let documents = querySnapshot?.documents{
                            self.teamsList.removeAll()
                            for document in documents{
                                do{
                                    let contact  = try document.data(as: Team.self)
                                    self.teamsList.append(contact)
                                }catch{
                                    print(error)
                                }
                            }
                            self.teamsList.sort(by: {$0.name < $1.name})
                            self.mainScreen.tableViewTeams.reloadData()
                        }
                    })
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Teams"
        
        //MARK: patching table view delegate and data source...
        mainScreen.tableViewTeams.delegate = self
        mainScreen.tableViewTeams.dataSource = self
        
        //MARK: removing the separator line...
        mainScreen.tableViewTeams.separatorStyle = .none
        
        //MARK: Make the titles look large...
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(mainScreen.floatingButtonAddContact)
        
        //MARK: tapping the floating add contact button...
        mainScreen.floatingButtonAddContact.addTarget(self, action: #selector(addTeamButtonTapped), for: .touchUpInside)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    @objc func addTeamButtonTapped(){
        let addTeamController = AddTeamViewController()
        addTeamController.currentUser = self.currentUser
        navigationController?.pushViewController(addTeamController, animated: true)
    }
    
    func editSelectedFor(team: Int) {
        let alert = UIAlertController(title: "Edit Team", message: "Enter new team name", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = ""
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] as! UITextField
            self.database.collection("users")
                .document((self.currentUser?.email)!)
                .collection("teams")
                .document(self.teamsList[team].id!)
                .updateData(["name": textField.text])
        }))
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                    print("Cancel button click")
                }
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
        
        mainScreen.tableViewTeams.reloadData()
    }
    
    func deleteSelectedFor(team: Int) {
        self.database.collection("users")
            .document((self.currentUser?.email)!)
            .collection("teams")
            .document(teamsList[team].id!)
            .delete()
        
        mainScreen.tableViewTeams.reloadData()
    }
}

