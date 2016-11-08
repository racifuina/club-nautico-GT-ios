//
//  MiembrosVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 28/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MiembrosVC: UITableViewController {

    @IBOutlet weak var codigoLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let usuario = PFUser.currentUser()
        
        if let codigo = usuario!["correlativo"] as? String {
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject("c\(codigo)", forKey: "channels")
            currentInstallation.saveInBackground()
            codigoLabel.text = codigo
        } else {
            codigoLabel.text = "No Especificado"
        }
        
        if let nombre = usuario!["nombreCompleto"] as? String {
            nombreLabel.text = nombre
        } else {
            nombreLabel.text = "No Especificado"
        }

    }
    
    @IBAction func cerrarSesionButtonPressed(sender: AnyObject) {
        PFUser.logOut()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! Inicio
//        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    
    
    
}
