//
//  ANFExploreCardViewController.swift
//  ANF Code Test
//
//  Created by Chinthakuntla, Sai Supriya on 7/21/21.
//

import UIKit

class ANFExploreCardViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
    var selectedProduct: ExploreCard?
    var activityIndicator: UIActivityIndicatorView!
    var exploreCardList = [ExploreCard]()

    //MVVM pattern
    var _exploreCardTableHandler: ANFExploreCardTableViewHandler!
    
    var exploreCardTableHandler : ANFExploreCardTableViewHandler {
        get {
            if _exploreCardTableHandler != nil {
                return _exploreCardTableHandler
            }
            
            let handler = ANFExploreCardTableViewHandler()
            handler.tableView = self.tableView
            handler.delegate = self
            _exploreCardTableHandler = handler
            return handler
        }
        
    }
    
    var _exploreCardAPIHandler: ANFExploreCardAPIHandler!

    var exploreCardAPIHandler: ANFExploreCardAPIHandler {
        get {
            if _exploreCardAPIHandler != nil {
               return _exploreCardAPIHandler
            }
            let handler = ANFExploreCardAPIHandler()
            _exploreCardAPIHandler = handler
            return handler
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = exploreCardTableHandler
        tableView.dataSource = exploreCardTableHandler
        initializeUI()
        loadExploreCardData()
        self.title = "List of Products"
    }

    func initializeUI() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        self.view.addSubview(activityIndicator)
    }
    
    func showActivityIndicator(show: Bool) {
        DispatchQueue.main.async { [self] in
            if show {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExploreCardDetails" {
            let productDetails = segue.destination as? ANFExploreCardDetailsVC
            productDetails?.selectedExportcard = selectedProduct

            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
    }
}

extension ANFExploreCardViewController: ExploreCardDelegate {
    func selectedExploreCard(exploreCard: ExploreCard) {
        selectedProduct = exploreCard
        self.performSegue(withIdentifier: "toExploreCardDetails", sender: self)
    }
}

extension ANFExploreCardViewController {
     func loadExploreCardData() {
        showActivityIndicator(show: true)
        let url = Constants.baseAPIURL
        exploreCardAPIHandler.getExploreCardDetails(url: url) { [weak self] (result) in
            guard let strongSelf = self else {return}
            strongSelf.showActivityIndicator(show: false)
            DispatchQueue.main.async {
                switch result {
                   case .success(let data):
                    strongSelf.exploreCardTableHandler.exploreCardList = data
                    strongSelf.exploreCardList = data
                    break
                default:
                    break
                   }
                strongSelf.exploreCardTableHandler.tableView.reloadData()

            }
        }
    }
}

extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

