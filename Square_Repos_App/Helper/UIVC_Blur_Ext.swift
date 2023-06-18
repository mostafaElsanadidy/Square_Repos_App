//
//  UIVC_Blur_Ext.swift
//  Zawidha
//
//  Created by Maher on 10/6/20.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController:NVActivityIndicatorViewable{
    func set_Blur(containerView : UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.9
        blurEffectView.frame = containerView.frame
        containerView.insertSubview(blurEffectView, at: 0)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showActivityView(isShow:Bool, tag:Int = 1000) {
        if isShow{
                   self.loading()
               }else{
                   self.killLoading()
               }
    }
      
    func loading(){
    
        let color = UIColor(red: 52/255.0, green: 87/255.0, blue: 183/255.0, alpha: 1.0)
        startAnimating(nil, message: nil, messageFont: nil, type: .ballTrianglePath, color: color , padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: .clear, textColor: nil, fadeInAnimation: nil)
    }
      
    func killLoading(){
        stopAnimating()
        }
}
