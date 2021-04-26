//
//  ViewController.swift
//  NSUrlSession
//
//  Created by Aakash Jain on 16/04/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var urlSession: URLSession?
    
    var feed: Feed? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedItemCellId", for: indexPath) as! ImageTitleTableViewCell
        cell.lblView.text = feed?.items[indexPath.row].title
        
        //download and show image.
        let req = URLRequest(url: (feed?.items[indexPath.row].imageUrl)!)
        cell.dataTask = self.urlSession?.dataTask(with: req, completionHandler: {(data, resp, error) -> Void in
            
            OperationQueue.main.addOperation {
                if (error == nil && data != nil) {
                    let image = UIImage(data: data!)
                    cell.imageView?.image = image
                }
            }
        })
        
        cell.dataTask?.resume()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = cell as! ImageTitleTableViewCell
        
        row.dataTask?.cancel()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = URLSessionConfiguration.default
        
        self.urlSession = URLSession(configuration: configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.urlSession?.invalidateAndCancel()
        self.urlSession = nil
    }


}

