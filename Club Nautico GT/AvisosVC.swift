
//  AvisosVC.swift
//  Club Nautico GT
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.


import UIKit
import Parse
import ParseUI

class AvisosVC: PFQueryTableViewController {

    @IBOutlet weak var cerrarSesiónButton: UIBarButtonItem!
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Avisos"
        pullToRefreshEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Avisos"
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
        let cellIdentifier = "AvisosCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AvisosCell
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.tituloLabel.text = object["titulo"] as? String
            cell!.informacionTextView.text = object["informacion"] as? String
           
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let destinationVC = segue.destinationViewController as! VistaActividadVC
//        
//        let cell = sender as! ActividadesCell
//        destinationVC.navigationItem.title = cell.tituloLabel.text
//    }
//    @IBAction func cerrarSesionButtonPressed(sender: AnyObject) {
//        PFUser.logOut()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! Inicio
//        self.presentViewController(vc, animated: true, completion: nil)
//    }
    
    
}
