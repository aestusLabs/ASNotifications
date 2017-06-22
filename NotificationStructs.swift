//
//  NotificationStructs.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import CoreLocation

struct MyDateNotification {
    var notificationContent: UNMutableNotificationContent
    var title: String
    var subTitle: String
    var body: String
    var categoryID: String?
    var userInfo: [String: String]?
    var sound: UNNotificationSound?
    var fireDateComponents: DateComponents
    var repeats: Bool
    var requestID: String
    var imageURL: URL?

}

struct MyLocationNotification {
    var notificationContent: UNMutableNotificationContent
    var title: String
    var subTitle: String
    var body: String
    var categoryID: String?
    var userInfo: [String: String]?
    var sound: UNNotificationSound?
    var region: CLRegion
    var repeats: Bool
    var requestID: String
    var imageURL: URL?

}

struct MyTimeNotification {
    var notificationContent: UNMutableNotificationContent
    var title: String
    var subTitle: String
    var body: String
    var categoryID: String?
    var userInfo: [String: String]?
    var sound: UNNotificationSound?
    var timeInterval: TimeInterval
    var repeats: Bool
    var requestID: String
    var imageURL: URL?
}
// Test comment
