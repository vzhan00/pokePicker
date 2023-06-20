import Foundation
import FirebaseFirestoreSwift

struct Team: Codable{
    @DocumentID var id: String?
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
