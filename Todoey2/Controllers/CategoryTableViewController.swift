//
//  CategoryTableViewController.swift
//  Todoey2
//
//  Created by Глеб on 22/08/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categoriesArray : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        tableView.rowHeight = 75.0

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesArray?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categoriesArray?[indexPath.row].name ?? "No Categories added yet"
        
        // Configure the cell...

        return cell
    }
    
    //MARK - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoriesArray?[indexPath.row]
        }
    }
    
    //MARK - Add New Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            //what will happen once the user clicks the Add Category button on our UIAlert
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK - Model Manupulation Methods
    
    func save(category : Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error while saving context, \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    func loadCategories () {
        
        categoriesArray = realm.objects(Category.self)
        

    }
    
    //MARK: - Delete data from swipe
    
    override func updateModel(at indexPath: IndexPath) {
        
        if let categoryForDeletion = self.categoriesArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error while deleting category, \(error)")
            }
        }
    }
}


