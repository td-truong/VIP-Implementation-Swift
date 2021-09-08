//
//  UserDetailsPresenter.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 08/09/2021.
//

import Foundation

protocol UserDetailsPresenterProtocol {
    var view: UserDetailsViewProtocol? { get set }
    
    func updateView(user: User)
}

class UserDetailsPresenter: UserDetailsPresenterProtocol {
    
    weak var view: UserDetailsViewProtocol?
    
    func updateView(user: User) {
        let info = "\(user.name ?? "") - \(user.email ?? "")"
        view?.updateDetailsLabel(text: info)
    }
    
}
