//
//  AskPermission.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-22.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

func askPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options:
        [[.alert, .sound, .badge]], completionHandler: { (granted, error) in
            
            if !granted {
                print("User did not allow notifications")
            }
    })
}
