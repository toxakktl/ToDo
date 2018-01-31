//
//  ViewController.swift
//  ToDo
//
//  Created by Tokhtar Yelemessov on 1/31/18.
//  Copyright © 2018 Tokhtar Yelemessov. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Learn Swift"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Create an APP"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Deploy to APP store"
        itemArray.append(newItem3)
        if let items =  defaults.array(forKey: "TodoListArray") as?  [Item]{
            itemArray = items
        }
    }
    
    
    // MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done == true ? .checkmark : .none
        return cell
    }
    
    //Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new TODO Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default)
        { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

