//
//  NoteTableViewController.swift
//  bibin_c0769970_Note_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController,UITabBarDelegate {
    
    
    @IBOutlet weak var edit: UIBarButtonItem!
    var folders : [String] = []
    var count : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        self.tableView.isEditing = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // return folders.count
    //}

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folders.count
   }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = folders[indexPath.row]
        cell?.imageView?.image = UIImage(named: "folder-icon.jpg")
        // Configure the cell...

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    //enabling the edit mode cause delete button to be visible for all the cells .

    //disable the button by implementing these methods

     override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

         if tableView.isEditing{

         

                 return .none

         

             }

             else{

         

                 return .delete

             }

     }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool

      {

          return false

      }

  
    
    @IBAction func newFolderClick(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        
               alert.addTextField {(UITextField) in
    
               }
    
               alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { (UIAlertAction) in
    
                   let content = alert.textFields![0] as UITextField
    
                   self.folders.append(content.text!)
        
                   self.tableView.reloadData()
        
               }))
        
               alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
               self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    //deleting the folders from table view

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)

        {

    if editingStyle == .delete

    {

                folders.remove(at: indexPath.row)

            }

            tableView.reloadData()

        }
    
   //creating folders in the table



       override func tableView(_ tableView: UITableView, canMoveRowAt IndexPath: IndexPath) -> Bool

           {

           return true

           }

       override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)

       {

           let rowToMove = folders[sourceIndexPath.row]

           folders.remove(at: sourceIndexPath.row)

           folders.insert(rowToMove, at: destinationIndexPath.row)

   }

   }


        
    
    
    
    

