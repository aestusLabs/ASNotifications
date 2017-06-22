# ASNotifications (Aestus Starter Notifications)
Boilerplate code that makes it easy to add iOS10+ notifications to your iOS project. (Swift 3)


# Set Up

1. In any ViewController you plan to schedule notification in and the AppDelegate you need to import UserNotifications
2. Update AppDelegate with the following:

#### This Line Is For Handling Notification Actions
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
       
        return true
    }
    
#### View Notifications When App In Foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }

3. Make sure you call askPermission() from wherever you plan to ask the user for permission to show notifications.
4. If you plan on using notification actions call        
	myNotificationCategories.addAllNotificationsCategories()
5. Customize actions. For testing purposes I have 3 test actions pointing at 3 functions in ViewController.swift. Either add these functions or customize the actions.

		func action1() {
        	print("action1")
       
    	}
    	func action2() {
        	print("action2")
    	}
    	func action3() {
        	print("action3")
    	}

You can create a test notification like so:

	let testContent = UNMutableNotificationContent()
        let test = MyTimeNotification(notificationContent: testContent, title: "I'm a test", subTitle: "I'm a subtitle", body: "Im a body", categoryID: "TestCategory", userInfo: nil, sound: nil, timeInterval: 10, repeats: false, requestID: "TestID", imageURL: nil)
        scheduleNotificationBy.time(notification: test)
