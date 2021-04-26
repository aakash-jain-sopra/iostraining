//
//  AppDelegate.swift
//  NSUrlSession
//
//  Created by Aakash Jain on 16/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //updateFeed(app: application)
    }
    
    func updateFeed(app: UIApplication) {
        
        let req = URLRequest(url: URL(string: "https://api.imgflip.com/get_memes")!)
        
        let task = URLSession.init(configuration: URLSessionConfiguration.default).dataTask(with: req) {(data,response,error) -> Void in
            
            if error == nil && data != nil {
                let f = Feed(data: data!)
               // OperationQueue.main.addOperation(block: completion(f))
                OperationQueue.main.addOperation {
                    let viewController = app.windows[0].rootViewController as? TableViewController
                    viewController?.feed = f
                }
            }
        }
        task.resume()
    }


}

