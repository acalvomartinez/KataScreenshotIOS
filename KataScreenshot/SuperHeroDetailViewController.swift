//
//  SuperHeroDetailViewController.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import SDWebImage

class SuperHeroDetailViewController: KataSuperHeroesViewController, SuperHeroDetailUI {

    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var errorCaseView: UILabel!

    func show(superHero: SuperHero) {
        userLabel.text = superHero.name
        userLabel.accessibilityLabel = "Name: \(superHero.name)"
        userLabel.isHidden = false
        descriptionLabel.text = superHero.description
        descriptionLabel.accessibilityLabel = "Description: \(superHero.name)"
        descriptionLabel.isHidden = false
        photoImageView.sd_setImage(with: superHero.photo as URL!)
        avengersBadgeImageView.isHidden = !superHero.isAvenger
    }
    
    func show(error: SuperHeroesError) {
        errorCaseView.text = error.message
        errorCaseView.isHidden = false
    }
}
