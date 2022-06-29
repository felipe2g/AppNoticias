//
//  ViewController.swift
//  AppNoticias
//
//  Created by Felipe Augusto Guimaraes Gomes Sousa on 08/06/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var resultNews: [NewsData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getNews{ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                for item in response {
                    if let imageURL = item.media.first?.mediaMetadata.last?.url {
                        let data = NewsData(title: item.title, byline: item.byline, image: imageURL, url: item.url)
                        self.resultNews.append(data)
                    }
                }
                // É importante que o reload aconteça na main thread pois o reloadData recarrega o UI
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
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

