//
//  ExploreCard.swift
//  ANF Code Test
//
//  Created by Chinthakuntla, Sai Supriya on 7/21/21.
//

import UIKit

struct ExploreCard: Codable {
    
    var title: String?
    var backgroundImage: String?
    var promoMessage: String?
    var topDescription: String?
    var bottomDescription: String?
    var content : [Content?]?

    init(title: String, backgroundImage: String, promoMessage: String?, topDescription: String?, bottomDescription: String?, content: [Content?]) {
        self.title = title
        self.backgroundImage = backgroundImage
        self.promoMessage = promoMessage
        self.topDescription = topDescription
        self.bottomDescription = bottomDescription
        self.content = content
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title  = try container.decodeIfPresent(String.self, forKey: .title)
        self.backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        self.promoMessage = try container.decodeIfPresent(String.self, forKey: .promoMessage)
        self.topDescription = try container.decodeIfPresent(String.self, forKey: .topDescription)
        self.bottomDescription = try container.decodeIfPresent(String.self, forKey: .bottomDescription)
        self.content = try container.decodeIfPresent([Content?].self, forKey: .content)
    }
    
}

struct Content: Codable {
    
    var target: String?
    var title: String?
    var elementType: String?

    init(target: String, title: String, elementType: String) {
        self.target = target
        self.title = title
        self.elementType = elementType
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title  = try container.decode(String.self, forKey: .title)
        self.target = try container.decode(String.self, forKey: .target)
//        self.elementType = try container.decode(String.self, forKey: .elementType)
    }
}



