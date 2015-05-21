//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Justin Vallely on 5/21/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        //var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
        //newUser.setValue("Justin", forKey: "username")
        //newUser.setValue("pass1234", forKey: "password")
        
        // Save, ignoring errors
        //context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        // Request a particular item from the database
        request.predicate = NSPredicate(format: "username = %@", "Ashley")
        
        // Fetch data, ignoring errors
        var results = context.executeFetchRequest(request, error: nil)
        
        if results?.count > 0 {
            
            println(results)
            
            for result:AnyObject in results! {
                
                if let user = result.valueForKey("username") as? String {
            
                    println(user)
                    
                    if user == "Ashley" {
                        
                        //context.deleteObject(result as! NSManagedObject)
                        //println(user + "has been deleted")
                        
                        // Change password
                        result.setValue("pass6", forKey: "password")
                    }
                }
                
                context.save(nil)
            }
            
            
        } else {
            println("No results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

