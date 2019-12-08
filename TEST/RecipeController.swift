//
//  RecipeController.swift
//  TEST
//
//  Created by Kamalapathy on 2/12/19.
//  Copyright © 2019 yjj. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeController {
    func AddRecipe(recipe:Recipe){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
        let cdrecipe = NSManagedObject(entity: entity, insertInto: context) as! CDRecipe
        
        cdrecipe.name = recipe.name
        cdrecipe.preparationTime = recipe.preparationTime
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredient:Ingredient){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)
        let cdingredient = NSManagedObject(entity: entity!, insertInto: context) as! CDIngredient
        cdingredient.name = ingredient.name
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name)
        
        do{
            let cdrecipe = try context.fetch(fetchRequest)
            let temp = cdrecipe[0] as! CDRecipe
            cdingredient.addToRecipes(temp)
        }catch{
            print(error)
        }
        
        
        appDelegate.saveContext()
    }
    
    func RetrieveRecipe() ->[Recipe]{
        var recipeList:[Recipe] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        do{
            let list = try context.fetch(request) as! [CDRecipe]
            
            for r in list {
                recipeList.append(Recipe(name: r.name!, preparationTime: r.preparationTime))
            }
            
        }catch let error as NSError{
            print("Could not fetch. \(error),\(error.userInfo)")
        }
        
        return recipeList
    }
    
    func RetrieveIngredientFromRecipe(recipe:Recipe) ->[Ingredient]{
        var ingredientList:[Ingredient] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        // IF THE Relationship is MANY TO MANY, USE "ANY"
        request.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name)
        
        do{
            let list = try context.fetch(request) as! [CDIngredient]
            for i in list{
                ingredientList.append(Ingredient(name: i.name!))
            }
            
            
        }catch let error as NSError{
            print("Could not fetch. \(error),\(error.userInfo)")
        }
        
        return ingredientList
    }
    
    func UpdateRecipe(recipe:Recipe, name:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "ANY name = %@", name)
        
        do {
            let list = try context.fetch(fetchRequest)
            
            let objectUpdate = list[0] as! CDRecipe
            objectUpdate.name = recipe.name
            objectUpdate.preparationTime = recipe.preparationTime
            
            appDelegate.saveContext()
            
        }catch let error as NSError{
            print("Could not update data. \(error),\(error.userInfo)")
        }
        
    }
    
    func UpdateIngredientByRecipe(ingredient:Ingredient, name:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchRequest.predicate = NSPredicate(format: "ANY name = %@", name)
        
        do {
            let list = try context.fetch(fetchRequest)
            
            let objectUpdate = list[0] as! CDIngredient
            objectUpdate.name = ingredient.name
            
            appDelegate.saveContext()
            
        }catch let error as NSError{
            print("Could not update data. \(error),\(error.userInfo)")
        }
        
    }
    
    
}
