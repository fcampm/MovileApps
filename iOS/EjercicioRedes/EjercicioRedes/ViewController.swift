//
//  ViewController.swift
//  EjercicioRedes
//
//  Created by Fabián Camp Mussa on 4/10/19.
//  Copyright © 2019 Fabián Camp Mussa. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var tvTexto: UITextView!
    @IBOutlet weak var imgFoto: UIImageView!
    
    
    @IBAction func descargarTexto(_ sender: Any)
    {
        let direction = "https://norvig.com/big.txt"
        let url = URL(string: direction)!
        let tarea = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            if(error == nil)
            {
                // normal
                let respuesta = response as! HTTPURLResponse
                if (respuesta.statusCode == 200)
                {
                    self.procesarDatos(datos: data!)
                }
            }
            else {
                // error
                print("Error... \(error!.localizedDescription)")
            }
        }
        tarea.resume()
    }
    
    func procesarDatos(datos: Data)
    {
        let cadena = String(data: datos, encoding: .utf8)
        DispatchQueue.main.async
        {
            self.tvTexto.text = cadena
        }
    }
    
    @IBAction func descargarImagen(_ sender: Any)
    {
        let direction = "https://www.ajegroup.com/wp-content/uploads/2014/05/BIG.jpg"
        let url = URL(string: direction)!
        let tarea = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            if(error == nil)
            {
                // normal
                let respuesta = response as! HTTPURLResponse
                if (respuesta.statusCode == 200)
                {
                    self.mostrarImagen(data!)
                }
            }
            else {
                // error
                print("Error... \(error!.localizedDescription)")
            }
        }
        tarea.resume()
    }
    
    func mostrarImagen(_ datos: Data){
        let imgDescargada = UIImage(data: datos)
        DispatchQueue.main.async
        {
            self.imgFoto.image = imgDescargada
        }
    }
    
    @IBAction func descargarJSON(_ sender: Any)
    {
        if let url = URL(string: "https://api.tronalddump.io/search/quote?query=obama")
        {
            let tarea = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if (error == nil)
                {
                    let respuesta = response as! HTTPURLResponse
                    if (respuesta.statusCode == 200)
                    {
                        self.procesarJSON(data!)
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
    
    func procesarJSON(_ datos: Data)
    {
        if let dJson = try? JSONSerialization.jsonObject(with: datos, options: .mutableContainers) as! [String: Any]
        {
            let dDatos = dJson["_embedded"]! as! [String: Any]
            let arrNotas = dDatos["quotes"]! as! [[String: Any]]
            DispatchQueue.main.async
            {
                self.tvTexto.text = ""
                var strNotas = ""
                for notas in arrNotas
                {
                    strNotas.append("\n-")
                    strNotas.append(notas["value"]! as! String)
                    strNotas.append("\n")
                }
                self.tvTexto.text = strNotas
            }
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
}

