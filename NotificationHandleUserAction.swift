//
//  NotificationHandleUserAction.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

func handleUserAction(response: UNNotificationResponse) {
    print(response.actionIdentifier)
    let vc = ViewController()
    
    if response.actionIdentifier == actionIDs.testAction1 {
   // vc.action1()
    
    } else if response.actionIdentifier == actionIDs.testAction2 {
     //   vc.action2()
    } else if response.actionIdentifier == actionIDs.testAction3 {
       // vc.action3()
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        handleUserAction(response: response)
        print(response.actionIdentifier)
        
        completionHandler()
    }
}
