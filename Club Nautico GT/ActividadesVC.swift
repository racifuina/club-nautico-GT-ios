//
//  ActividadesVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ActividadesVC: PFQueryTableViewController {
    
    
    override func viewDidAppear(animated: Bool) {
//        let currentUser = PFUser.currentUser()
//        if currentUser != nil {
//            // Do stuff with the user
//        } else {
//            // Show the signup or login screen
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewControllerWithIdentifier("NuevoUsuario") as! LoginVC
//            self.presentViewController(vc, animated: true, completion: nil)
//        }
    }
    
    var objetos = [PFObject]()
    var id: String!
    
    override func viewDidLoad() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("AdsVC") as! AdsVC
//        self.presentViewController(vc, animated: true, completion: nil)
        super.viewDidLoad()
    }
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Actividades"
        pullToRefreshEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Actividades"
        pullToRefreshEnabled = true
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        // If no objects are loaded in memory, we look to the cache first to fill the table
        // and then subsequently do a query against the network.
        if self.objects!.count == 0 {
            query.cachePolicy = .CacheThenNetwork
        }
        query.orderByDescending("createdAt")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "ActividadesCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ActividadesCell
        if let object = object {
            cell?.actividadImage.image = UIImage(named: "Bandera.png")
            cell!.tituloLabel.text = object["titulo"] as? String
            cell!.subtituloLabel.text = object["informacion"] as? String
            cell?.actividadImage.file = object["imagen"] as? PFFile
            cell?.actividadImage.loadInBackground()
            objetos.append(object)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("goToVistaActividadesVC", sender: objetos[indexPath.row])
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToVistaActividadesVC" {
            if let destinationVC = segue.destinationViewController as? ActividadVC {
                if let cell = sender as? PFObject {
                    destinationVC.objetoActividad = cell
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
    }

}
