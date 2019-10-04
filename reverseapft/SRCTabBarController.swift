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
    var acftStoreProduct: SKStoreProductViewController?
    
    func createAcftStoreProduct(force: Bool = false) {
        if (self.acftStoreProduct == nil || force) {
            self.acftStoreProduct = SKStoreProductViewController()
            self.acftStoreProduct?.delegate = self
            let params = [
                SKStoreProductParameterITunesItemIdentifier:1439376176
            ]
            self.acftStoreProduct!.loadProduct(withParameters: params, completionBlock: { status, _ in
                printd("done loading store product", status)
                if(!status) {
                    self.createAcftStoreProduct(force: true)
                }
            })
        }
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
        self.createAcftStoreProduct(force: true) // if it isn't recreated then the status bar covers up the navigation
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return viewController.tabBarItem.tag != 666
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAcftStoreProduct()
        
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = UIColor.systemBackground
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 666) {
            //let app = URL(string: "itms-apps://itunes.apple.com/app/id/1439376176?mt=8")
            //let link = URL(string: "https://itunes.apple.com/us/app/acft-calculator-and-resources/id1439376176?mt=8")
            self.createAcftStoreProduct()
            self.acftStoreProduct?.popoverPresentationController?.sourceView = self.selectedViewController?.view
            self.present(self.acftStoreProduct!, animated: true, completion: nil)
        }
    }
}
