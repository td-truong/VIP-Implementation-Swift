//
//  UserListInteractor.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation

protocol UserListInteractorProtocol {
    var presenter: UserListPresenterProtocol { get }
    
    func viewDidLoad()
}

class UserListInteractor: UserListInteractorProtocol {
    
    let presenter: UserListPresenterProtocol
    
    init(presenter: UserListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func viewDidLoad() {
        presenter.viewDidLoad()
    }
    
}
