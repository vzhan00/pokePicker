import Foundation
import FirebaseFirestoreSwift

struct Team: Codable{
    @DocumentID var id: String?
    var name: String
    var pokemon: [Pokemon]
    
    init(name: String, pokemon: [Pokemon]) {
        self.name = name
        self.pokemon = pokemon
    }
}
