//
//  NoticiasCell.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 6/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class NoticiasCell: PFTableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var contenidoText: UILabel!
    @IBOutlet weak var actividadImage: PFImageView!

    
    
    override func drawRect(rect: CGRect) {
        actividadImage.clipsToBounds = true
        actividadImage.layer.cornerRadius = 5
    }

}
