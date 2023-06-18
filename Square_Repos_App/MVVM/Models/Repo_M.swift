//
//  Repo_M.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import Foundation
import SwiftyJSON

class Repo_M{

    var descriptionField : String!
    var fullName : String!
    var gitUrl : String!
    var languagge : String!
    var languagesUrl : String!
    var name : String!
    var url : String!
    var visibility : String!
    var watchersCount : Int!
    var privateField : Bool!
    

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        descriptionField = json["description"].stringValue
        fullName = json["full_name"].stringValue
        gitUrl = json["git_url"].stringValue
        languagge = json["language"].stringValue
        languagesUrl = json["languages_url"].stringValue
        name = json["name"].stringValue
        privateField = json["private"].boolValue
        url = json["url"].stringValue
        visibility = json["visibility"].stringValue
        watchersCount = json["watchers_count"].intValue
    }

}
