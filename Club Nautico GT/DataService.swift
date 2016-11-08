//
//  DataService.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 6/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://club-nautico-gt.firebaseio.com")
//    private var _REF_POST = Firebase(url: "https://club-nautico-gt.firebaseapp.com/users")
    
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}


