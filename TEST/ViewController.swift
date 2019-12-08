//
//  ViewController.swift
//  TEST
//
//  Created by Kamalapathy on 2/12/19.
//  Copyright © 2019 yjj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRecipe: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnAdd(_ sender: Any) {

        if (txtRecipe.text != "" && txtPreparationTime.text != "") {
            if (txtIngredient1.text != "" || txtIngredient2.text != ""
                || txtIngredient3.text != "" || txtIngredient4.text != "" || txtIngredient5.text != "" ){
                
                let rc:RecipeController = RecipeController()
                let recipe:Recipe = Recipe(name: txtRecipe.text!, preparationTime: Int16(txtPreparationTime.text!)!)
                rc.AddRecipe(recipe: recipe)
                
                if(txtIngredient1.text != ""){
                    rc.AddIngredientToRecipe(recipe: recipe, ingredient: Ingredient(name: txtIngredient1.text!))
                }
                if(txtIngredient2.text != ""){
                    rc.AddIngredientToRecipe(recipe: recipe, ingredient: Ingredient(name: txtIngredient2.text!))
                }
                if(txtIngredient3.text != ""){
                    rc.AddIngredientToRecipe(recipe: recipe, ingredient: Ingredient(name: txtIngredient3.text!))
                }
                if(txtIngredient4.text != ""){
                    rc.AddIngredientToRecipe(recipe: recipe, ingredient: Ingredient(name: txtIngredient4.text!))
                }
                if(txtIngredient5.text != ""){
                    rc.AddIngredientToRecipe(recipe: recipe, ingredient: Ingredient(name: txtIngredient5.text!))
                }
                
            }
            else{
                let alertView = UIAlertController(title: "Empthy Field",
                                                  message: "Please populate at least one ingredient",
                                                  preferredStyle: UIAlertController.Style.alert)
                alertView.addAction(UIAlertAction(title: "Noted",
                                                  style: UIAlertAction.Style.default,
                                                  handler: { _ in print("User Noted")
                }))
                
                self.present(alertView, animated: true, completion: nil)
            }
        }
        else{
            let alertView = UIAlertController(title: "Empthy Field",
                                              message: "Please populate the title and the preparation time",
                                              preferredStyle: UIAlertController.Style.alert)
            alertView.addAction(UIAlertAction(title: "Noted",
                                              style: UIAlertAction.Style.default,
                                              handler: { _ in print("User Noted")
            }))
            
            self.present(alertView, animated: true, completion: nil)
        }
        
        txtPreparationTime.text = ""
        txtRecipe.text = ""
        txtIngredient1.text = ""
        txtIngredient2.text = ""
        txtIngredient3.text = ""
        txtIngredient4.text = ""
        txtIngredient5.text = ""
        
        let alertView = UIAlertController(title: "Nice!!!",
                                          message: "You have added a Recipe",
                                          preferredStyle: UIAlertController.Style.alert)
        
        alertView.addAction(UIAlertAction(title: "Noted",
                                          style: UIAlertAction.Style.default,
                                          handler: { _ in print("User select yes")
        }))
        
        self.present(alertView, animated: true, completion: nil)
        
    }
    


}

