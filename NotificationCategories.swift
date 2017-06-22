//
//  NotificationCategories.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

struct CategoryIdentifiers {
    var testCategory = "TestCategory"
}
var categoryIDs = CategoryIdentifiers()

struct MyNotificationCategories {
    var testCategory = UNNotificationCategory(identifier: categoryIDs.testCategory, actions: [actions.action1, actions.action2, actions.action3], intentIdentifiers: [], options: [])
    
    
    func addAllNotificationsCategories() {
        UNUserNotificationCenter.current().setNotificationCategories([myNotificationCategories.testCategory])
    }
}
let myNotificationCategories = MyNotificationCategories()
