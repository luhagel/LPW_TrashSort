//
//  ViewController.swift
//  LN_TrashSort
//
//  Created by Luca Hagel on 6/24/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    
    
    @IBOutlet weak var trashnameTextField: UITextField!
    @IBOutlet weak var trashtypePicker: UIPickerView!
    
    @IBAction func trashItButtonClick(sender: UIButton) {
        
        if trashnameTextField.text !=  nil{
        
            trashIt()
        
        } else {
        
            print("Empty")
        
        }
        
       
    
    }
    
    
    var compost = [String]()
    var recycle = [String]()
    var general = [String]()
    var pickerDataSource = ["Compost", "Recycle", "General"]
    var selectedTrashType:String = "compost"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.trashtypePicker.dataSource = self;
        self.trashtypePicker.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Functions
    
    func trashIt(){
    
        if let trashName = trashnameTextField.text {
            switch selectedTrashType {
                case "compost":
                    compost.append(trashName)
                    print(compost)
                case "recycle":
                    recycle.append(trashName)
                    print(recycle)
                case "general":
                    general.append(trashName)
                    print(general)
            default:
                return
            }
            
            trashnameTextField.text = ""
        }
    
    }
    
    //MARK: Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.selectedTrashType = "compost"
        }
        else if(row == 1)
        {
            self.selectedTrashType = "recycle"
        }
        else
        {
            self.selectedTrashType = "general"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! DisplayTrashTableViewController
        destination.allTrash = [compost, recycle, general]
        
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        return
    }


}

