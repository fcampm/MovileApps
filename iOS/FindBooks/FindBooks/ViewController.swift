//
//  ViewController.swift
//  FindBooks
//
//  Created by Fabián Camp Mussa on 4/11/19.
//  Copyright © 2019 Fabián Camp Mussa. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tfIsbnCode: UITextField!
    var isbnCode = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func passInformation(_ sender: Any) {
        self.isbnCode = tfIsbnCode.text!
        performSegue(withIdentifier: "transferData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! FindBookVCViewController
        vc.isbnToSearch = self.isbnCode
    }
}

