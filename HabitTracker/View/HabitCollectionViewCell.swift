//
//  HabitCell.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 11.12.2022.
//

import UIKit




class HabitCollectionViewCell: UICollectionViewCell {
    
    let taskTitleLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test data"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = .lightGray
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        addSubview(taskTitleLabel)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            taskTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            taskTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            taskTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}
