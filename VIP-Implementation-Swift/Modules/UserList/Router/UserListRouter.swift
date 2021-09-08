//
//  UserListRouter.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 11/08/2021.
//

import UIKit

protocol UserListRouterProtocol {
    func showDetails(user: User, from vc: UIViewController)
}

class UserListRouter: UserListRouterProtocol {
    
    class func create() -> UIViewController {
        let router = UserListRouter()
        let presenter = UserListPresenter()
        let repository = UserRepository()
        let interactor = UserListInteractor(presenter: presenter, repository: repository)
        let view = UserListController(interactor: interactor, router: router)
        presenter.view = view
        return view
    }
    
    func showDetails(user: User, from vc: UIViewController) {
        let userDetailsVC = UserDetailsRouter.create(with: user)
        vc.navigationController?.pushViewController(userDetailsVC, animated: true)
    }
    
}
