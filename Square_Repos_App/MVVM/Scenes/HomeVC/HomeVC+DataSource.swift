//
//  HomeVC+Collection.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import UIKit

extension HomeVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel?.separateRepos.value.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath)
        if let ReposCell = cell as? RepoCell{
            guard let ReposItem = self.homeViewModel?.separateRepos.value[indexPath.row] else{return cell}
            ReposCell.nameLbl.text = ReposItem.name ?? ""
            if ReposItem.languagge == ""{
                ReposCell.langLabel.text = "unspecific"}
            else{
                    ReposCell.langLabel.text = ReposItem.languagge
                }
            ReposCell.descriptionLbl.text = ReposItem.descriptionField ?? ""
            ReposCell.visibilityLabel.text = ReposItem.visibility ?? ""
            
        }
        return cell
    }
}
