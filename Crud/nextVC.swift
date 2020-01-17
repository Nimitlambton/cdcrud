//
//  nextVC.swift
//  Crud
//
//  Created by MacStudent on 2020-01-15.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData
class nextVC: UIViewController {

    var cp : Person?
    var oldperson : Person?
    var save = true
     var thirdperson : Person?
    static var managedContext: NSManagedObjectContext!
  
    
    @IBOutlet weak var date: UIDatePicker!
    
    
   @IBOutlet weak var name: UITextField!
   @IBOutlet weak var age: UITextField!
   @IBOutlet weak var fee: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //name
       
        name.text = oldperson?.name ?? ""
       //age
        
        if let age1 = oldperson?.age{
             age.text = "\(age1)"
            print(age)
        }
          //fee
        if let fee1 = oldperson?.fee{
                   fee.text = "\(fee1)"
                  print(fee)
              }
               //date
        if let date1 = oldperson?.date{
            
            date.date = date1
            print(date)
        }
       
        
        
}

   
    
    
    
    
    
    @IBAction func save(_ sender: Any) {
        
        let sname = name.text!
                     let sage = Int(age.text!) ?? 0
                     let sfee = Int(fee.text!) ?? 0
                     let sdate = date.date
        if save {
         
                 
                 let cpp = Person(context: ViewController.managedContext)
                
                 cpp.name = sname
            cpp.age = Int16(sage)
            cpp.fee = Int16(sfee)
                 cpp.date = sdate
              
            
            try! ViewController.managedContext.save()
            
        }else{
            
                  
                   
                   if let forthperson = oldperson{
                       
                       
                       forthperson.name = sname
                       forthperson.age = Int16(sage)
                       forthperson.fee = Int16(sage)
                       forthperson.date = sdate
                      
                       thirdperson = forthperson
                       
                       
                       
                   }else{
                       
                       print("void")
                       
                   }
                   
                   

                   
                   

                   
                   }
                   
                   
            
        }
        
        
    
       
    }





