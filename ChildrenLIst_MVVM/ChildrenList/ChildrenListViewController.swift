//
//  ChildrenListViewController.swift
//  fff
//
//  Created by Anatoliy Mamchenko on 24.07.2021.
//

import SnapKit
import UIKit

class ChildrenListViewController: UIViewController {
    
    // MARK: - Private
    private var viewModel: ChildrenListViewModel?
    
    // MARK: - Public
    @IBOutlet weak var addChildButton: UIButton!
    @IBOutlet weak var childrenTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func didTapPlusButton(_ sender: Any) {
        didTapPlusButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setViewModel(viewModel: ChildrenListViewModel) {
        self.viewModel = viewModel
    }
    
    func getViewModel() -> ChildrenListViewModel {
        guard let viewModel = viewModel else {
            fatalError("Could not get \(ChildrenListViewModel.self)")
        }
        return viewModel
    }
    
    private enum CellIndetifier {
        static let childrenTableViewIndetifier = "childrenCellIndetifier"
    }
    
}


// MARK: - Private functions
private extension ChildrenListViewController {
    @objc func didTapPlusButton() {
        alertEnterChildrenInfo { nameString, ageString in
            guard let nameString = nameString, !nameString.isEmpty,
                  let ageString = ageString, let age = Int(ageString) else { return }
            self.getViewModel().addChild(name: nameString, age: age)
            self.addChildButton.isHidden = self.getViewModel().buttonIsHiden
            self.childrenTableView.reloadData()
        }
    }
    
    private func setup() {
        childrenTableView.delegate = self
        childrenTableView.dataSource = self
        nameTextField.delegate = self
        ageTextField.delegate =  self
    }
}

// MARK: - UITableViewDataSource
extension ChildrenListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getViewModel().getChildrenNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIndetifier.childrenTableViewIndetifier, for: indexPath) as! ChildrenTableViewCell
        cell.configureCell(child: getViewModel().getChildForRowAt(row: indexPath.row))
        return cell 
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            getViewModel().deleteChildforRowAt(row: indexPath.row)
            addChildButton.isHidden = getViewModel().buttonIsHiden
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension ChildrenListViewController: UITableViewDelegate {
    
}

// MARK: - UITextFieldDelegate
extension ChildrenListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            ageTextField.becomeFirstResponder()
            return true
        } else {
            self.view.endEditing(true)
            return false
        }
    }
}
