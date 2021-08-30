//
//  CryptoCell.swift
//  CryptoWallet
//
//  Created by Arda Sentürk on 30.08.21.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    @IBOutlet var cryptoName: UILabel!
    @IBOutlet var cryptoPrice: UILabel!
    @IBOutlet var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
