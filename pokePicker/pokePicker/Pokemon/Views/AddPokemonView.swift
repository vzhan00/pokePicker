import UIKit

class AddPokemonView: UIView {
    var textFieldName: UITextField!
    var textMove1: UITextField!
    var textMove2: UITextField!
    var textMove3: UITextField!
    var textMove4: UITextField!
    var buttonAdd: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldMove1()
        setupTextFieldMove2()
        setupTextFieldMove3()
        setupTextFieldMove4()
        setupButtonAdd()
        
        initConstraints()
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldMove1(){
        textMove1 = UITextField()
        textMove1.placeholder = "Move 1"
        textMove1.borderStyle = .roundedRect
        textMove1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textMove1)
    }
    
    func setupTextFieldMove2(){
        textMove2 = UITextField()
        textMove2.placeholder = "Move 2"
        textMove2.borderStyle = .roundedRect
        textMove2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textMove2)
    }
    
    func setupTextFieldMove3(){
        textMove3 = UITextField()
        textMove3.placeholder = "Move 3"
        textMove3.borderStyle = .roundedRect
        textMove3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textMove3)
    }
    
    func setupTextFieldMove4(){
        textMove4 = UITextField()
        textMove4.placeholder = "Move 4"
        textMove4.borderStyle = .roundedRect
        textMove4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textMove4)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.setImage(.add, for: .normal)
        buttonAdd.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textMove1.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 8),
            textMove1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textMove1.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textMove2.topAnchor.constraint(equalTo: textMove1.bottomAnchor, constant: 8),
            textMove2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textMove2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textMove3.topAnchor.constraint(equalTo: textMove2.bottomAnchor, constant: 8),
            textMove3.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textMove3.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textMove4.topAnchor.constraint(equalTo: textMove3.bottomAnchor, constant: 8),
            textMove4.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textMove4.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonAdd.topAnchor.constraint(equalTo: textMove4.bottomAnchor, constant: 8),
            buttonAdd.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAdd.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
