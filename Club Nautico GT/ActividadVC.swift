//
//  ActividadVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 4/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import PageMenu
import UIKit
import Parse

class ActividadVC: UIViewController {

    var pageMenu : CAPSPageMenu?
    var objetoActividad: PFObject!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        
        let infoActividadVC = InfoActividadVC(nibName: "InfoActividadVC", bundle: nil) as InfoActividadVC
        infoActividadVC.title = "Información"
        infoActividadVC.objetoActividad = self.objetoActividad
        controllerArray.append(infoActividadVC)
        
        
        let resultadosActividadVC = ResultadosActividadVC(nibName: "ResultadosActividadVC", bundle: nil)
        resultadosActividadVC.title = "Resultados"
        resultadosActividadVC.objetoActividad = self.objetoActividad
        controllerArray.append(resultadosActividadVC)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(1),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.7),
            .ViewBackgroundColor(UIColor.lightGrayColor()),
            .ScrollMenuBackgroundColor (UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)),
            .SelectedMenuItemLabelColor (UIColor.blackColor())
        ]
        
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu?.scrollMenuBackgroundColor = UIColor.blueColor()
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 64, self.view.bounds.width, self.view.bounds.height - 113), pageMenuOptions: parameters)
        pageMenu?.scrollMenuBackgroundColor = UIColor.blueColor()
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        
    }

    
    

}
