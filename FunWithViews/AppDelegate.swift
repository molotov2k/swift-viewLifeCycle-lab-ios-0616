//
//  AppDelegate.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window!.rootViewController = ViewController()
        window!.makeKeyAndVisible()
        return true
    }

}

