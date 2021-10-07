//
//  TrackCell.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 06.10.2021.
//

import UIKit

protocol TrackCellViewModel {
    var iconURLString: String? { get }
    var artistName: String { get }
    var trackName: String { get }
    var albumName: String? { get }
}

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: TrackCellViewModel) {
        
        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        albumNameLabel.text = viewModel.albumName
        
        let url = URL(string: viewModel.iconURLString ?? "")
        let data = try? Data(contentsOf: url!)
            trackImageView.image = UIImage(data: data!) ?? UIImage()
        
    }
    
}
