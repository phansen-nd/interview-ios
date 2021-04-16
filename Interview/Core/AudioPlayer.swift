//
//  Player.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import MediaPlayer

class AudioPlayer {
    var player: AVPlayer?
    func play(url: URL) {
        player?.pause()
        player = AVPlayer(url: url)
        player?.play()
    }

    func pause() {
        player?.pause()
    }
}
