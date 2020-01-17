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
    static var managedContext: NSManagedObjectContext!
  
    
 
   @IBOutlet weak var name: UITextField!
   @IBOutlet weak var age: UITextField!
   @IBOutlet weak var fee: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
}

    lazy var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .medium
      return formatter
    }()
    
    
    
    
    
    @IBAction func save(_ sender: Any) {
       var sname = name.text!
       var sage = Int(age.text!) ?? 0
       var sfee = Int(fee.text!) ?? 0
       
             let cpp = Person(context: ViewController.managedContext)
             cpp.name = sname
             cpp.age = Int16(sage) ?? 0
             cpp.fee = Int16(sfee) ?? 0
        cpp.date = NSDate() as Date
          
        
        try! ViewController.managedContext.save()

    }


}


