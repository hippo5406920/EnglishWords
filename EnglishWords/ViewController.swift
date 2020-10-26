//
//  ViewController.swift
//  EnglishWords
//
//  Created by CHEN on 2020/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let but = sender as! UIButton
        let controller = segue.destination as!
        EnglishViewController
        controller.alphabet = but.currentTitle!
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

