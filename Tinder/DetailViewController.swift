//
//  DetailViewController.swift
//  Tinder
//
//  Created by Emily Garcia on 4/1/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var navBar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        navBar.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
        cardImageView.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
