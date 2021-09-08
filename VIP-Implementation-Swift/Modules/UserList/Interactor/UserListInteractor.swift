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
    func selectUser(index: Int)
}

class UserListInteractor: UserListInteractorProtocol {
    
    let presenter: UserListPresenterProtocol
    let repository: UserRepositoryProtocol
    
    private var users: [User] = []
    
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
            
            if let users = users {
                self?.users = users
                self?.presenter.didGetUsers(users)
            }
        }
    }
    
    func selectUser(index: Int) {
        let user = users[index]
        presenter.selectUser(user)
    }
    
}
