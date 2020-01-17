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

var index = 0
     var cp : Person?
    var p = [Person]()
    var personlist = [Person]()
   // var oldperson : Person?
    @IBOutlet weak var disp: UITableView!

    // MARK: - Properties
    lazy var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      return formatter
    }()
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "nextVC") as? nextVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

 
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let dest = segue.destination as! nextVC
//        if let path = disp.indexPathForSelectedRow?.row{
//            
//            dest.oldperson = p[index]
//            
//        }
//        
//        
//    }
//    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    
        p = fetchRecords()
    
         disp.reloadData()
        
        
    }
    
    
    @IBAction func unwindto(Segue:UIStoryboardSegue){
        
        disp.reloadData()
        
    }

    
    
        func fetchRecords() -> [Person]{
              //
               let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
               
               do{
                   personlist = try ViewController.managedContext.fetch(fetchRequest)
               }catch{
                   print(error)
               }
               return personlist
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
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath.row
        
  
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "nextVC") as? nextVC
        vc?.save = false
          vc?.oldperson = p[index]
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
    
    }
    
    
    

    
    
    
