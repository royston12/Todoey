//
//  ViewController.swift
//  Todoey
//
//  Created by Royston Vishal Rodrigues on 09/01/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var textField = UITextField()
    
    var itemArray = ["Buy Eggs", "Buy Protien Oats", "Go for back workout", "Go for cardio"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            self.itemArray.append(self.textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField() {
            (alertTextfield) in
            alertTextfield.placeholder = "Create new item"
            self.textField = alertTextfield
            
        }
        
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

// MARK: TableView datasource methods


extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
//MARK: TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    
       
        
    }
    
}

