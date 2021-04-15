//
//  ViewControllerExtension.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import Foundation
import UIKit
extension UIViewController{
    
    
    func startActivityIndicator(loader:UIActivityIndicatorView,vista:UIView){
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        self.view.addSubview(vista)
        vista.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        vista.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        vista.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        vista.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        vista.backgroundColor = .black
        vista.alpha = 0.5
        vista.center = CGPoint(x: self.view.bounds.size.width/2 , y: self.view.bounds.size.height/2 - 50)
        loader.color = .systemYellow
        loader.style = .whiteLarge
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        loader.transform = transform
        loader.startAnimating()
        self.view.addSubview(loader)
        self.view.bringSubviewToFront(loader)
        loader.center = CGPoint(x: self.view.bounds.size.width/2 , y: self.view.bounds.size.height/2 )
        
    }
    
    func stopActivityIndicator(loader:UIActivityIndicatorView,vista:UIView){
     
        loader.stopAnimating()
        self.view.backgroundColor = .white
        self.view.alpha = 1
        
        DispatchQueue.main.async {
            loader.removeFromSuperview()
            vista.removeFromSuperview()
            
        }
        
    }
}
