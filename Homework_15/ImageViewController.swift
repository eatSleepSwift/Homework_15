//
//  ImageViewController.swift
//  Homework_15
//
//  Created by Artsiom Kanashkou on 9.02.22.
//

import UIKit

class ImageViewController: UIViewController {
    var imageName = ""
    @IBOutlet weak var zoomScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: imageName) {
            let imageView = UIImageView(image: image)
            zoomScrollView.addSubview(imageView)
            zoomScrollView.contentSize = image.size
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
