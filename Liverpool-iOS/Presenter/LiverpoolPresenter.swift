//
//  LiverpoolPresenter.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import Foundation

class LiverpoolPresenter: LiverpoolViewToPresenter {
  
    
    var view: LiverpoolPresenterToView?
    
    var interactor: LiverpoolPresenterToInteractor?
    
    var router: LiverpoolPresenterToRouter?
    
    func getSearchValues(word: String, Page: String) {
        interactor?.searchesMetod(Word: word, Page: Page)
    }
    
    func getSearchValuesMin(word: String, Page: String) {
        interactor?.searchesMetodMin(Word: word, Page: Page)
    }
    
    func getSearchValuesMax(word: String, Page: String) {
        interactor?.searchesMetodMax(Word: word, Page: Page)
    }
    
}
extension LiverpoolPresenter: LiverpoolInteractorToPresenter{
    func setSearchValuesMin(values: [recordsResposnse]) {
        view?.setSearchValuesMin(values: values)
    }
    
    func setSearchValuesMax(values: [recordsResposnse]) {
        view?.setSearchValuesMax(values: values)
    }
    
    func setSearchValues(values: [recordsResposnse]) {
        view?.setSearchValues(values: values)
    }
    
    
    func setInternetError(error: String) {
        view?.onResponseError(error: error)
    }
    
    
}
    
