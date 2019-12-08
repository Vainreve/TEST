//
//  RecipeTableViewController.swift
//  TEST
//
//  Created by Kamalapathy on 7/12/19.
//  Copyright © 2019 yjj. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController: UITableViewController {
    
    //for n in 1...5 {
    //    print(n)
    //}

    // Output: 1 2 3 4 5
    
    //set recipe in didload and viewDidAppear *****
    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []
    let rc:RecipeController = RecipeController()
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeList = rc.RetrieveRecipe()
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        recipeList = rc.RetrieveRecipe()
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        ingredientList = rc.RetrieveIngredientFromRecipe(recipe: recipeList[indexPath.row])
        
        //cell.textLabel!.text = "\(recipeList[indexPath.row].name) Preparation Time: \(recipeList[indexPath.row].preparationTime)"
        
        cell.textLabel!.text = recipeList[indexPath.row].name
        
        var s:String = ""
        
        for i in ingredientList{
            s += i.name + "  "
        }
        
        cell.detailTextLabel!.text = s
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "EditRecipe"){
            let controller = segue.destination as? EditViewController
            if let row = tableView.indexPathForSelectedRow?.row{
                
                controller?.recipe = recipeList[row].name
                controller?.pTime = String(recipeList[row].preparationTime)
                
                ingredientList = rc.RetrieveIngredientFromRecipe(recipe: recipeList[row])
                
                print(recipeList[row].name)
                for i in ingredientList{
                    print(i.name)
                }
                
                if (ingredientList.count == 1){
                    controller?.ing1 = ingredientList[0].name
                    controller?.ing2 = " "
                    controller?.ing3 = " "
                    controller?.ing4 = " "
                    controller?.ing5 = " "
                }
                else if (ingredientList.count == 2){
                    controller?.ing1 = ingredientList[0].name
                    controller?.ing2 = ingredientList[1].name
                    controller?.ing3 = " "
                    controller?.ing4 = " "
                    controller?.ing5 = " "
                }
                else if (ingredientList.count == 3){
                    controller?.ing1 = ingredientList[0].name
                    controller?.ing2 = ingredientList[1].name
                    controller?.ing3 = ingredientList[2].name
                    controller?.ing4 = " "
                    controller?.ing5 = " "
                }
                else if (ingredientList.count == 4){
                    controller?.ing1 = ingredientList[0].name
                    controller?.ing2 = ingredientList[1].name
                    controller?.ing3 = ingredientList[2].name
                    controller?.ing4 = ingredientList[3].name
                    controller?.ing5 = " "
                }
                else if (ingredientList.count == 5){
                    controller?.ing1 = ingredientList[0].name
                    controller?.ing2 = ingredientList[1].name
                    controller?.ing3 = ingredientList[2].name
                    controller?.ing4 = ingredientList[3].name
                    controller?.ing5 = ingredientList[4].name
                }
                
            }
        }
    }
}
