//
//  ViewController.swift
//  API-DAY1-LAB
//
//  Created by Raghad Alahmadi on 09/04/1443 AH.
//

import UIKit

struct FruitType: Codable{
    var name: String
    var id: Int
    
}

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getFruitTypes()
        
        // Do any additional setup after loading the view.
    }


}
func getFruitTypes(){
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "fruityvice.com"
    urlComponents.path = "/api/fruit/all"
    
    let urlSession = URLSession.shared
    let urlRequest = URLRequest(url: urlComponents.url!)
    
    
//    let task = urlSession.dataTask(with: urlRequest) { ( data: Data?, response: URLResponse?, error: Error? ) in
        
        
    let task = urlSession.dataTask(with: urlRequest) { ( data: Data?, response: URLResponse?, error: Error?) in

        do{
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode([FruitType].self, from: data!)
            print(response)
        }
        catch {
            print("Erorr fetching the data : \(error)")
        }
}
    task.resume()
}
