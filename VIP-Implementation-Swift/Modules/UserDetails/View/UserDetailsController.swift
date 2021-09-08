//
//  UserDetailsController.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 08/09/2021.
//

import UIKit

protocol UserDetailsViewProtocol: AnyObject {
    var interactor: UserDetailsInteractorProtocol { get }
    var router: UserDetailsRouterProtocol { get }
    
    func updateDetailsLabel(text: String?)
}

class UserDetailsController: UIViewController, UserDetailsViewProtocol {
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        return label
    }()
    
    let interactor: UserDetailsInteractorProtocol
    let router: UserDetailsRouterProtocol
    
    init(interactor: UserDetailsInteractorProtocol, router: UserDetailsRouterProtocol) {
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
        view.addSubview(detailsLabel)
        detailsLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(32)
        }
    }
    
    func updateDetailsLabel(text: String?) {
        detailsLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

