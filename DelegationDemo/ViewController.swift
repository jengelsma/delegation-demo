//
//  ViewController.swift
//  DelegationDemo
//
//  Created by Jonathan Engelsma on 2/11/21.
//

import UIKit

class ViewController: UIViewController, ViceSelectionViewControllerDelegate {
    
    var vice = "Steak"

    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func indicateSelection(vice: String) {
        self.vice = vice
        self.message.text = "Your vice is: \(vice)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseVice" {
            if let dest = segue.destination as? ViceSelectionViewController {
                dest.delegate = self
                dest.selection = self.vice
            }
        }
    }


}

