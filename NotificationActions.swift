//
//  NotificationActions.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

struct ActionIdentifiers {
    var testAction1 = "Test1"
    var testAction2 = "Test2"
    var testAction3 = "Test3"
}
let actionIDs = ActionIdentifiers()

struct NotificationActions {
    var action1 = UNNotificationAction(identifier: actionIDs.testAction1, title: "Action 1", options: [.foreground])
    var action2 = UNNotificationAction(identifier: actionIDs.testAction2, title: "Action 2", options: [])
    var action3 = UNNotificationAction(identifier: actionIDs.testAction3, title: "Action 3", options: [])

}
let actions = NotificationActions()
