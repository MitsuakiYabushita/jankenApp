//
//  ViewController.swift
//  janken
//
//  Created by mitsuaki yabushita on 2022/06/22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var guButton: MaruButton!
    @IBOutlet weak var paButton: MaruButton!
    @IBOutlet weak var chokiButton: MaruButton!
    
    @IBOutlet private weak var jankenImage: UIImageView!
    let imageName = ["sazae2", "sazae3", "sazae4"]
    //info dataをつけるといい　３文字以上
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    var cpuNum: Int = 0
    var playerNum: Int = 0
    
    private func reset() -> Int {
        let cpuHand = Int(arc4random_uniform(3))
        return cpuHand
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jankenImage.layer.cornerRadius = jankenImage.frame.size.width * 0.15
        
    }
    
    @IBAction func tapGu(_ sender: UIButton) {
        cpuNum = reset()
        playerNum = 0
        
        let name = imageName[cpuNum]
        jankenImage.image = UIImage(named: name)
        
        if cpuNum == 0 {
            resultLabel.text = "あいこです"
        } else if cpuNum == 1 {
            resultLabel.text = "勝ちです"
        } else {
            resultLabel.text = "負けです"
        }
    }
    
    @IBAction func tapChoki(_ sender: UIButton) {
        cpuNum = reset()
        playerNum = 1
        
        let name = imageName[cpuNum]
        jankenImage.image = UIImage(named: name)
        
        if cpuNum == 0 {
            resultLabel.text = "負けです"
        } else if cpuNum == 1 {
            resultLabel.text = "あいこです"
        } else {
            resultLabel.text = "勝ちです"
        }
    }
    
    @IBAction func tapPa(_ sender: UIButton) {
        cpuNum = reset()
        playerNum = 2
        
        let name = imageName[cpuNum]
        jankenImage.image = UIImage(named: name)
        
        if cpuNum == 0 {
            resultLabel.text = "勝ちです"
        } else if cpuNum == 1 {
            resultLabel.text = "負けです"
        } else {
            resultLabel.text = "あいこです"
        }
    }
}

