//
//  CircleCollectionViewCell.swift
//  Devour project 405
//
//  Created by Dowon on 2/24/21.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CircleCollectionViewCell"
    
    private let  foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 70.0/2.0
        imageView.backgroundColor = .blue
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.link.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(foodImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImageView.frame = contentView.bounds
    }
    
    public func configure(with name: String) {
        foodImageView.image = UIImage(named: name)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        foodImageView.image = nil
    }
    
}
