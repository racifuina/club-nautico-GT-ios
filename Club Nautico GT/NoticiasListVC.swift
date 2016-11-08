//
//  NoticiasListVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 6/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class NoticiasListVC: PFQueryTableViewController {

    var objetos = [PFObject]()
    var id: String!
    
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Noticias"
        pullToRefreshEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Noticias"
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
        let cellIdentifier = "NoticiaCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? NoticiasCell
        if let object = object {
            cell?.actividadImage.image = UIImage(named: "Bandera.png")
            cell!.tituloLabel.text = object["titulo"] as? String
            cell!.contenidoText.text = object["contenido"] as? String
            cell!.autorLabel.text = object["autor"] as? String
            cell?.actividadImage.file = object["imagen"] as? PFFile
            cell?.actividadImage.loadInBackground()
            objetos.append(object)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("goToNoticiaView", sender: objetos[indexPath.row])
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToNoticiaView" {
            if let destinationVC = segue.destinationViewController as? NoticiaVC {
                if let cell = sender as? PFObject {
                    destinationVC.objetoActividad = cell
                }
            }
        }
    }
    
    
    
}
