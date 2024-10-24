//
//  ExampleCoreDataViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 24/10/24.
//

import UIKit
import CoreData

class ExampleCoreDataViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Tasks] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setup()
            fetchData() // Memanggil fungsi untuk mengambil data dari Core Data
        }
        
        // Mengatur table view dan action button
        func setup() {
            let nib = UINib(nibName: "ExampleCoreDataTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "ExampleCoreDataTableViewCell")
            
            tableView.delegate = self
            tableView.dataSource = self
            
            // Tambahkan aksi ke addButton
            addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        }
        
        // Fungsi untuk mengambil data dari Core Data
        func fetchData() {
            self.tasks = CoreDataManager.shared.fetchTasks()
        }
        
        // Fungsi untuk menampilkan alert saat addButton ditekan
        @objc func addButtonTapped() {
            let alertController = UIAlertController(title: "New Pasta Order", message: "Enter the name of the pasta order", preferredStyle: .alert)
            
            // Menambahkan TextField ke dalam alert
            alertController.addTextField { textField in
                textField.placeholder = "Enter pasta name"
            }
            
            // Menambahkan tombol "Save"
            let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                guard let name = alertController.textFields?.first?.text, !name.isEmpty else {
                    return
                }
                
                CoreDataManager.shared.addTask(title: name)
                self.fetchData()
                self.tableView.reloadData() // Refresh table view

            }
            
            // Menambahkan tombol "Cancel"
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            // Menampilkan alert
            present(alertController, animated: true, completion: nil)
        }
        
    }

    extension ExampleCoreDataViewController: UITableViewDelegate, UITableViewDataSource {
        // Mengatur jumlah baris pada tabel sesuai dengan data yang diambil
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
        }
        
        // Menampilkan data di setiap cell
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCoreDataTableViewCell", for: indexPath) as? ExampleCoreDataTableViewCell else {
                return UITableViewCell()
            }
            
            let task = tasks[indexPath.row]
            cell.nameLabel?.text = task.title // Atur nama pesanan pasta di label
            cell.checkButton.setTitle(task.isCompleted ? "✅" : "⬜️", for: .normal)
                     cell.toggleCompletion = {
                         CoreDataManager.shared.toggleTaskCompletion(task: task)
                         self.tableView.reloadRows(at: [indexPath], with: .automatic)
                     }
            
            return cell
        }
    }
