//
//  ViewController.swift
//  Liverpool
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import UIKit
import Liverpool_iOS

class ViewController: UIViewController {

    let label = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
       
        button.setTitle("Bienvenido al modulo de Liverpool", for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.addTarget(self, action: #selector(goToFramework), for: .touchUpInside)
        
        label.text  = "Presiona el boton para continuar "
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        

        self.view.addSubview(button)
        self.view.addSubview(label)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -80).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.layer.cornerRadius = 10
        
            }
    
    
    
    @IBAction func goToFramework(){
        
        LiverpoolSDK.shared.environment = .Release
        let vc = LiverpoolSDK.openModule(environment: .Release)
        self.navigationController?.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

