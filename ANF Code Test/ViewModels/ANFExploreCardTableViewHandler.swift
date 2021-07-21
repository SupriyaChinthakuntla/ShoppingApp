//
//  ANFExploreCardTableViewHandler.swift
//  ANF Code Test
//
//  Created by Chinthakuntla, Sai Supriya on 7/21/21.
//

import Foundation
import UIKit

class ANFExploreCardTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    
    weak var tableView: UITableView!
    weak var delegate: ExploreCardDelegate?
    
    var exploreCardList = [ExploreCard]()
    
    //MVVM pattern
    var exploreCardAPIHandler = ANFExploreCardAPIHandler()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreCardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCardCell") as? ExploreCardTableViewCell
         let exploreCard = exploreCardList[indexPath.row]
            cell?.titleLabel.text = exploreCard.title
            if let url = URL(string: exploreCard.backgroundImage ?? "") {
                cell?.cardImageView?.load(url: url)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exploreCard = exploreCardList[indexPath.row] 
        delegate?.selectedExploreCard(exploreCard: exploreCard)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

protocol ExploreCardDelegate : AnyObject {
    
    func selectedExploreCard(exploreCard: ExploreCard)
}

