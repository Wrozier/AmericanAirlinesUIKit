//
//  SearchError.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/24/23.
//

import Foundation


enum SearchError: Error {
    case noData
    case invalidUrl
    case noResultsFound
    case networkError
    case otherError(String) 
}
