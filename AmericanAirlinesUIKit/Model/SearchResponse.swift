//
//  SearchResponse.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/25/23.
//

import Foundation
import UIKit

// MARK: - Search
struct SearchResult: Decodable {
    let abstractText: String
    let abstractURL: String
    let answer, answerType, definition, definitionSource: String
    let definitionURL, entity, heading, image: String
    let imageHeight, imageIsLogo, imageWidth: Int
  //  let infobox: Infobox
    let officialDomain: String
    let officialWebsite: String
    let redirect: String
   // let relatedTopics: [RelatedTopic]
    let results: [URLResult]
    let type: String
    //let meta: WelcomeMeta

    enum CodingKeys: String, CodingKey {
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
        //case infobox = "Infobox"
        case officialDomain = "OfficialDomain"
        case officialWebsite = "OfficialWebsite"
        case redirect = "Redirect"
        //case relatedTopics = "RelatedTopics"
        case results = "Results"
        case type = "Type"
       // case meta
    }
}

// MARK: - RelatedTopic
struct RelatedTopic: Codable {
    let firstURL: String
    let icon: RelatedTopicIcon
    let result, text: String

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
 }

// MARK: - RelatedTopicIcon

struct RelatedTopicIcon: Codable {
    let height, url, width: String

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: - Result
struct URLResult: Codable {
    let firstURL: String
    let icon: ResultIcon
    let result, text: String

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: - ResultIcon
struct ResultIcon: Codable {
    let height: Int
    let url: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}
