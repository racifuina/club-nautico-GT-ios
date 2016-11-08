//
//  AvisosCell.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class AvisosCell: PFTableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var informacionTextView: UITextView!
    @IBOutlet weak var bgView: UIView!
    

    override func drawRect(rect: CGRect) {
        informacionTextView.layer.cornerRadius = 10
        bgView.layer.cornerRadius = 10
    }
}
