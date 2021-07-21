//
//  ANFExploreCardDetailsVC.swift
//  ANF Code Test
//
//  Created by Chinthakuntla, Sai Supriya on 7/21/21.
//

import Foundation
import UIKit

class ANFExploreCardDetailsVC : UIViewController {
    
    @IBOutlet weak var backgroundImageView : UIImageView!
    @IBOutlet weak var cardTitle : UILabel!
    @IBOutlet weak var topDesccription : UILabel!
    @IBOutlet weak var promoMessage : UILabel!
    @IBOutlet weak var bottomDescription : UILabel!
    @IBOutlet weak var contentOne : UIButton!
    @IBOutlet weak var contentTwo : UIButton!

    var selectedExportcard : ExploreCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        initizlizeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initizlizeUI() {
        
    }
    
}
