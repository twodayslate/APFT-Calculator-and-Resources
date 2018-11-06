//
//  SRCTabBarController.swift
//  reverseapft
//
//  Created by Zachary Gorak on 11/6/18.
//  Copyright © 2018 twodayslate. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class SRCTabBarController: UITabBarController, UITabBarControllerDelegate, SKStoreProductViewControllerDelegate {
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("should select?")
        return viewController.tabBarItem.tag != 666
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 666) {
            print("did select")
            //            self.selectedViewController = self.viewControllers?.first
            //            self.selectedIndex = 0
            //            self.tabBar(tabBar, didSelect: (self.tabBar.items?.first)!)
            let app = URL(string: "itms-apps://itunes.apple.com/app/id/1439376176?mt=8")
            //let link = URL(string: "https://itunes.apple.com/us/app/acft-calculator-and-resources/id1439376176?mt=8")
            let vc: SKStoreProductViewController = SKStoreProductViewController()
            vc.delegate = self
            let params = [
                SKStoreProductParameterITunesItemIdentifier:1439376176
            ]
            vc.loadProduct(withParameters: params, completionBlock: { status, _ in
                print("done loading store product", status)
                if(!status) {
                    //UIApplication.shared.open(app!, options: [:], completionHandler: nil)
                }
            })
            self.present(vc, animated: true, completion: {
                print("done presenting")
            })
        }
    }
}
