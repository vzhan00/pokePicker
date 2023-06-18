import Foundation
import FirebaseAuth

struct User: Codable {
    let name: String
    let email: String
    
    init?(firebaseUser: FirebaseAuth.User) {
        guard let name = firebaseUser.displayName,
              let email = firebaseUser.email else {
            return nil
        }
        
        self.name = name
        self.email = email
    }
    
    init?(name:String, email:String) {
        self.name = name
        self.email = email
    }
}
