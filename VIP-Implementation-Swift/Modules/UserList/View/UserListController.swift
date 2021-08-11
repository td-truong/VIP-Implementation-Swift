//
//  UserListController.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import UIKit

protocol UserListViewProtocol: AnyObject {
    var interactor: UserListInteractorProtocol! { get }
    var router: UserListRouterProtocol! { get }
}

class UserListController: UIViewController, UserListViewProtocol {
    
    let interactor: UserListInteractorProtocol!
    let router: UserListRouterProtocol!
    
    init(interactor: UserListInteractorProtocol, router: UserListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

