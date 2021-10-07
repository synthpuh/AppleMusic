//
//  TrackDetailView.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 07.10.2021.
//

import UIKit
import AVKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let player: AVPlayer = {
        
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
        
    }()
    
    var trackUrlString: String?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: SearchViewModel.Cell) {
        
        let bigIconString = viewModel.iconURLString?.replacingOccurrences(of: "100x100", with: "600x600") ?? ""
        guard let url = URL(string: bigIconString) else { return }
        let data = try? Data(contentsOf: url)
        trackImageView.image = UIImage(data: data!) ?? UIImage()
        
        trackLabel.text = viewModel.trackName
        artistLabel.text = viewModel.artistName
        
        trackUrlString = viewModel.musicPreviewUrl
        
    }
    
    private func playMusic(from urlString: String?) {
        
        guard let url = URL(string: urlString ?? "") else { return }
        
        let playerItem = AVPlayerItem(url: url)
        
        player.replaceCurrentItem(with: playerItem)
        player.play()
                
    }
    
    @IBAction func downButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func timeChanged(_ sender: UISlider) {
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        if player.timeControlStatus == .paused {
            playMusic(from: trackUrlString)
            playButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        } else {
            player.pause()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @IBAction func previousTrackTapped(_ sender: UIButton) {
    }
    
    @IBAction func nextTrackTapped(_ sender: UIButton) {
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
    }
}
