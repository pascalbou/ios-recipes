//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)

        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "RecipeDetailSegue" {
            if let destinationVC = segue.destination as? RecipeDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.recipe = recipes[indexPath.row]
            }
        }
    }
    

}
