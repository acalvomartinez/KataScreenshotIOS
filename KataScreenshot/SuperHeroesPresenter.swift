//
//  SuperHeroesPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class SuperHeroesPresenter: BothamPresenter, BothamNavigationPresenter {

    fileprivate weak var ui: SuperHeroesUI?
    fileprivate let getSuperHeroes: GetSuperHeroes

    init(ui: SuperHeroesUI, getSuperHeroes: GetSuperHeroes) {
        self.ui = ui
        self.getSuperHeroes = getSuperHeroes
    }

    func viewDidLoad() {
        ui?.showLoader()
        getSuperHeroes.execute { result in
            self.ui?.hideLoader()
            
            if let error = result.error {
                self.ui?.show(error: error)
                return
            }
            
            guard let superHeroes = result.value else {
                self.ui?.show(error: .itemNotFound)
                return
            }
            
            self.ui?.show(items: superHeroes)
        }
    }

    func itemWasTapped(_ item: SuperHero) {
        let superHeroDetailViewController = ServiceLocator().provideSuperHeroDetailViewController(item.name)
        ui?.openSuperHeroDetailScreen(superHeroDetailViewController)
    }
}

protocol SuperHeroesUI: BothamUI, BothamLoadingUI {

    func showEmptyCase()
    func show(items: [SuperHero])
    func show(error: SuperHeroesError)
    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController)

}
