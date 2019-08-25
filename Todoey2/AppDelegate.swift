//
//  AppDelegate.swift
//  Todoey2
//
//  Created by Глеб on 18/08/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)

        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        
                
        return true
    }
}

