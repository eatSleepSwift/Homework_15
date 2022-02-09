//
//  ViewController.swift
//  Homework_15
//
//  Created by Artsiom Kanashkou on 6.02.22.
// Вертикальный список картинок (в скроллвью) по тапу на картинку открывается новый вьюконтроллер с полноразмерным изображением.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    let images = ["image-1", "image-2", "image-3", "image-4", "image-5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for (idx, item) in images.enumerated() {
            let imageView = UIImageView(image: UIImage(named: item))
            guard let image = UIImage(named: item) else { return }
            imageView.tag = idx
            imageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
            
            let imageHeight = image.size.height
            let imageWidth = image.size.width
            let scrollViewWidth = scrollView.frame.width
            let imageViewHeight = (imageHeight * scrollViewWidth) / imageWidth
            
            if idx > 0 {
                let prevView = contentView.subviews[idx - 1]
                imageView.topAnchor.constraint(equalTo: prevView.bottomAnchor, constant: 10).isActive = true
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
            } else {
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
            }
            
            if idx == images.count - 1 {
                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        guard let imageVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController else {
            return
        }
        
        let location = sender.location(in: contentView)
        for subview in contentView.subviews {
            guard let imageView = subview as? UIImageView else { continue }
            
            if imageView.frame.contains(location) {
                imageVC.imageName = images[imageView.tag]
            }
        }
        navigationController?.pushViewController(imageVC, animated: true)
    }
    
}

