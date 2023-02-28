//
//  SortCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 22.02.2023.
//

import UIKit

class SortCell: UITableViewCell {

    static let reuseID = Constants.CellReuseID.sortCell
    
    @IBOutlet weak var sortLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(sortType: SortType){
        sortLabel.text = sortType.sortTypeString
    }
}
