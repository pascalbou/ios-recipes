//
//  MainViewController.swift
//  Recipes
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let networkClient = RecipesNetworkClient()
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    @IBOutlet weak var searchField: UITextField!
    @IBAction func searchAction(_ sender: UITextField) {
        searchField.resignFirstResponder()
        filterRecipes()
    }
    
    func filterRecipes() {
        if let searchWords = searchField.text {
            filteredRecipes = allRecipes.filter { $0.name.contains(searchWords) || $0.instructions.contains(searchWords) }
        } else {
            filteredRecipes = allRecipes
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchRecipes { recipes, error in
            if let error = error {
                NSLog("Error fetching recipes: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                if let recipes = recipes {
                    self.allRecipes = recipes
                }
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ContainerSegue" {
            if let destinationVC = segue.destination as? RecipesTableViewController {
                recipesTableViewController = destinationVC
            }
        }
    }
    

}
