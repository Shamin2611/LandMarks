//
//  LandMarkTableViewCell.swift
//  LandMarks
//
//  Created by Mostafa Shamin on 21/6/24.
//
import UIKit

class LandMarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(with landmark: Landmark) {
        iconImageView.image = UIImage(named: landmark.imageName)
        titleLabel.text = landmark.name
        subtitleLabel.text = landmark.subtitle
    }
}
