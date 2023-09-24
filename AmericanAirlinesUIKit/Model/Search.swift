//
//  Search.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import Foundation

struct SearchResult: Decodable {
    let abstract: String
    let abstractSource: String
    let abstractText: String
    let abstractURL: String
    let answer: String
    let answerType: String
    let definition: String
    let definitionSource: String
    let definitionURL: String
    let entity: String
    let heading: String
    let image: String
    let imageHeight: Int
    let imageIsLogo: Int
    let imageWidth: Int
    let officialDomain: String
    let officialWebsite: String
    let redirect: String
    let relatedTopics: [RelatedTopic]
    let results: [String]
    let type: String


   
    struct InfoboxItem: Decodable {
        let key: String
        let value: String
    }
    struct RelatedTopic: Decodable {
        let text: String
        let firstURL: String
       
    }


    enum CodingKeys: String, CodingKey {
        case abstract = "Abstract"
        case abstractSource = "AbstractSource"
        case abstractText = "AbstractText"
        case abstractURL = "AbstractURL"
        case answer = "Answer"
        case answerType = "AnswerType"
        case definition = "Definition"
        case definitionSource = "DefinitionSource"
        case definitionURL = "DefinitionURL"
        case entity = "Entity"
        case heading = "Heading"
        case image = "Image"
        case imageHeight = "ImageHeight"
        case imageIsLogo = "ImageIsLogo"
        case imageWidth = "ImageWidth"
        case officialDomain = "OfficialDomain"
        case officialWebsite = "OfficialWebsite"
        case redirect = "Redirect"
        case relatedTopics = "RelatedTopics"
        case results = "Results"
        case type = "Type"
    }
}
