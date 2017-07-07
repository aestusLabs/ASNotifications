//
//  NotificationManagerViewController.swift
//  Testing Adding Git Submodules
//
//  Created by Ian Kohlert on 2017-07-07.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class NotificationManagerViewController: UIViewController {

    
    var notificationManagerView = NotificationManagerView()
    var helperBar = HelperBar()
    var dailyReminderCard = DailyReminderCard()
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationManagerView = setUpNotificationManagerView(screenHeight: getScreenHeight(), screenWidth: getScreenWidth())
        self.view.addSubview(notificationManagerView)
        helperBar = setUpHelperBar()
        self.view.addSubview(helperBar)
        
        createDaiyReminderCard()
        
        for day in userInfo.daysToFireDailyReminder {
        dailyReminderCard.changeCircleToActive(day: day)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func createDaiyReminderCard() {
        dailyReminderCard = setUpDailyReminderCard(screenWidth: getScreenWidth())
        var timeQualifier = "am"
        var reminderHour = userInfo.dailyReminderHour
        var reminderMinute = userInfo.dailyReminderMinute
        if userInfo.dailyReminderHour > 12 {
            timeQualifier = "pm"
            reminderHour = reminderHour - 12
        }
        var addedZero = ""
        if reminderMinute < 10 {
            addedZero = "0"
        }
        dailyReminderCard.changeHelperText(text: "Daily reminder at \(reminderHour):\(userInfo.dailyReminderMinute)\(addedZero)\(timeQualifier)")
        if reminderMinute == 0 {
        dailyReminderCard.changeHelperText(text: "Daily reminder at \(reminderHour)\(timeQualifier)")    
        }
        self.view.addSubview(dailyReminderCard)
        dailyReminderCard.center.y = helperBar.frame.minY - dailyReminderCard.frame.height / 2 - 20
        
        var dayTags = 30
        for day in dailyReminderCard.arrayOfCircles {
            
            day.tag = dayTags
            dayTags += 1
            day.addGestureRecognizer(setTapRecognizer(sender: day))
        }
    }
    
    func tappedDay(sender: AnyObject) {
        print(sender.view.tag)
        let tagNumberMinus30 = sender.view.tag - 30
        var day: daysOfWeek = .mon
        if tagNumberMinus30 == 1 {
            day = .tue
        } else if tagNumberMinus30 == 2 {
            day = .wed
        } else if tagNumberMinus30 == 3 {
            day = .thu
        } else if tagNumberMinus30 == 4 {
            day = .fri
        } else if tagNumberMinus30 == 5 {
            day = .sat
        }else if tagNumberMinus30 == 6 {
            day = .sun
        }
        if userInfo.daysToFireDailyReminder.contains(day) {
            dailyReminderCard.changeCircleToInactive(day: day)
            if let dayIndex = userInfo.daysToFireDailyReminder.index(of: day) {
                userInfo.daysToFireDailyReminder.remove(at: dayIndex)
            }
        } else {
            dailyReminderCard.changeCircleToActive(day: day)
            userInfo.daysToFireDailyReminder.append(day)
        }
    }
    
    func setTapRecognizer(sender: Circle) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedDay))
        return tap
    }

}
