//
//  FotosCell.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class FotosCell: PFTableViewCell {

    @IBOutlet weak var fotoImage: PFImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var infoLabel: UITextView!
    
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        fotoImage.layer.cornerRadius = 5
        fotoImage.clipsToBounds = true
    }
    

}
