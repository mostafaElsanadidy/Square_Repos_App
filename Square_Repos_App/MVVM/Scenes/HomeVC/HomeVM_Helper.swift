//
//  HomeVM_Struct.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import UIKit
//
//struct OrdersBill{
//    var date:String
//    var totalprice:Double
//    var deliveryStatus:DeliveryStatus
//    var serialNum:String
//}
//
//enum DeliveryStatusEnum:String {
//    case Delivered
//    case Returned
//    case Delivering
//    case New
//}
//
//struct DeliveryStatus{
//    var type_no:String
//    var type_name:DeliveryStatusEnum{
//        switch type_no{
//        case "1":return .Delivered
//        case "2":return .Delivering
//        case "3":return .Returned
//            default:return .New}
//    }
//    var type_Color:UIColor{
//        switch type_no{
//        case "1":return #colorLiteral(red: 0.5141947269, green: 0.5141947269, blue: 0.5141947269, alpha: 1)
//        case "2":return #colorLiteral(red: 0, green: 0.3823715746, blue: 0.4604289532, alpha: 1)
//        case "3":return #colorLiteral(red: 0.8725937009, green: 0.2503118515, blue: 0.05903184414, alpha: 1)
//        default: return #colorLiteral(red: 0.1480861008, green: 0.8438410163, blue: 0.0612315163, alpha: 1)
//         
//        }
//    }
//    init(type_no:String) {
//        self.type_no = type_no
//    }
//}


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
