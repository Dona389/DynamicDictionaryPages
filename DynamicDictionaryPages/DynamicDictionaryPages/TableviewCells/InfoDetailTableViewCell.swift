//
//  InfoDetailTableViewCell.swift
//  DynamicDictionaryPages
//
//  Created by Dona Thomas on 07/07/20.
//  Copyright © 2020 Dona Thomas. All rights reserved.
//

import UIKit

class InfoDetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let reuseIdentifier = "InfoDisplayCell"
    
    // MARK: - IBOutlet
    @IBOutlet var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
