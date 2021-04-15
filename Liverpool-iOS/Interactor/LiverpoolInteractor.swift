//
//  LiverpoolInteractor.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import Foundation
import UIKit
import Network

class LiverpoolInteractor: LiverpoolPresenterToInteractor {
  
    var presenter: LiverpoolInteractorToPresenter?
    var base_url = ""
    var urlSession: URLSessionDataTask?
    func searchesMetod(Word: String, Page: String) {
        guard let url = URL(string: EndpointCase.searches(environment: base_url, word: Word, pages: Page).url) else{return}
        
        urlSession?.cancel()
        
          urlSession = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                    print("Error with fetching films: \(error)")
                    return
                  }
            
            if let data = data{
                do{
                    let datos  = try! JSONDecoder().decode(LiverpoolEntities.self, from: data)
                    self.presenter?.setSearchValues(values: datos.plpResults?.records ?? [] )
            }catch let error{
                self.presenter?.setInternetError(error: error.localizedDescription)
            }
            }
        
          }
        urlSession?.resume()
        
    }
    
    func searchesMetodMin(Word: String, Page: String) {
        
        urlSession?.cancel()
        let stringURL = EndpointCase.minPrice(environment: base_url, word: Word, pages: Page).url
        
        guard let url = URL(string:stringURL)else{return}

        urlSession = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let error = error {
                    print("Error with fetching films: \(error)")
                    return
                  }
            
            if let data = data{
                do{
                    let datos  = try! JSONDecoder().decode(LiverpoolEntities.self, from: data)
                    self?.presenter?.setSearchValues(values: datos.plpResults?.records ?? [] )
            }catch let error{
                self?.presenter?.setInternetError(error: error.localizedDescription)
            }
            }
        }
            urlSession?.resume()
        
        
    }
    
    func searchesMetodMax(Word: String, Page: String) {
        guard let url = URL(string: EndpointCase.maxPrice(environment: base_url, word: Word, pages: Page).url) else{return}
        urlSession?.cancel()
        urlSession =  URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                    print("Error with fetching films: \(error)")
                    return
                  }
            
            if let data = data{
                do{
                    let datos  = try! JSONDecoder().decode(LiverpoolEntities.self, from: data)
                    self.presenter?.setSearchValues(values: datos.plpResults?.records ?? [] )
            }catch let error{
                self.presenter?.setInternetError(error: error.localizedDescription)
            }
            }
        }
        urlSession?.resume()
    }

        
}
