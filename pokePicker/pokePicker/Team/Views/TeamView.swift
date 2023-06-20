import UIKit

class TeamView: UIView {
    var labelText: UILabel!
    var floatingButtonAddContact: UIButton!
    @IBOutlet var tableViewPokemon: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelText()
        setupFloatingButtonAddContact()
        setupTableViewPokemon()
        initConstraints()
    }
    
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewPokemon(){
        tableViewPokemon = UITableView()
        tableViewPokemon.register(PokemonTableViewCell.self, forCellReuseIdentifier: Configs.tableViewPokemonID)
        tableViewPokemon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPokemon)
    }
    
    func setupFloatingButtonAddContact(){
        floatingButtonAddContact = UIButton(type: .system)
        floatingButtonAddContact.setTitle("", for: .normal)
        floatingButtonAddContact.setImage(UIImage(systemName: "person.crop.circle.fill.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonAddContact.contentHorizontalAlignment = .fill
        floatingButtonAddContact.contentVerticalAlignment = .fill
        floatingButtonAddContact.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddContact.layer.cornerRadius = 16
        floatingButtonAddContact.imageView?.layer.shadowOffset = .zero
        floatingButtonAddContact.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddContact.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddContact.imageView?.clipsToBounds = true
        floatingButtonAddContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddContact)
    }
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            tableViewPokemon.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
            tableViewPokemon.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewPokemon.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewPokemon.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            floatingButtonAddContact.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonAddContact.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonAddContact.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddContact.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
