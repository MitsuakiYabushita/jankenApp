//
//  MaruButton.swift
//  janken
//
//  Created by mitsuaki yabushita on 2022/07/14.
//

import UIKit

class MaruButton: UIButton {
    
    private let shadowOffset: CGFloat = 3 // 影のずれの大きさ
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.layer.cornerRadius = 70
        addShadow(self.shadowOffset)
    }
    
    private func addShadow(_ shadowOffset: CGFloat) {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffset, height: shadowOffset)
    }
}

extension MaruButton {
    // MARK: - Button Tap Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // ボタンが押されたとき
        pressedButtonAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        // ボタンが押され終えたとき
        releasedButtonAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        // ボタンのタップがキャンセルされたとき
        releasedButtonAnimation()
    }
    
    // MARK: - Animation Method
    private func pressedButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            // 影のずれの分だけ、自分の位置を下げる
            self.transform = CGAffineTransform(translationX: self.shadowOffset, y: self.shadowOffset)
        }
        // 影を消す
        self.addShadow(0)
    }
    
    private func releasedButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) {
            // 自分の位置をもとに戻す
            self.transform = CGAffineTransform.identity
        }
        // 影を元通りにする
        self.addShadow(self.shadowOffset)
    }
}

