//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Boy from Nowhere on 22/03/2023.
//

import UIKit

class HomeViewController: UIViewController {
    private let  homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.id)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavBar()
        
        let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func configureNavBar(){
//        let btnLogo = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//
//        var imageLogo = UIImage(named: "logo.png")
//        imageLogo = imageLogo?.withRenderingMode(.alwaysOriginal)
//        btnLogo.setImage(imageLogo, for: .normal)
        var image = UIImage(named: "logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        var leftBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        leftBarButton.image = image
        leftBarButton.imageInsets = UIEdgeInsets(top: 0, left: -44, bottom: 0, right: 0)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: btnLogo)
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.id, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
