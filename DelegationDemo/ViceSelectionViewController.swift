//
//  ViceSelectionViewController.swift
//  DelegationDemo
//
//  Created by Jonathan Engelsma on 2/11/21.
//

import UIKit

protocol ViceSelectionViewControllerDelegate {
    func indicateSelection(vice: String)
}

class ViceSelectionViewController: UIViewController {
    var pickerData: [String] = [String]()
    var selection : String = "Steak"
    var delegate : ViceSelectionViewControllerDelegate?


    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerData = ["Steak", "Ice Cream", "Beer", "Omlettes"]
        picker.delegate = self
        picker.dataSource = self
        
        if let index = pickerData.firstIndex(of: self.selection) {
            self.picker.selectRow(index, inComponent:0, animated:true)
        } else {
            self.picker.selectRow(0, inComponent: 0, animated: true)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.indicateSelection(vice: selection)
        }
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

extension ViceSelectionViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }

    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selection = self.pickerData[row]
    }
}
