//
//  QRGeneratorViewController.swift
//  pokePicker
//
//  Created by Irina Kaper on 6/18/23.
//

import UIKit

class QRGeneratorViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var team: Team!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let teamData = try? JSONEncoder().encode(team),
              let teamString = String(data: teamData, encoding: .utf8) else { return }
        
        imageView.image = QRCodeGenerator.shared.generateQRCode(from: teamString)
    }
}
