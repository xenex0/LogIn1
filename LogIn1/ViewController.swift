//
//  ViewController.swift
//  LogIn1
//
//  Created by Дмитрий Абдуллаев on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let secondVC = tabBarController.viewControllers?.first as! SecondViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let thirdVC = navigationVC.topViewController as! ThirdViewController
        secondVC.user = user
        thirdVC.user = user
    }
    
    @IBAction func loginPressed() {
        guard
            textFieldUser.text == user.login,
            textFieldPassword.text == user.password
        else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login or password",textField: textFieldPassword)
            return
        }
        performSegue(withIdentifier: "LogIn", sender: nil)
    }
    
    @IBAction func eyeButton(_ sender: UIButton) {
        if textFieldPassword.isSecureTextEntry == false {
            textFieldPassword.isSecureTextEntry = true
        } else {
            textFieldPassword.isSecureTextEntry = false
        }
    }
    @IBAction func forgotUserName() {
        showAlert(title: "Ooops!", message: "Your name is \(user.login) 😉")
    }
    @IBAction func forgotPassword() {
        showAlert(title: "Ooops!", message: "Your password is \(user.password) 😉")
    }
}

extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


