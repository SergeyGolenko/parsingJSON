//
//  ViewController.swift
//  ParseJSON(practice swiftBook)
//
//  Created by Сергей Голенко on 13.11.2020.
//  Copyright © 2020 Сергей Голенко. All rights reserved.
//

import UIKit



struct ThreeCitiesWeather: Decodable {
    
    var minsk: City?
    var madrid: City?
    var riga: City?
    
}

struct City: Decodable {
    var temperature: String
    var weather: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let urlString = "http://swiftbook.ru/json/JSONdata_swift4.json"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return} //проверяю data на nil
            guard error == nil else {return} //если есть ошибка то прекращаю работу
            
            do{
                let threeCitiesWeather = try JSONDecoder().decode(ThreeCitiesWeather.self, from: data)
                print(threeCitiesWeather)
            } catch let error {}
             print(error)
            
            
        }
    .resume()
        
  
    }


}

