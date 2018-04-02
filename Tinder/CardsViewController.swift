//
//  ViewController.swift
//  Tinder
//
//  Created by Emily Garcia on 3/14/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var actionButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanCard(_:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        cardImageView.isUserInteractionEnabled = true
        cardImageView.layer.cornerRadius = 10
        cardImageView.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        if (sender.state == .began){
            let didTranslate = sender.translation(in: view)
            cardInitialCenter = cardImageView.center
            print(cardInitialCenter)
        }
        else if (sender.state == .changed){
            if (translation.x > 0 && !(translation.x > 50)){
                cardImageView.transform = CGAffineTransform(translationX: translation.x, y: 0)
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 360))
            }
            else if (translation.x < 0 && !(translation.x < -50)){
                cardImageView.transform = CGAffineTransform(translationX: translation.x, y: 0)
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 360))
            }
            else {
                if (translation.x != 0){
                    UIView.animate(withDuration: 0.5, animations: {
                        self.cardImageView.isHidden = true
                    })
                }
            }
        }
        else if (sender.state == .ended){
            cardImageView.transform = CGAffineTransform.identity
        }
        
    }
    
    @IBAction func didTap(_ sender: Any) {
        self.performSegue(withIdentifier: "detailSegue", sender: nil)
    }

}

