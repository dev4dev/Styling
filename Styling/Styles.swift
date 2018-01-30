//
//  Styles.swift
//  Styling
//
//  Created by Alex Antonyuk on 1/30/18.
//  Copyright © 2018 Alex Antonyuk. All rights reserved.
//

import UIKit

struct Style<Klass: UIView> {
    private let style: (Klass) -> Void
    init(_ style: @escaping (Klass) -> Void) {
        self.style = style
    }

    func apply(to view: Klass) {
        style(view)
    }
}

protocol Styled {

}

extension Styled where Self: UIView {
    func apply(style: Style<Self>) {
        style.apply(to: self)
    }
}

enum Styles {
    static let header1Label = Style<UILabel> { label in
        label.backgroundColor = .green
        label.textColor = .red
        label.font = .systemFont(ofSize: 70)
    }

    static let header2Label = Style<UILabel> { label in
        label.textColor = UIColor.darkText
        label.font = UIFont(name: "GillSans-SemiBold", size: 24)
    }

    static let ctaButton = Style<UIButton> { button in
        button.backgroundColor = .green
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 70)
    }
}

extension UIView: Styled {}
