import UIKit

class QRGeneratorViewController: UIViewController {
    var qrGeneratorView: QRGeneratorView! {
        return self.view as? QRGeneratorView
    }
    
    var team: Team!
    
    override func loadView() {
        view = QRGeneratorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(team)
        print(try? JSONEncoder().encode(team))
        
        struct SimplifiedTeam: Codable {
            var name: String
        }

        let simplifiedTeam = SimplifiedTeam(name: team.name)
        guard let teamData = try? JSONEncoder().encode(simplifiedTeam),
              let teamString = String(data: teamData, encoding: .utf8) else { return }

        
//        guard let teamData = try? JSONEncoder().encode(team),
//              let teamString = String(data: teamData, encoding: .utf8) else { return }

        if let qrCodeImage = QRCodeGenerator.shared.generateQRCode(from: teamString) {
            qrGeneratorView.imageView.image = qrCodeImage
        } else {
            print("Failed to generate QR code image.")
        }
    }
}
