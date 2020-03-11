//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeDescription: UITextView!
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if self.isViewLoaded, let recipe = recipe {
            recipeLabel.text = recipe.name
            recipeDescription.text = recipe.instructions
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
