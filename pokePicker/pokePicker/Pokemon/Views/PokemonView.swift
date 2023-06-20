import UIKit

class PokemonView: UIView {
    var name:UILabel!
    var move1:UILabel!
    var move2:UILabel!
    var move3:UILabel!
    var move4:UILabel!
    var pokemonSprite: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupName()
        setupMove1()
        setupMove2()
        setupMove3()
        setupMove4()
        setupPokemonSprite()
        
        initConstraints()
    }
    
    func setupName() {
        name = UILabel()
        name.font = UIFont.systemFont(ofSize: 14)
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupMove1() {
        move1 = UILabel()
        move1.font = UIFont.systemFont(ofSize: 14)
        move1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(move1)
    }
    
    func setupMove2() {
        move2 = UILabel()
        move2.font = UIFont.systemFont(ofSize: 14)
        move2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(move2)
    }
    
    func setupMove3() {
        move3 = UILabel()
        move3.font = UIFont.systemFont(ofSize: 14)
        move3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(move3)
    }
    
    func setupMove4() {
        move4 = UILabel()
        move4.font = UIFont.systemFont(ofSize: 14)
        move4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(move4)
    }
    
    func setupPokemonSprite() {
         pokemonSprite = UIImageView()
         pokemonSprite.translatesAutoresizingMaskIntoConstraints = false
         self.addSubview(pokemonSprite)
     }
    

    func initConstraints(){
        
        NSLayoutConstraint.activate([
            pokemonSprite.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            pokemonSprite.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            pokemonSprite.widthAnchor.constraint(equalToConstant: 100),
            pokemonSprite.heightAnchor.constraint(equalToConstant: 100),
            
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.topAnchor.constraint(equalTo: pokemonSprite.bottomAnchor, constant: 16),
            
            move1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            move1.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            
            move2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            move2.topAnchor.constraint(equalTo: move1.bottomAnchor, constant: 16),
            
            move3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            move3.topAnchor.constraint(equalTo: move2.bottomAnchor, constant: 16),
            
            move4.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            move4.topAnchor.constraint(equalTo: move3.bottomAnchor, constant: 16),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
