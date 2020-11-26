//
//  AppDelegate.swift
//  CombineCoreDataTest
//
//  Created by Sima Vlad Grigore on 20/11/2020.
//  Copyright © 2020 Sima Vlad Grigore. All rights reserved.
//

import UIKit
import Combine

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    private var subscriber: AnyCancellable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        self.insertPerson()
        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    private func insertPerson() {
        CoreDataHandler.shatedInstance().persistenceContainer.performBackgroundTask { (context) in
            let person = Person(context: context)
            person.name = "Sima"
            person.surname = "Vlad"
            person.age = 35
            
            let publisher = AddCoreDataPublisher(context: context)
            self.subscriber = publisher.addCoreDataSink(receiveCompletion: { (completionResult) in
                switch completionResult {
                case .finished:
                    print("Finished with success")
                case .failure(let error):
                    print("Finished with error \(error)")
                }
            }, receiveValue: {})
        }
    }
}
