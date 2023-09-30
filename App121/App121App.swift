//
//  App121App.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI
import OneSignal
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        if UIScreen.main.isCaptured {
            
            let repSec = RepositorySecond()
            let myData = MyDataClass.getMyData()
            
            repSec.post(isCaptured: false, isCast: true, mydata: myData) { result in
                
                switch result {
                    case .success(_):
                        print("")
                        
                    case .failure(_):
                        print("")
                    }
            }
        }
    }
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_86HTYXY38KdkSiHcH4fJ8S1ecQLQ2z")
        Amplitude.instance().initializeApiKey("f1342f8a11d0246ab9bcf64daf9e298c")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App121App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
