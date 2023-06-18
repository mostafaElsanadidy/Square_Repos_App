//
//  HomeVC+Delegates.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import UIKit

extension HomeVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
 
extension HomeVC{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let  height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if Int(distanceFromBottom) <= Int(height) { // when you reach the bottom
            if ReposTableView == scrollView{
                self.homeViewModel?.appendGroupOfRecipes()
            }
        }
    }
    
}
