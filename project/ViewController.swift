//
//  ViewController.swift
//  project
//
//  Created by Lily on 11/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var outputLable: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
    
        if let symbol = textField.text{ // get the value of the text feild
            
            getData(symbol : symbol)
        
        }
    }
    
    
//    let url = "https://min-api.cryptocompare.com/data/price?tsyms=USD&fsym=btc"
    
    var url = "https://min-api.cryptocompare.com/data/price?tsyms=USD"


    func getData(symbol : String){
        
        url = "\(url)&fsym=\(symbol)"
        
        
        
        //1. initialize the URL
        guard let url = URL(string: url) else {return} // use guard only if var is used thoughout the whole code
        
        //2. Initialize task and URL sessions
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            //3.Check Optional
            guard let data = data, error == nil else{return}
        
            print("Data recviced")
            
            do{
            let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                print(Result.USD)
                
                //String Interpolation
                
                DispatchQueue.main.async {
                    self.outputLable.text = "\(Result.USD)"
                }
                
                
                
                //Type
                self.outputLable.text = "\(Result.USD)" // prints the float value
            }
        
            catch {
                print(error.localizedDescription) // gets the current locations lanaugage like english for america
            }
        }
        
        // resume task
        task.resume()
        
        //CLOSESURE - create a function within a function
        
        
        
    }
    
    //5.Define Resopance Parameters in a Structure
    struct APIResponse: Codable {
        
        let USD : Float
        
        // to get longtude and laditude from weather app
       // let coord : [variableName]// to go into another layer of the weather API
        
    }
    
    // for laditude and longtude
    //struct variableName : Codable {
    //    let lon : Float
    //    let lat : Float
    //}
    
    
    
// JSON object -> swift foundation object

    //1.initialize URL
    
    //2.Initialize Task and URL sessioin
    
    //3.Check Optionals
    
    //4. Resume Task
    
    //5.Define Resopance Parameters in a Structure
    
    
    
    

}

