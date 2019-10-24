//
//  SentMemesTableViewController.swift
//  MemeMe v1
//
//  Created by iBot on 6/3/19.
//  Copyright © 2019 iBot. All rights reserved.
//

import UIKit

private let identifier = "sentMeme"

class SentMemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes: [Meme]!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyMessageLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        if memes?.count == 0 {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = true
            tableView.backgroundColor = UIColor.lightGray
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = false
            tableView.backgroundColor = UIColor.white
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = memes?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell?.imageView?.image = memes[indexPath.row].origirnalImage
        cell?.textLabel?.text = memes[indexPath.row].top + "..." + memes[indexPath.row].bottom
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeViewerViewController = storyboard?.instantiateViewController(withIdentifier: "memeViewer") as! MemeViewerViewController
        memeViewerViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeViewerViewController, animated: true)
    }

    @IBAction func showMemeEditor(_ sender: Any) {
        let memeEditor = storyboard?.instantiateViewController(withIdentifier: "memeEditor") as! MemeEditorViewController
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(memeEditor, animated: true)
    }
}
