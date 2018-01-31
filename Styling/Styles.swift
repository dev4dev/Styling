//
//  Styles.swift
//  Styling
//
//  Created by Alex Antonyuk on 1/30/18.
//  Copyright © 2018 Alex Antonyuk. All rights reserved.
//

import UIKit

struct UIStyle<Type: UIView> {
    private let style: (Type) -> Void
    init(_ style: @escaping (Type) -> Void) {
        self.style = style
    }

    func apply(to view: Type) {
        style(view)
    }

    func combine(with style: UIStyle<Type>) -> UIStyle<Type> {
        return UIStyle<Type> { view in
            self.apply(to: view)
            style.apply(to: view)
        }
    }

    static func combine(_ styles: UIStyle<Type>...) -> UIStyle<Type> {
        return UIStyle<Type> { (view: Type) in
            for style in styles {
                style.apply(to: view)
            }
        }
    }
}

func + <Type>(lhs: UIStyle<Type>, rhs: UIStyle<Type>) -> UIStyle<Type> {
    return UIStyle.combine(lhs, rhs)
}


protocol Stylized { }

extension Stylized where Self: UIView {
    func apply(style: UIStyle<Self>) {
        style.apply(to: self)
    }
}

extension UIView: Stylized {}

enum Styles {
    static let header1Label = UIStyle<UILabel> { label in
        label.backgroundColor = .green
        label.textColor = .red
        label.font = .systemFont(ofSize: 70)
    }

    static let header2Label = UIStyle<UILabel> { label in
        label.textColor = UIColor.darkText
        label.font = UIFont(name: "GillSans-SemiBold", size: 24)
    }

    static let brownLabel = UIStyle<UILabel> { label in
        label.textColor = .brown
    }

    static let blueLabel = UIStyle<UILabel> { label in
        label.textColor = .blue
    }

    static let header2BlueLabel = Styles.header2Label + Styles.blueLabel

    static let ctaButton = UIStyle<UIButton> { button in
        button.backgroundColor = .green
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 70)
    }

    static func yellowBackground<Type: UIView>() -> UIStyle<Type> {
        return UIStyle<Type> { view in
            view.backgroundColor = .yellow
        }
    }
}
