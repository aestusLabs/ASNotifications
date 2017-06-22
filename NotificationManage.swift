//
//  NotificationManage.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications


func getAllPendingNotifications() {
    UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
        for request in requests {
            print(request)
        }
    }
}

func removePendingNotificationsWith(identifiers: [String]) {
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
}

func removeAllPendingNotifications() {
    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
}

func removeDeliveredNotificationsWith(identifiers: [String])  {
    UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: identifiers)
    
}

func removeAllDeliveredNotifications() {
    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
}

// To update a pending notificaiton just use the same notificaiton with the schedule function
// To update a delivered notificaiton you just do the same thing

