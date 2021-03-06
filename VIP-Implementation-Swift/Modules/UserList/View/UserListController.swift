//
//  UserListController.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 11/08/2021.
//

import UIKit

protocol UserListViewProtocol: AnyObject {
    var interactor: UserListInteractorProtocol { get }
    var router: UserListRouterProtocol { get }
    var cellViewModels: [UserCellViewModel] { get set }
    
    func showLoading()
    func hideLoading()
    func refresh()
    func showError(title: String)
    func showDetails(user: User)
}

class UserListController: UIViewController, UserListViewProtocol {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(dataSource: self, delegate: self)
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseId)
        return tableView
    }()
    
    let interactor: UserListInteractorProtocol
    let router: UserListRouterProtocol
    
    var cellViewModels: [UserCellViewModel] = []
    
    init(interactor: UserListInteractorProtocol, router: UserListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor.viewDidLoad()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func refresh() {
        tableView.reloadData()
    }
    
    func showError(title: String) {
        // Show error
    }
    
    func showLoading() {
        // Show loading
    }
    
    func hideLoading() {
        // Hide loading
    }
    
    func showDetails(user: User) {
        router.showDetails(user: user, from: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UserListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseId, for: indexPath) as! UserCell
        let viewModel = cellViewModels[indexPath.row]
        cell.update(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.selectUser(index: indexPath.row)
    }
}
