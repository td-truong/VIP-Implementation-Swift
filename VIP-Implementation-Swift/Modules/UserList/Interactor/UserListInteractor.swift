//
//  UserListInteractor.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation

protocol UserListInteractorProtocol {
    var presenter: UserListPresenterProtocol { get }
    var repository: UserRepositoryProtocol { get }
    
    func viewDidLoad()
    func getUsers()
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
        getUsers()
    }
    
    func getUsers() {
        repository.getUsers { [weak self] users, error in
            if let error = error {
                self?.presenter.didGetError(error)
                return
            }
            
            self?.presenter.didGetUsers(users ?? [])
        }
    }
    
}
