//
//  ViewController.swift
//  BreakingBadQuote
//
//  Created by Иван Гришин on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quotesSegue" {
            guard let quotesVC = segue.destination as? QuoteTableViewController else { return }
            quotesVC.fetchQuotes()
        }
    }
    
    private func fetchImage() {
        guard let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Breaking_Bad_logo.svg/2560px-Breaking_Bad_logo.svg.png") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Its ok")
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }.resume()
        
    }
}
