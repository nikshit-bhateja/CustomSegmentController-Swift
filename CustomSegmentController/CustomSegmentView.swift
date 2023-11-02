//
//  CustomSegmentView.swift
//  CustomSegmentController
//
//  Created by Nikk Bhateja on 02/11/23.
//

import Foundation
import UIKit

class CustomSegmentView: UIView {
    
    //MARK: - private variables
    private var buttonTitles: [String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    private var dividerView: UIView!
    
    //MARK: - Local Variables
    var textColor: UIColor = .gray
    var selectorTextColor: UIColor = .black
    var selectorViewColor: UIColor = .black
    
    //MARK: initializer
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.updateView()
    }
    
    private func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    //MARK: - config methods.
    private func configSegmentUI() {
        // Creating a horizontal stack for segment buttons.
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 0, y: self.frame.height + 10, width: self.frame.width, height: 50)
        
        // Adding stack to view.
        addSubview(stackView)
        
        // Constraints for stack.
        self.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        // Creating selector view for segment.
        // The view that is displayed as a bottom bar to default selected segment.
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 15,
                                            y: 110,
                                            width: selectorWidth * 0.8,
                                            height: 2))
        selectorView.backgroundColor = .black
        addSubview(selectorView)
    }
    
    //MARK: - segment buttons
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        for (buttonIndex, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            if button == sender {
                let selectorViewPosition = frame.width / CGFloat(self.buttonTitles.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorViewPosition + 10
                }
                button.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    //MARK: - update views
    private func updateView() {
        createButton()
        configSelectorView()
        configSegmentUI()
    }
    
    
}
