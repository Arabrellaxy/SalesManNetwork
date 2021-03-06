//
//  AppDelegate.swift
//  SalesManNetwork
//
//  Created by Arabrellaxy on 10/30/2018.
//  Copyright (c) 2018 Arabrellaxy. All rights reserved.
//

import UIKit
import SalesManNetwork
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let callBack = { (responseDic : NSDictionary)  in
            let status = responseDic.object(forKey: SWGlobal.status) as? Bool
            guard let _ = status else {
                return
            }
            if status! {
                SalesManAFNetworkAPI.shareInstance.saveCookies()
                SalesManAFNetworkAPI.shareInstance.requestItemCategory(completion: { (result) in
                    print("item")
                })

//                //success
//                let userID:String  = responseDic.object(forKey: "userId") as! String
//                //store username and password
//                if self.rememberPassword {
//                    let _ = SWDataStorage.init().storeUserInfo(userID: userID, username: username, password: password)
//                } else {
//                    let _ = SWDataStorage.init().storeUserInfo(userID: userID, username: username, password: nil)
//                }
                SalesManAFNetworkAPI.shareInstance.saveCookies()
//                self.dismiss(animated: true, completion: nil)
            } else {
                var message = responseDic.object(forKey: SWGlobal.message) as? String
                guard let _ = message else{
                    message = "账号或密码错误"
//                    self.view.showTextHud(text: message!, autoHide: true)
                    return
                }
//                self.view.showTextHud(text: message!, autoHide: true)
            }
        }
//        self.view.showLoadingHud(loadingText: "正在登录")
        SalesManAFNetworkAPI.shareInstance.loginWithParam([SWLogin.username:"xieyan",
                                                           SWLogin.password:"111111",
                                                           SWGlobal.callBack:callBack])
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

