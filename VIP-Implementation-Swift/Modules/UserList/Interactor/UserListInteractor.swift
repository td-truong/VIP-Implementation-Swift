//
//  UserListInteractor.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation

protocol UserListInteractorProtocol {
    var presenter: UserListPresenterProtocol { get }
    var repository: UserRepositoryProtocol { get }
    
    func viewDidLoad()
}

class UserListInteractor: UserListInteractorProtocol {
    
    let presenter: UserListPresenterProtocol
    let repository: UserRepositoryProtocol
    
    init(presenter: UserListPresenterProtocol, repository: UserRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func viewDidLoad() {
        presenter.viewDidLoad()
        repository.getUsers { result in
            
        }
    }
    
}
