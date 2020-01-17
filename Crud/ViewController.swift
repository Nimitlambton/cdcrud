//
//  ViewController.swift
//  Crud
//
//  Created by MacStudent on 2020-01-15.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import  CoreData
class ViewController: UIViewController {

static var managedContext: NSManagedObjectContext!


     var cp : Person?
    var p: [Person] = []
    
    @IBOutlet weak var disp: UITableView!

    // MARK: - Properties
    lazy var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.disp.reloadData()
        p = fetchRecords()
        print("enter3")
    }

 
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.disp.reloadData()
        print("enter2")

    }
    
    
    @IBAction func unwindto(Segue:UIStoryboardSegue){
        
        disp.reloadData()
        
    }

    
    
        func fetchRecords() -> [Person]{
               var arrLocation = [Person]()
               let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
               
               do{
                   arrLocation = try ViewController.managedContext.fetch(fetchRequest)
               }catch{
                   print(error)
               }
               return arrLocation
           }
        
    

    
   
    
    
    
}

extension ViewController : UITableViewDataSource , UITableViewDelegate{
   
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return p.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          
        
     
        cell.textLabel?.text = p[indexPath.row].name! + " " + "\(p[indexPath.row].age)" + " " + "\(p[indexPath.row].fee)"+"\(dateFormatter.string(from: p[indexPath.row].date!))"
        
        
        return cell
    }
    
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let personToDelete = p[indexPath.row].self as? Person,
        editingStyle == .delete else {
          return
      }

        ViewController.managedContext.delete(personToDelete)
     
      do {
        try ViewController.managedContext.save()
           p.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
      } catch let error as NSError {
        print("Saving error: \(error), description: \(error.userInfo)")
      }
    }
    
    
    }
    
    
    

    
    
    
