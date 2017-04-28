//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroWithNoBadge() {
        let superHero = givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }

    func testShowsSuperHeroWithBadge() {
        let superHero = givenASuperHero(isAvenger: true)

        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroWithLongName() {
        let superHero = givenASuperHero(name: "Very very long name", isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroWithEmptyName() {
        let superHero = givenASuperHero(name: "", isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }

    func testShowsSuperHeroWithLongDescription() {
        let superHero = givenASuperHero(description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroWithEmptyDescription() {
        let superHero = givenASuperHero(description: "", isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }

    // MARK: Helpers

    fileprivate func givenASuperHero(name: String = "Mr. Clean",
                                     description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                     photo: String = "",
                                     isAvenger: Bool) -> SuperHero {
        let superHero = SuperHero(
            name: name,
            photo: URL(string: photo),
            isAvenger: isAvenger,
            description: description
        )
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]

        return rootViewController
    }
}
