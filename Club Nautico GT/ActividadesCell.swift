//
//  ActividadesCell.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ActividadesCell: PFTableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var actividadImage: PFImageView!
    
    
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        actividadImage.clipsToBounds = true
        actividadImage.layer.cornerRadius = actividadImage.bounds.width / 2
    }
    
    

}
