//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Juan Esteban Diaz Montejo on 24/11/17.
//  Copyright © 2017 Juan Esteban Diaz Montejo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    
    @IBOutlet weak var ISBNField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callService(isbnBook:NSString) -> NSString{
        let paht = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+(isbnBook as String)
        let url = NSURL(string:paht)
        let datos:NSData? = NSData(contentsOf: url! as URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        return texto!
    }
    
    @IBAction func searchBook(_ sender: Any) {
        let result = callService(isbnBook: ISBNField.text! as NSString)
        textView.text = result as String!
    }
    
    @IBAction func cleanISBN(_ sender: Any) {
        ISBNField.text = ""
    }
    
    @IBAction func searchKeyboard(_ sender: Any) {
        let result = callService(isbnBook: ISBNField.text! as NSString)
        textView.text = result as String!
    }
    
    
}

