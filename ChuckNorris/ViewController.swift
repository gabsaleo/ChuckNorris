//
//  ViewController.swift
//  ChuckNorris
//
//  Created by Gabriella Messias Aleo on 06/11/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selecionado = ""
    
    
    @IBAction func randomJoke(_ sender: Any) {
        showMessageJoke()
    }
    
    @IBOutlet weak var showJoke: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMessageJoke()
    }
    func showMessageJoke(){
        let urlString = "https://api.chucknorris.io/jokes/random?category=\(selecionado)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return }
                let piada = Classe(json: json)
                DispatchQueue.main.async {
                    self.showJoke.text = piada.value
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }


}

