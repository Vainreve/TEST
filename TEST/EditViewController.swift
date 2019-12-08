//
//  EditViewController.swift
//  TEST
//
//  Created by Kamalapathy on 7/12/19.
//  Copyright © 2019 yjj. All rights reserved.
//

import Foundation
import UIKit
class EditViewController: UIViewController {
    
    @IBOutlet weak var recipeTF: UITextField!
    @IBOutlet weak var preparationTimeTF: UITextField!
    @IBOutlet weak var ingTF1: UITextField!
    @IBOutlet weak var ingTF2: UITextField!
    @IBOutlet weak var ingTF3: UITextField!
    @IBOutlet weak var ingTF4: UITextField!
    @IBOutlet weak var ingTF5: UITextField!
    
    var recipe:String?
    var pTime:String?
    var ing1:String?
    var ing2:String?
    var ing3:String?
    var ing4:String?
    var ing5:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeDisplay()
    }
    
    @IBAction func editBtn(_ sender: Any) {
        let rc:RecipeController = RecipeController()
        
        //Update the recipe
        rc.UpdateRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), name: recipe!)
        
        
        //Update the ingredient
        if (ingTF1.text != " " && ing1 != " "){
            rc.UpdateIngredientByRecipe(ingredient: Ingredient(name: ingTF1.text!), name: ing1!)
        }
        if (ingTF2.text != " " && ing2 != " "){
            rc.UpdateIngredientByRecipe(ingredient: Ingredient(name: ingTF2.text!), name: ing2!)
        }
        if (ingTF3.text != " " && ing3 != " "){
            rc.UpdateIngredientByRecipe(ingredient: Ingredient(name: ingTF3.text!), name: ing3!)
        }
        if (ingTF4.text != " " && ing4 != " "){
            rc.UpdateIngredientByRecipe(ingredient: Ingredient(name: ingTF4.text!), name: ing4!)
        }
        if (ingTF5.text != " " && ing5 != " "){
            rc.UpdateIngredientByRecipe(ingredient: Ingredient(name: ingTF5.text!), name: ing5!)
        }
        
        
        //Add new ingredient if it is empthy
        if (ingTF1.text != " " && ing1 == " ") {
            rc.AddIngredientToRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), ingredient: Ingredient(name: ingTF1.text!))
        }
        if (ingTF2.text != " " && ing2 == " ") {
            rc.AddIngredientToRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), ingredient: Ingredient(name: ingTF2.text!))
        }
        if (ingTF3.text != " " && ing3 == " ") {
            rc.AddIngredientToRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), ingredient: Ingredient(name: ingTF3.text!))
        }
        if (ingTF4.text != " " && ing4 == " ") {
            rc.AddIngredientToRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), ingredient: Ingredient(name: ingTF4.text!))
        }
        if (ingTF5.text != " " && ing5 == " ") {
            rc.AddIngredientToRecipe(recipe: Recipe(name: recipeTF.text!, preparationTime: Int16(preparationTimeTF.text!)!), ingredient: Ingredient(name: ingTF5.text!))
        }
        
        //Alert dialog for SUCCESS
        let alertView = UIAlertController(title: "Nice!!!",
                                          message: "You have Updated a Recipe",
                                          preferredStyle: UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: "Noted",
                                          style: UIAlertAction.Style.default,
                                          handler: { _ in print("User select yes")}))
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    func changeDisplay(){
        if let r = recipe, let p = pTime, let i1 = ing1, let i2 = ing2,
            let i3 = ing3, let i4 = ing4, let i5 = ing5{
            
            recipeTF.text = r
            preparationTimeTF.text = p
            ingTF1.text = i1
            ingTF2.text = i2
            ingTF3.text = i3
            ingTF4.text = i4
            ingTF5.text = i5
        }
    }
}
