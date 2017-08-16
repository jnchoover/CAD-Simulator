//
//  MesaViewController.swift
//  CAD Simulator
//
//  Created by Jennifer Hoover on 2/22/17.
//  Copyright © 2017 Jennifer Carlson. All rights reserved.
//

import UIKit

class MesaViewController: UIViewController,UITableViewDataSource{
    @IBOutlet weak var mesatable: UITableView!
    var data:[String] = ["Incident Number","Incident Nature Code","Incident Nature Description", "Dispatch Street","Disbatch Location Info"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
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
