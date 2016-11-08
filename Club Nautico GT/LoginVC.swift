//
//  ViewController.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 2/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse
import Firebase


class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nombrePadreLabel: UITextField!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var atrasNavButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
    
    
    
    @IBAction func entrarButtonPressed(sender: AnyObject) {
        registrarUsuarios()
    }
    
    func registrarUsuarios() {
        DataService.ds.REF_BASE.createUser(emailTextField.text, password: passwordTextField.text, withCompletionBlock:  { error in
            if error != nil {
                // There was an error creating the account
            } else {
              print("user Created!!!")
            }
            
            
            })
    
    
    }

    @IBAction func atrasButtonPressed(sender: AnyObject) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("IniciaSesion") as! ExistenteVC
        self.presentViewController(vc, animated: true, completion: nil)

    
    }
   

    
}
