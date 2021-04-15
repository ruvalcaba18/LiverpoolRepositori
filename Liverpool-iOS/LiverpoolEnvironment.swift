//
//  LiverpoolEnvironment.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.

import Foundation

public enum LiverpoolEnvironment{
    case Development
    case Qa
    case Release
    
    func getBaseURL() -> String {
        switch self {
        case .Development: return "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string="
        case .Qa: return "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string="
        case .Release: return "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string="
        }
    }
}

enum EndpointCase {
    
    case searches(environment:String,word: String,pages:String)
    case minPrice(environment:String,word: String,pages:String)
    case maxPrice(environment:String,word: String,pages:String)
    var url:String{
        switch self{
        case .searches(environment: let environment, word: let word, pages: let pages):
            return "\(environment)\(word)&page-number=\(pages)"
        case  .minPrice(environment: let environment, word: let word, pages: let pages):
            return "\(environment)\(word)&page-number=\(pages)&minSortPrice|0"
        case .maxPrice(environment: let environment, word: let word, pages: let pages):
            return "\(environment)\(word)&page-number=\(pages)&minSortPrice|1"
        }
    }
    
}


