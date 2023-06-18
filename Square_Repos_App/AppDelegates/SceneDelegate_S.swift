//
//  SceneDelegate_S.swift
//  Recipes_APP
//
//  Created by mostafa elsanadidy on 28.02.23.
//

import Foundation
import UIKit

extension SceneDelegate{
    
    // MARK: - Redirect To VC
    @objc func redirect_To_VC(vc : UIViewController) {
        let navController = UINavigationController(rootViewController: vc)
        navController.isNavigationBarHidden = true
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
