//
//  ResultadosActividadVC.swift
//  Club Nautico GT
//
//  Created by Rigoberto Acifuina on 4/02/16.
//  Copyright © 2016 PanatlanticDev. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ResultadosActividadVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var sinResultadosLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var objetoActividad: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        sinResultadosLabel.hidden = true
        activityIndicator.layer.cornerRadius = 10
        
        if let PDFFILE = objetoActividad["Resultados"] as? PFFile {
            let url: NSURL! = NSURL(string: PDFFILE.url!)
            webView.loadRequest(NSURLRequest(URL: url))
            webView.scalesPageToFit = true
            sinResultadosLabel.hidden = true
        } else {
            sinResultadosLabel.hidden = false
            webView.hidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        activityIndicator.stopAnimating()
    }
}
