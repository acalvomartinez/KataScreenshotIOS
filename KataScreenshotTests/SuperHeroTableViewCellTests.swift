//
//  SuperHeroTableViewCellTests.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 09/01/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import UIKit
import XCTest
@testable import KataScreenshot

class SuperHeroTableViewCellTests: ScreenshotTest {
    
    func testShowsARegularSuperHero() {
        let cell = givenASuperHeroTableViewCell()
        cell.configure(forItem: SuperHeroMother.givenASuperHero())
        
        verify(view: cell)
    }
    
    func testShowsSuperHeroWithALongName() {
        let cell = givenASuperHeroTableViewCell()
        cell.configure(forItem: SuperHeroMother.givenASuperHeroWithALongName())
        
        verify(view: cell)
    }
    
    // MARK: - Helpers

    private func givenASuperHeroTableViewCell() -> SuperHeroTableViewCell {
        return UINib(nibName: "SuperHeroTableViewCell", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as! SuperHeroTableViewCell
    }
}
