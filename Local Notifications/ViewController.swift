//
//  ViewController.swift
//  Local Notifications
//
//  Created by Yohannes Wijaya on 10/1/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBAction Methods
    
    @IBAction func registerLocalButtonTapped(sender: UIButton) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    @IBAction func scheduleLocalButtonTapped(sender: UIButton) {
        guard let userNotificationSettings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
        if userNotificationSettings.types == UIUserNotificationType.None {
            let alertController = UIAlertController(title: "Can't schedule", message: "Either, we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(alertAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 8)
        localNotification.alertBody = "Swipe to unlock!"
        localNotification.alertAction = "Hit me!"
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.userInfo = ["CustomField": "abc"]
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    
    // MARK: - Methods Override

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

