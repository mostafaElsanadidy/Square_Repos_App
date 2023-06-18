//
//  Home_VM.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import UIKit


final class HomeList_VM {
    
    var separateReposContainer = SeparateReposContainer<Repo_M>()
    var separateRepos:Observable<[Repo_M]> = Observable([])
    var reposWillSet:Observable<Bool> = Observable(false)
    
    func viewWillAppear() {
        
        self.separateReposContainer.reposDidSet = {
            [weak self] repos in
            guard let strongSelf = self else{return}
            
            strongSelf.separateRepos.value = repos
        }
        
        self.separateReposContainer.reposWillSet =
        {
                [weak self]
                in
            guard let strongSelf = self else{return}
            strongSelf.reposWillSet.value = true
        }
        
        self.separateReposContainer.itemsCountDidSet = {
            [weak self]
            in
        guard let strongSelf = self else{return}
//           guard let recipesRoot = strongSelf.allRepositories else { return }
                strongSelf.appendGroupOfRecipes()
    }

        self.separateReposContainer.initialState()
        loadRepositories()
    }
    
    func appendGroupOfRecipes() {
        separateReposContainer.repositories = {separateReposContainer.repositories}()
    }
    
    func loadRepositories() {
        
        let dispatchGroup = DispatchGroup()
        ad?.isLoading()
        
        dispatchGroup.enter()   // <<---
        APIClient.getRepositories{[weak self] (result) in
            guard let strongSelf = self else{return}

            switch result {
            case .failure(let error) :
                print(error.localizedDescription)
                dispatchGroup.leave()
            case .success(let value) :
                guard let response = value else {
                    dispatchGroup.leave()
                    return }
                strongSelf.separateReposContainer.repositories = response
                strongSelf.separateReposContainer.totalCount = response.count
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            ad?.killLoading()
        }
    }
}

