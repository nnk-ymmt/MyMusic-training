//
//  ViewController.swift
//  MyMusic
//
//  Created by 山本ののか on 2020/04/11.
//  Copyright © 2020 NonokaYamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    //シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()

    @IBAction func cymbal(_ sender: Any) {
//        do {
//            //シンバル用のプレイヤーに、音源ファイル名を指定
//            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
//            //シンバルの音源再生
//            cymbalPlayer.play()
//        } catch {
//            print("シンバルで、エラーが発生しました！")
//        }
        
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
    //ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    @IBAction func guitar(_ sender: Any) {
//        do {
//            //ギター用のプレイヤーに、音源ファイル名を指定
//            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
//            //ギターの音源再生
//            guitarPlayer.play()
//            } catch {
//                print("ギターで、エラーが発生しました！")
//        }
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any) {
//        do {
//            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
//
//            backmusicPlayer.numberOfLoops = -1
//            backmusicPlayer.play()
//        } catch {
//            print("エラーが発生しました")
//        }
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    
    @IBAction func stop(_ sender: Any) {
        backmusicPlayer.stop()
    }
    
    //共通のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int) {
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました")
        }
    }
}

