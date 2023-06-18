//
//  API_POST.swift
//  OrdersDeliveryApp
//
//  Created by mostafa elsanadidy on 16.05.23.
//

import Foundation
import Alamofire
import SwiftyJSON

extension APIClient{
    // MARK: - Get repositories Items
    static func getRepositories(completionHandler : @escaping(Result<[Repo_M]? , Result_Error>) -> Void) {
        ad?.isLoading()
        performSwiftyRequest(route: .getRepositories) { (jsonData) in
            let json = JSON(jsonData)
            guard case nil = json.array
                  else {
                DispatchQueue.main.async {
                    ad?.killLoading()
//                    let data = Repo_M(fromJson: json)
                    var items = [Repo_M]()
                    if let arrayJSON = json.array{
                      items = arrayJSON.map({return Repo_M(fromJson: $0)})
                    }
                    completionHandler(.success(items))
                }
                return
            }
            ad?.killLoading()
            let message = json["Result"]["ErrMsg"].string
            ad?.CurrentRootVC()?.show_Popup(body: message ?? "", type: .single, status: .failure)
            completionHandler(.failure(.status_Failure))
            
        } _: { (error) in
            ad?.killLoading()
            DispatchQueue.main.async {
                ad?.CurrentRootVC()?.show_Popup(body: error?.localizedDescription ?? "The network is disconnected", type: .single, status: .failure)
                completionHandler(.failure(.req_Failure))
            }
        }
    }
}
