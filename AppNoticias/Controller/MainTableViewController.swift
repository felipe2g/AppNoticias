//
//  ViewController.swift
//  AppNoticias
//
//  Created by Felipe Augusto Guimaraes Gomes Sousa on 08/06/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var resultNews: [ResultNews] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count => \(resultNews.count)")
        return resultNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewYorkTableViewCell
        
        let newsData = resultNews[indexPath.row]
        cell.prepare(with: newsData)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: resultNews[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}

