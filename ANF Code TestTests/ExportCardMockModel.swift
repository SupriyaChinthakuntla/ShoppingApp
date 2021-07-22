//
//  ChannelMockModel.swift
//  ANF Code TestTests
//
//  Created by Chinthakuntla, Sai Supriya on 7/22/21.
//

import Foundation
@testable import ANF_Code_Test

struct ExportCardMockModel {
    
     func exportCardModelData() ->  [ExploreCard] {
        return [ExploreCard(title: "testTitle", backgroundImage: "testImage", promoMessage: "testPromoMessage", topDescription: "testTopDescription", bottomDescription: "testBottomDescription", content: [Content(target: "testTarget", title: "testContentTitle", elementType: "testElementType")]), ExploreCard(title: "testTitle1", backgroundImage: "testImage1", promoMessage: "testPromoMessage1", topDescription: "testTopDescription1", bottomDescription: "testBottomDescription1", content: [Content(target: "testTarget1", title: "testContentTitle1", elementType: "testElementType1")])]
    }
    
    func mockError() -> Error {
        return NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey: "Invaild Details"]) as Error

    }
}
