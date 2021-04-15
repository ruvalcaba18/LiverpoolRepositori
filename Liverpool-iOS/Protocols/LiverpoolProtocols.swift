//
//  LiverpoolProtocols.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import Foundation

//MARK:= View to Presenter
protocol LiverpoolViewToPresenter: class {
    
    var view: LiverpoolPresenterToView?{get set }
    var interactor:LiverpoolPresenterToInteractor?{get set}
    var router:LiverpoolPresenterToRouter?{get set}
    
    func getSearchValues(word:String,Page:String)
    func getSearchValuesMin(word:String,Page:String)
    func getSearchValuesMax(word:String,Page:String)
}

//MARK: Presenter To View
protocol LiverpoolPresenterToView: class {
    func onResponseError(error:String)
    
    func setSearchValues(values:[recordsResposnse])
    func setSearchValuesMin(values:[recordsResposnse])
    func setSearchValuesMax(values:[recordsResposnse])
}

//MARK: Presenter To Router
protocol LiverpoolPresenterToRouter: class {
   
}
//MARK: Presenter To Interactor
protocol LiverpoolPresenterToInteractor: class {
  
    func searchesMetod(Word:String,Page:String)
    func searchesMetodMin(Word:String,Page:String)
    func searchesMetodMax(Word:String,Page:String)
}

//MARK:= Interactor to Presenter
protocol LiverpoolInteractorToPresenter: class {
    
    func setInternetError(error: String)
    
    func setSearchValues(values:[recordsResposnse])
    func setSearchValuesMin(values:[recordsResposnse])
    func setSearchValuesMax(values:[recordsResposnse])
}

