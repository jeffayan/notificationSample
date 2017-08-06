//
//  ViewController.swift
//  pushNotificationSample
//
//  Created by Developer on 06/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        

    }
    
    @IBAction func click(_ sender: Any) {
        
        
        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "sample Push notification"
        content.body = "Sample Notification body"
        content.categoryIdentifier = "cate"
        
        
        let request = UNNotificationRequest(identifier: "idd", content: content, trigger: trigger)
               
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
        })

        
        
    }
    
    

}


extension ViewController : UNUserNotificationCenterDelegate{
    
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void){
        
        print("\n\n content\n",notification.request.content)
        
        completionHandler([.alert])
        
    }
    
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void){
        
        print("\n\n id \n",response.actionIdentifier.characters)
        
        completionHandler()
    }

    
    
}
