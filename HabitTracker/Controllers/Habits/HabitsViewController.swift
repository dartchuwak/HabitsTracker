//
//  HabitsViewController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 09.12.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    let cellId = "id"
    let progressCellId = "CellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        let add = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(open))
        self.navigationItem.setRightBarButton(add, animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "indigo")
        self.tabBarController?.tabBar.tintColor = UIColor(named: "indigo")
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: progressCellId)
        addViews()
        layoutViews()
    }
    
    
    private func addViews() {
        view.addSubview(collectionView)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    @objc private func open() {
        let  nav = UINavigationController(rootViewController: HabitViewController())
        present(nav, animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("apeared!")
    }
}


extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 30, height: 130)
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HabitCollectionViewCell
        cell.taskTitleLabel.text = "Test text data"
        return cell
    }
}
