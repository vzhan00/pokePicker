//
//  EditViewController.swift
//  pokePicker
//
//  Created by Irina Kaper on 6/19/23.
//
import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func didUpdatePokemon(_ pokemon: Pokemon)
}

class EditViewController: UIViewController {
    var delegate: EditViewControllerDelegate?
    
    var pokemon: Pokemon?
    
    var nameTextField: UITextField!
    var move1TextField: UITextField!
    var move2TextField: UITextField!
    var move3TextField: UITextField!
    var move4TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        populateFields()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneBarButtonTapped))
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.font = UIFont.systemFont(ofSize: 14)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        move1TextField = UITextField()
        move1TextField.placeholder = "Move 1"
        move1TextField.borderStyle = .roundedRect
        move1TextField.font = UIFont.systemFont(ofSize: 14)
        move1TextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(move1TextField)
        
        move2TextField = UITextField()
        move2TextField.placeholder = "Move 2"
        move2TextField.borderStyle = .roundedRect
        move2TextField.font = UIFont.systemFont(ofSize: 14)
        move2TextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(move2TextField)
        
        move3TextField = UITextField()
        move3TextField.placeholder = "Move 3"
        move3TextField.borderStyle = .roundedRect
        move3TextField.font = UIFont.systemFont(ofSize: 14)
        move3TextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(move3TextField)
        
        move4TextField = UITextField()
        move4TextField.placeholder = "Move 4"
        move4TextField.borderStyle = .roundedRect
        move4TextField.font = UIFont.systemFont(ofSize: 14)
        move4TextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(move4TextField)
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            move1TextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            move1TextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            move2TextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            move2TextField.topAnchor.constraint(equalTo: move1TextField.bottomAnchor, constant: 16),
            move3TextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            move3TextField.topAnchor.constraint(equalTo: move2TextField.bottomAnchor, constant: 16),
            move4TextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            move4TextField.topAnchor.constraint(equalTo: move3TextField.bottomAnchor, constant: 16)
        ])
    }
    
    func populateFields() {
        guard let pokemon = pokemon else { return }
        
        nameTextField.text = pokemon.name
        move1TextField.text = pokemon.move1
        move2TextField.text = pokemon.move2
        move3TextField.text = pokemon.move3
        move4TextField.text = pokemon.move4
    }
    
    @objc func onDoneBarButtonTapped() {
        guard let pokemon = pokemon else { return }
        
        let editedPokemon = Pokemon(
            name: nameTextField.text ?? "",
            move1: move1TextField.text ?? "",
            move2: move2TextField.text ?? "",
            move3: move3TextField.text ?? "",
            move4: move4TextField.text ?? ""
        )
        
        delegate?.didUpdatePokemon(editedPokemon)
        navigationController?.popViewController(animated: true)
    }
}

