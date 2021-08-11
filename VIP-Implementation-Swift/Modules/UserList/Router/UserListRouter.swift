//
//  UserListRouter.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import UIKit

protocol UserListRouterProtocol {
    static func create() -> UIViewController
}

class UserListRouter: UserListRouterProtocol {
    
    class func create() -> UIViewController {
        let router = UserListRouter()
        let presenter = UserListPresenter()
        let interactor = UserListInteractor(presenter: presenter)
        let view = UserListController(interactor: interactor, router: router)
        presenter.view = view
        return view
    }
    
}
