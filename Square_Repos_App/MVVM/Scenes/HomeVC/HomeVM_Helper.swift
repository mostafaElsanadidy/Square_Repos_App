//
//  HomeVM_Struct.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import UIKit

struct SeparateReposContainer<T>{
    var limit:Int = 0
    
    var indOfSeparateRepo:Int = 0
    var arrOfSeparateRepos:[T] = []
    var repositories=[T]()
    {
        willSet{
            reposWillSet()
        }
        didSet{
            if repositories.count/6 == 0{
                limit = repositories.count
                while indOfSeparateRepo < limit{
                        arrOfSeparateRepos.append(repositories[indOfSeparateRepo])
                           indOfSeparateRepo = indOfSeparateRepo + 1
                       }
            }
            let count = repositories.count
            let diff = count-limit
            if (diff < 6) && diff != 0 && (totalCount>count) {
                itemsCountDidSet()
            }else
            if limit < repositories.count{
                limit = arrOfSeparateRepos.count+6
                while indOfSeparateRepo < limit{
                    if indOfSeparateRepo == repositories.count{
                        limit = indOfSeparateRepo
                                break
                            }
                    arrOfSeparateRepos.append(repositories[indOfSeparateRepo])
                    indOfSeparateRepo = indOfSeparateRepo + 1
                               }
                        }
            reposDidSet(arrOfSeparateRepos)
                    }
    }
//    var isScrollToTop = false
    var reposDidSet:([T])->Void = {_  in}
    var reposWillSet:()->Void = {}
    var itemsCountDidSet:()->Void = {}
    var totalCount = 0
    
    mutating func initialState(){
        self.limit = 0
        self.indOfSeparateRepo = 0
        self.repositories = []
        self.arrOfSeparateRepos = []
    }
}
