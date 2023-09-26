//
//  RealatedTopicsTableViewCell.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/24/23.
//

import UIKit




class RelatedTopicsTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "RelatedTopicsTableViewCell"

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Public Methods
    func configure(with relatedTopic: RelatedTopic) {
        titleLabel.text = relatedTopic.text
        // Configure other UI elements with relevant data from the RelatedTopic struct
    }
}
