//
//  UserListPresenter.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation

protocol UserListPresenterProtocol {
    var view: UserListViewProtocol? { get set }
    
    func viewDidLoad()
    func didGetUsers(_ users: [User])
    func didGetError(_ error: Error)
    func selectUser(_ user: User)
}

class UserListPresenter: UserListPresenterProtocol {
    
    weak var view: UserListViewProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
    }
    
    func didGetUsers(_ users: [User]) {
        view?.hideLoading()
        view?.cellViewModels = users.map {
            UserCellViewModel(nameText: $0.name, emailText: "✉️ \($0.email ?? "")")
        }
        view?.refresh()
    }
    
    func didGetError(_ error: Error) {
        view?.hideLoading()
        view?.showError(title: error.localizedDescription)
    }
    
    func selectUser(_ user: User) {
        view?.showDetails(user: user)
    }
    
}
