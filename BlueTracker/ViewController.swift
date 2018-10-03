//
//  ViewController.swift
//  BlueTracker
//
//  Created by Junghoon Lee on 10/2/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var centralManager : CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

    
    @IBAction func refreshTapped(_ sender: Any) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else { return }
        
        print("Peripheral Name: \(name)")
        print("Peripheral UUID: \(peripheral.identifier.uuidString)")
        print("Peripheral RSSI: \(RSSI)")
        print("Ad Data: \(advertisementData)")
        print("********************************")
        
    }
    
    
    // CBCentralManager Code
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
        } else {
            let alertVC = UIAlertController(title: "Bluetooth is not working", message: "Make sure the bluetooth is on", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                alertVC.dismiss(animated: true, completion: nil)
            }
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    
    // TableView Code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1_000
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "blueCell", for: indexPath) as? BlueTableViewCell {
            cell.nameLabel.text = "This is a test"
            cell.rssiLabel.text = "RSSI: -28"
            return cell
        }
        
        return UITableViewCell()
    }
}

