//
//  TableViewController.swift
//  Project2
//
//  Created by mohammad.alsharif on 24/03/1443 AH.
//

import UIKit

struct Task {
    var title : String
}

class List {
    var items = [Task]()
}

class TableViewController: UITableViewController, AddListDelegate {
    func addNewList(list: String) {
        print("new list : \(list)")
    }
    
    
    var list = List()
    
    var isEmptyList = false
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print(list.items)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ListID")
        tableView.rowHeight = 70
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//            tableView.isUserInteractionEnabled = false
            return list.items.count
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Func Delete item
        if editingStyle == UITableViewCell.EditingStyle.delete {
                list.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListID", for: indexPath) as! TableViewCell
        
            cell.listLabel.text = list.items[indexPath.row].title
        
        return cell
    }
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */



    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "addSegue"){
            let addVC = segue.destination as! AddList
            addVC.list = list
        }
    }
    

}
