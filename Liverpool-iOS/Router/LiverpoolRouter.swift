//
//  LiverpoolRouter.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//
//

import Foundation
import UIKit

public class LiverpoolRouter: LiverpoolPresenterToRouter{
    
    var view: UIViewController?
    
 

    public static func createModule() -> UIViewController{
        
        let view = LiverpoolViewController(nibName: "LiverpoolViewController", bundle: Bundle(for: LiverpoolRouter.self))
        let presenter = LiverpoolPresenter()
        let interactor = LiverpoolInteractor()
        let router = LiverpoolRouter()
        router.view = view


        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.base_url = LiverpoolSDK.shared.environment.getBaseURL()
    
        return view
    }
}

