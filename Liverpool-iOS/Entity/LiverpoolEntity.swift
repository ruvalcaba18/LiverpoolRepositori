//
//  LiverpoolEntity.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import Foundation

struct LiverpoolEntities:Codable{
    var status:statusStuff?
    var pageType:String?
    var plpResults:plpR?
}

struct plpR:Codable{
    var label:String?
    var plpState:plpStateResponse?
    var sortOptions:[sortOptionsResponse]?
    var refinementGroups:[refinementGroupsResponse]?
    var records:[recordsResposnse]?
    var navigation:navigationResponse?
}
struct navigationResponse:Codable{
    var ancester:[sortOptionsResponse]?
    var current:[sortOptionsResponse]?
    var child:[sortOptionsResponse]?
}
struct recordsResposnse:Codable{
    var productId:String?
    var skuRepositoryId:String?
    var productDisplayName:String?
    var productType:String?
    var productRatingCount:Int?
    var productAvgRating:Double?
    var listPrice:Int?
    var minimumListPrice:Double?
    var maximumListPrice:Double?
    var promoPrice:Double?
    var minimumPromoPrice:Double?
    var maximumPromoPrice:Double?
    var isHybrid:Bool?
    var marketplaceSLMessage:String?
    var marketplaceBTMessage:String?
    var isMarketPlace:Bool?
    var isImportationProduct:Bool?
    var brand:String?
    var seller:String?
    var category:String?
    var smImage:String?
    var lgImage:String?
    var xlImage:String?
    var groupType:String?
    var plpFlags:[variantsColorResponse]?
    var variantsColor:[variantsColorResponse]?
}
struct variantsColorResponse:Codable{
    var colorName:String?
    var colorHex:String?
    var colorImageURL:String?
}
struct refinementGroupsResponse:Codable{
    var name:String?
    var refinement:[refinementResponse]?
    var multiSelect:Bool?
    var dimensionName:String?
}
struct refinementResponse:Codable{
    var count:Int?
    var label:String?
    var refinementId:String?
    var categoryId:String?
    var selected:Bool?
}
struct sortOptionsResponse:Codable{
    var sortBy:String?
    var label:String?
    var categoryId:String?
}
struct plpStateResponse:Codable{
    var categoryId:String?
    var currentSortOption:String?
    var currentFilters: String?
    var firstRecNum:Int?
    var lastRecNum: Int?
    var recsPerPage:Int?
    var totalNumRecs:Int?
    var originalSearchTerm:String?
}
struct statusStuff:Codable{
    var status:String?
    var statusCode:Int?
}
