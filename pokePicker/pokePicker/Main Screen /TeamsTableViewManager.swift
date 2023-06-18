import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewContactsID, for: indexPath) as! TeamsTableViewCell
        cell.labelName.text = contactsList[indexPath.row].name
        cell.labelEmail.text = contactsList[indexPath.row].email
        cell.labelPhone.text = "\(contactsList[indexPath.row].phone)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamVC = TeamViewController()
        
//        if let firebaseUser = currentUser {
//            teamVC.currentUser = User(firebaseUser: firebaseUser)
//        }
//
//        teamVC.contactUser = usersList[indexPath.row]
        navigationController?.pushViewController(teamVC, animated: true)
    }
}
