//
//  LiverpoolSDK.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import UIKit.UIViewController

public class LiverpoolSDK{
    
    public static let bundle = Bundle(for: LiverpoolSDK.self)
    public var environment: LiverpoolEnvironment = .Release
    public static let shared = LiverpoolSDK()
    
    
    public static func openModule(environment: LiverpoolEnvironment) -> UIViewController {
        LiverpoolSDK.shared.environment = environment
           
           var view:UIViewController?
        
        view = LiverpoolRouter.createModule()
           return view!
       }
    
}
