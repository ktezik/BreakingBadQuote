//
//  QuotesCell.swift
//  BreakingBadQuote
//
//  Created by Иван Гришин on 01.10.2021.
//

import UIKit

class QuotesCell: UITableViewCell {
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var seriesLabel: UILabel!
    
    
    
    func configure(with quoteArray: Quote) {
        guard let quoteArrayAuthor = quoteArray.author else { return }
        guard let quoteArraySeries = quoteArray.series else { return }
        quoteLabel.text = quoteArray.quote
        authorLabel.text = "Автор: \(quoteArrayAuthor)"
        seriesLabel.text = "Серия: \(quoteArraySeries)"
    }
    
}
