//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

final class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeInstructionsTextView: UITextView!
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        recipeNameLabel.text = recipe?.name
        recipeInstructionsTextView.text = recipe?.instructions
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }


}
