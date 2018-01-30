//
//  ViewController.swift
//  Styling
//
//  Created by Alex Antonyuk on 1/30/18.
//  Copyright © 2018 Alex Antonyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button1: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        print(UIFont.fontNames(forFamilyName: "Gill Sans"))

        label1.apply(style: Styles.header1Label)
        label2.apply(style: Styles.header2Label)
        button1.apply(style: Styles.ctaButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

