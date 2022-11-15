//
//  ThirdViewController.swift
//  LogIn1
//
//  Created by Дмитрий Абдуллаев on 15.11.2022.
//

import UIKit

class ThirdViewController: UIViewController {
  
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName

    }
}
