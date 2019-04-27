//
//  ViewController.swift
//  Swift_demo_02
//
//  Created by fgy on 2019/4/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Foundation
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let f = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Person")
        
    }
    func getContext() -> NSManagedObjectContext  {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
    
    func insert() -> Void {
        for i in 0..<10 {
            let age = i
            let name = "name\(i)"
            
            
            
        }
    }
    func insertClass(age:Int16,name:String,address:String) -> Void {
        let con = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: con)
        let classEntity = NSManagedObject(entity: entity!, insertInto: con)
        entity?.setValue(age, forKey: "age")
        entity?.setValue(name, forKey: "name")
        entity?.setValue(address, forKey: "address")
        do {
            try con.save();
        } catch  {
            assertionFailure(errno.description)
        }
        
        
        
    }


}

