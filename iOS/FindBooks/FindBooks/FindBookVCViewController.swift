//
//  FindBookVCViewController.swift
//  FindBooks
//
//  Created by Fabián Camp Mussa on 4/11/19.
//  Copyright © 2019 Fabián Camp Mussa. All rights reserved.
//

import UIKit

class FindBookVCViewController: UIViewController
{

    var isbnToSearch = ""
    
    
    
    func downloadJSON(){
        if let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbnToSearch)
        {
            let tarea = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if (error == nil)
                {
                    let respuesta = response as! HTTPURLResponse
                    if (respuesta.statusCode == 200)
                    {
                        self.processJSON(data!)
                    }
                    else
                    {
                        print("Error al descargar")
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func processJSON(_ data: Data)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
