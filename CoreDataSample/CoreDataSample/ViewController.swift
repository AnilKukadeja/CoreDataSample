//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Anil Kukadeja on 22/06/18.
//  Copyright © 2018 Anil Kukadeja. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupOnLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Custom Methods

extension ViewController{
    
    func setupOnLoad(){
        addSampleData()
        getSampleData()
    }
    
    func addSampleData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = User(context: managedContext)
        
        userEntity.name = "John"
        userEntity.email = "john@test.com"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let date = formatter.date(from: "07/04/1991")
        userEntity.date = date as NSDate?
        
        let carAudiEntity = Car(context: managedContext)
        carAudiEntity.model = "Audi A8"
        carAudiEntity.year = 2017
        carAudiEntity.user = userEntity
        
        let carBMWEntity = Car(context: managedContext)
        carBMWEntity.model = "BMW X6"
        carBMWEntity.year = 2015
        carBMWEntity.user = userEntity
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getSampleData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let users = try! managedContext.fetch(userFetch) as? [User]
        
        for user in users!{
            print(user.name)
            print(user.car)
        }
        
    }
    
    
}
