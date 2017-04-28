//
//  SuperHeroesError.swift
//  KataScreenshot
//
//  Created by Antonio Calvo on 28/04/2017.
//  Copyright © 2017 Karumi. All rights reserved.
//

import Foundation

public enum SuperHeroesError: Error {
    
    case networkError
    case itemNotFound
    case unknownError(code: Int)
    
    var message: String {
        switch self {
        case .networkError:
            return "No Internet Connection"
        case .itemNotFound:
            return "Item not found"
        case .unknownError(let code):
            return "Uknown error: \(code)"
        }
    }
}
