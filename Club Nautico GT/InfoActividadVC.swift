//
//  InfoActividadVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 4/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InfoActividadVC: UIViewController {
    
    @IBOutlet weak var mainImage: PFImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    var objetoActividad: PFObject!
    var id : String!
    @IBOutlet weak var intoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.image = UIImage(named: "logotipo300px.jpg")
        self.mainImage.file = objetoActividad["imagen"] as! PFFile!
        self.mainImage.loadInBackground()
        self.tituloLabel.text = objetoActividad["titulo"] as! String!
        self.intoTextView.text = objetoActividad["informacion"] as! String!
        self.intoTextView.layer.cornerRadius = 5
        self.tituloLabel.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }

}
