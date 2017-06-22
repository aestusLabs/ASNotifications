# ASNotifications (Aestus Starter Notifications)
Boilerplate code that makes it easy to add iOS10+ notifications to your iOS project. (Swift 3)

Note: You need to make the following changes to AppDelegate

# This Line Is For Handling Notification Actions
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
       
        return true
    }
    
# View Notifications When App In Foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
