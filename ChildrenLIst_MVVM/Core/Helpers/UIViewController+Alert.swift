//
//  UIViewController+Alert.swift
//  fff
//
//  Created by Anatoliy Mamchenko on 24.07.2021.
//

import UIKit

extension UIViewController {
    func alertEnterChildrenInfo(completion: @escaping (String?, String?) -> Void) {
        let alert = UIAlertController(title: "Введите данные о ребенке", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            completion(alert.textFields?[0].text, alert.textFields?[1].text)
        }))
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Имя"
        })
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Возраст"
        })
        self.present(alert, animated: true, completion: nil)
    }
}
