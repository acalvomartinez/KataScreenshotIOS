//
//  MockSuperHeroesRepository.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 13/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result
@testable import KataScreenshot

class MockSuperHeroesRepository: SuperHeroesRepository {

    var superHeroes = [SuperHero]()
    var error: SuperHeroesError?

    override func getAll(_ completion: @escaping (Result<[SuperHero], SuperHeroesError>) -> ()) {
        if let error = error {
            completion(Result(error: error))
            return
        }
        
        completion(Result(value: superHeroes))
    }

    override func getSuperHero(withName name: String, completion: @escaping (Result<SuperHero, SuperHeroesError>) -> ()) {
        if let error = error {
            completion(Result(error: error))
            return
        }
        
        let superHeroByName = superHeroes.filter { $0.name == name }.first
        completion(Result(value: superHeroByName!))
    }

}
