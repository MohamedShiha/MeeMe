//
//  SentMemesCollectionViewController.swift
//  MemeMe v2
//
//  Created by iBot on 6/3/19.
//  Copyright © 2019 iBot. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sentMeme"

class SentMemesCollectionViewController: UICollectionViewController {

    var memes : [Meme]!
    @IBOutlet var memesGrid: UICollectionView!
    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space : CGFloat = 3.0
        let widthDimension = (view.frame.width - (2 * space)) / 3.0
        let heightDimension = (view.frame.height - (2 * space)) / 6.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        if memes?.count == 0 {
            collectionView?.backgroundColor = UIColor.lightGray
        } else {
            collectionView?.backgroundColor = UIColor.white
        }
        memesGrid.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = memes?.count {
            return count
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.row]
        cell.memeImage?.image = meme.origirnalImage
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
