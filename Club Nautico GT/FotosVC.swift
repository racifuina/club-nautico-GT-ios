//
//  FotosVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 7/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FotosVC: PFQueryTableViewController {

    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Fotos"
        pullToRefreshEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Fotos"
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
        let cellIdentifier = "FotosCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? FotosCell
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.tituloLabel.text = object["titulo"] as! String!
            cell!.infoLabel.text = object["informacion"] as! String!
            cell?.fotoImage.file = object["imagen"] as? PFFile
            cell?.fotoImage.loadInBackground()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
