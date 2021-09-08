//
//  UserDetailsRouter.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 08/09/2021.
//

import UIKit

protocol UserDetailsRouterProtocol {
    static func create(with user: User) -> UIViewController
}

class UserDetailsRouter: UserDetailsRouterProtocol {
    
    class func create(with user: User) -> UIViewController {
        let router = UserDetailsRouter()
        let presenter = UserDetailsPresenter()
        let interactor = UserDetailsInteractor(presenter: presenter, user: user)
        let view = UserDetailsController(interactor: interactor, router: router)
        presenter.view = view
        return view
    }
    
}
