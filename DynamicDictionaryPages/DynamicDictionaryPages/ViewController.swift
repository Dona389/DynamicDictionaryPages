//
//  ViewController.swift
//  DynamicDictionaryPages
//
//  Created by Dona Thomas on 07/07/20.
//  Copyright © 2020 Dona Thomas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var InfoDisplayTableView: UITableView!
    
    var keys: Array<AnyHashable> = []
    var viewID : Int = 0
    var viewKey : String = ""
    var infoObj: [AnyHashable: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if viewID == 0 {
            title = "Continents"
           infoObj = DictionaryInputModel.inputDictionary
        }else{
            title = viewKey
        }
   
        if(infoObj.count > 0){
            keys = Array<AnyHashable>(((infoObj)).keys)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    //MARK:- Tableview delegate and datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: InfoDetailTableViewCell.reuseIdentifier, for: indexPath) as? InfoDetailTableViewCell)!
        cell.lblTitle.text = keys[indexPath.row] as? String ?? ""
    
        let dictElement = infoObj[keys[indexPath.row]]
        
        if isMoreElementParsingAvailable(element: dictElement) {
            cell.lblTitle.text = transformType(item: keys[indexPath.row])
            cell.accessoryType = .disclosureIndicator
        }else{
            if(dictElement is Array<Any>){
                    cell.lblTitle.text = "\(keys[indexPath.row] as? String ?? "")"
            }else{
                    cell.lblTitle.text = "\(keys[indexPath.row] as? String ?? "") \(dictElement ?? "")"
            }
            cell.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            }
            return cell
        }
        
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath) as! InfoDetailTableViewCell
        currentCell.selectionStyle = .none
        
        navigateToNextScreen(key: keys[indexPath.row])
    }
    
    func isMoreElementParsingAvailable(element: Any?) -> Bool {
        if element is Dictionary<AnyHashable, Any> || (element is Array<Any> && ((element as? Array<Any> ?? []).count > 0))
        {
            return true
        }else{
           return false
        }
    }
    
    func navigateToNextScreen(key : AnyHashable)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Viewcontroller") as! ViewController
        viewController.viewID += 1
        viewController.viewKey = transformType(item: key)
        if(self.infoObj[key] is [AnyHashable : Any] && self.infoObj.count > 0){
            viewController.infoObj = self.infoObj[key] as? [AnyHashable : Any] ?? [:]
        }else{
            if(self.infoObj.count > 0){
                viewController.keys = self.infoObj[key] as? Array<AnyHashable> ?? []
            }else{
                viewController.keys = []
            }
        }
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    func transformType<T>(item:T) -> String
    {
        var convertedString = ""
        
        switch item.self
        {
        case is String:
            convertedString = "\(item)"
        case is NSNumber:
            convertedString = "\(Int((item as! Int)))"
        default:
            convertedString = ""
        }
        return convertedString
    }
    
}

