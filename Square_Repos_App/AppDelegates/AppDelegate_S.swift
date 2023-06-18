//
//  AppDelegate_S.swift
//  Zawidha
//
//  Created by Maher on 10/4/20.
//

import UIKit
import NVActivityIndicatorView

let ad = UIApplication.shared.delegate as? AppDelegate
//let viewContext = ad?.persistentContainer.viewContext
var error : NSError?

extension AppDelegate {
   
    var activityData:ActivityData{
        return ActivityData(size: CGSize(width: 20, height: 20), message: nil, messageFont: .none, messageSpacing: 0, type: .lineSpinFadeLoader, color: .black, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 3, backgroundColor:.clear
                                               , textColor: .clear)}
    func isLoading() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    func killLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    // MARK: - Redirect TO VC
    @objc func redirect_TO(vc : UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
            else {
                return
        }
        sceneDelegate.redirect_To_VC(vc: vc)
    }
    
    // MARK: - Current Root VC
    func CurrentRootVC() -> UIViewController? {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
            else {
                return nil
        }
        return  sceneDelegate.window?.currentViewController()
    }
    
    
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
//            print("App already launched")
            return true
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
//            print("App launched first time")
            return false
        }
    }
    
}

