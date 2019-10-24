//
//  MemeViewerViewController.swift
//  MemeMe v1
//
//  Created by iBot on 6/3/19.
//  Copyright © 2019 iBot. All rights reserved.
//

import UIKit

class MemeViewerViewController: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    var meme : Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sent Memes", style: .plain, target: self, action: #selector(goBackToSentMemes))
    }
    
    @objc func goBackToSentMemes() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memeImage.image = meme.memedImage
    }
}
