//
//  QuoteTableViewController.swift
//  BreakingBadQuote
//
//  Created by Иван Гришин on 30.09.2021.
//

import UIKit

class QuoteTableViewController: UITableViewController {
    
    private var quotes: [Quote] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "polka", for: indexPath) as! QuotesCell

        let quoteArray = quotes[indexPath.row]
        cell.configure(with: quoteArray)

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuotesCell
//        let quoteArray = quotes[indexPath.row]
//        cell.configure(with: quoteArray)
//        return cell
//    }
    
    
}

extension QuoteTableViewController {
    func fetchQuotes() {
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "Its OK")
                return
            }
            print(response)
            
            do {
                self.quotes = try JSONDecoder().decode([Quote].self, from: data)
                print(error?.localizedDescription ?? "\(self.quotes.count)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
