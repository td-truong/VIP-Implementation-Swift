//
//  UserListPresenter.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation

protocol UserListPresenterProtocol {
    var view: UserListViewProtocol? { get set }
    
    func viewDidLoad()
    func didGetUsers(_ users: [User])
    func didGetError(_ error: Error)
}

class UserListPresenter: UserListPresenterProtocol {
    
    weak var view: UserListViewProtocol?
    
    func viewDidLoad() {
        
    }
    
    func didGetUsers(_ users: [User]) {
        
    }
    
    func didGetError(_ error: Error) {
        
    }
    
}
