import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewContactsID, for: indexPath) as! TeamsTableViewCell
        cell.labelName.text = teamsList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamVC = TeamViewController()
        
        if let firebaseUser = currentUser {
            teamVC.currentUser = firebaseUser
        }

        teamVC.currentTeam = teamsList[indexPath.row]
        navigationController?.pushViewController(teamVC, animated: true)
    }
}
