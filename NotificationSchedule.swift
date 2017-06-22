//
//  NotificationSchedule.swift
//  Notification Self Tutorial
//
//  Created by Ian Kohlert on 2017-06-21.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

struct ScheduleNotifcation {
    
    func date(notification: MyDateNotification) {
        let content = notification.notificationContent
        content.title = notification.title
        content.subtitle = notification.subTitle
        content.body = notification.body
        
        if let category = notification.categoryID {
            content.categoryIdentifier = category
        }
        
        if let notificationSound = notification.sound {
            content.sound = notificationSound
        }
        
        if let imageURL = notification.imageURL {
            do {
                let attachment = try UNNotificationAttachment(identifier: "Image", url: imageURL, options: [:])
                content.attachments = [attachment]
            } catch {
                print("Failed to add image")
            }
        }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: notification.fireDateComponents, repeats: notification.repeats)
        
        let request = UNNotificationRequest(identifier: notification.requestID, content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error)
        }
        
    }
    
    func time(notification: MyTimeNotification) {
        let content = notification.notificationContent
        content.title = notification.title
        content.subtitle = notification.subTitle
        content.body = notification.body
        
        if let category = notification.categoryID {
            content.categoryIdentifier = category
        }
        
        if let notificationSound = notification.sound {
            content.sound = notificationSound
        }
        
        if let imageURL = notification.imageURL {
                do {
                let attachment = try UNNotificationAttachment(identifier: "Image", url: imageURL, options: [:])
                    content.attachments = [attachment]
                } catch {
                    print("Failed to add image")
                }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notification.timeInterval, repeats: notification.repeats)
        
        let request = UNNotificationRequest(identifier: notification.requestID, content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error)
        }
    }
    
    
    func location(notification: MyLocationNotification) {
        let content = notification.notificationContent
        content.title = notification.title
        content.subtitle = notification.subTitle
        content.body = notification.body
        
        if let category = notification.categoryID {
            content.categoryIdentifier = category
        }
        
        if let notificationSound = notification.sound {
            content.sound = notificationSound
        }
        
        if let imageURL = notification.imageURL {
            do {
                let attachment = try UNNotificationAttachment(identifier: "Image", url: imageURL, options: [:])
                content.attachments = [attachment]
            } catch {
                print("Failed to add image")
            }
        }
        
        let trigger = UNLocationNotificationTrigger(region: notification.region, repeats: notification.repeats)
        
        let request = UNNotificationRequest(identifier: notification.requestID, content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error)
        }
        
    }
    
    
}
let scheduleNotificationBy = ScheduleNotifcation()
