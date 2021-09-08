//
//  UserDetailsInteractor.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 08/09/2021.
//

import Foundation

protocol UserDetailsInteractorProtocol {
    var presenter: UserDetailsPresenterProtocol { get }    
    var user: User { get }
    
    func viewDidLoad()
}

class UserDetailsInteractor: UserDetailsInteractorProtocol {
    
    let presenter: UserDetailsPresenterProtocol
    
    let user: User
    
    init(presenter: UserDetailsPresenterProtocol, user: User) {
        self.presenter = presenter
        self.user = user
    }
    
    func viewDidLoad() {
        presenter.updateView(user: user)
    }
    
}
