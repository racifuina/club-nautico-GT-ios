//
//  Actividad.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 10/12/15.
//  Copyright © 2015 PanatlanticDev. All rights reserved.
//

import Foundation
import UIKit

class Actividad {
    private var _tituloActividad: String!
    private var _infoActividad: String!
    private var _imagenActivdad: UIImage!
    
    var tituloActividad: String {
        return _tituloActividad
    }
    
    var infoActividad: String {
        return _infoActividad
    }
    
    var imagenActividad: UIImage {
        return _imagenActivdad  
    }
    
    init (){
    }
    
    init (titulo: String, informacion: String, imagen: UIImage) {
        _tituloActividad = titulo
        _infoActividad = informacion
        _imagenActivdad = imagen
    }
    
}