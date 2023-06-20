import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AddTeamViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    
    let addTeamScreen = AddTeamView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = addTeamScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Team"
        
        addTeamScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        let name = addTeamScreen.textFieldName.text
        let team = Team(name: name!)
        saveTeamToFireStore(team: team)
        
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveTeamToFireStore(team: Team){
        if let userEmail = currentUser!.email{
            let collectionContacts = database
                .collection("users")
                .document(userEmail)
                .collection("teams")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            do{
                try collectionContacts.addDocument(from: team, completion: {(error) in
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
extension AddTeamViewController:ProgressSpinnerDelegate{
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
