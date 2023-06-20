import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewTeamsID, for: indexPath) as! TeamsTableViewCell
        cell.labelName.text = teamsList[indexPath.row].name
        
        
        // button for editing/deleting
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        
        buttonOptions.menu = UIMenu(title: "Edit/Delete",
                                    children: [
                                        UIAction(title:"Edit", handler: {(_) in self.editSelectedFor(team: indexPath.row)}),
                                        UIAction(title:"Delete", handler: {(_) in self.deleteSelectedFor(team: indexPath.row)})
                                    ]
        )
        
        cell.accessoryView = buttonOptions
        
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
