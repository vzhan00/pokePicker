import Foundation
import FirebaseFirestoreSwift

struct Pokemon: Codable{
    @DocumentID var id: String?
    var name: String
    var move1: String
    var move2: String
    var move3: String
    var move4: String
    
    init(name: String, move1: String, move2: String, move3: String, move4: String) {
        self.name = name
        self.move1 = move1
        self.move2 = move2
        self.move3 = move3
        self.move4 = move4
    }
}
