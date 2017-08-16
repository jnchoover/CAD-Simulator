//
//  PHXViewController.swift
//  CAD Simulator
//
//  Created by Jennifer Hoover on 2/22/17.
//  Copyright © 2017 Jennifer Carlson. All rights reserved.
//

import UIKit

class PHXViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var phxtable: UITableView!
    var data:[String] = ["Incident Number","Incident Nature Code","Incident Nature Description", "Dispatch Street","Disbatch Location Info"]
    var file:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        file = docDir[0].appending("notes.txt")
        
        load()
        
    }
    func addNote() {
        let name:String = "Row \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row:0, section: 0)
        phxtable.insertRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func save() {
        
        //UserDefaults.standard.set(data, forKey: "notes")
        //UserDefaults.standard.synchronize()
        
        let newData:NSArray = NSArray(array:data)
        newData.write(toFile:file, atomically: true)
    }
    
    func load() {
        if let loadedData = NSArray(contentsOfFile:file) as? [String] {
            data = loadedData
        }
        phxtable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
