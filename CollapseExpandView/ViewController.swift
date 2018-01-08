//
//  ViewController.swift
//  hghg
//
//  Created by sameh mohammed on 1/7/18.
//  Copyright © 2018 com.najeeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var lastView: UIView!
    
    
    @IBOutlet weak var expandBu: UIButton!
    
    var animationRunning:Bool!;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        animationRunning = false
        
        
    }
    
    @IBAction func expandClicked(_ sender: Any) {
        
        if(animationRunning)
        {
            return ;
        }
        
        
        animationRunning = true
        
        if(contentView.tag == 0)
        {
            for   con:NSLayoutConstraint in self.contentView.constraints
            {
                
                let er =  (con.secondItem) as! UIView
                
                if(  er == self.lastView && con.secondAttribute == NSLayoutAttribute.bottom)
                {
                    print("hjbcasjvcashjvcasjhvcxasjhcvxasjhcvsajcvhas")
                    self.contentView.removeConstraint(con)
                    
                    break
                }
                
            }
            
            let heightCon = NSLayoutConstraint.init(item: self.contentView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 0.0)
            
            self.contentView.addConstraint(heightCon)
            
            UIView.animate(withDuration: 1.0, animations: {
                
                self.view.layoutIfNeeded()
                
                
            }, completion: { (finished) in
                
                self.contentView.tag = 1
                
                self.animationRunning = false
                
                self.expandBu.setTitle("Expand", for: .normal)
                
            })
            
            
        }
        else
        {
            
            for   con:NSLayoutConstraint in self.contentView.constraints
            {
                if(con.firstAttribute == NSLayoutAttribute.height)
                {
                    self.contentView.removeConstraint(con)
                }
                
            }
            
            
            let heightCon = NSLayoutConstraint.init(item: self.contentView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.lastView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 20.0)
            
            self.contentView.addConstraint(heightCon)
            
            UIView.animate(withDuration: 1.0, animations: {
                
                self.view.layoutIfNeeded()
                
                
            }, completion: { (finished) in
                
                self.contentView.tag = 0
                self.animationRunning = false
                self.expandBu.setTitle("Collapse", for: .normal)
            })
            
            
        }
    }
    
    
    func animatedHideView(hidden:Bool,completion: @escaping (_ success:Bool) -> Void){
        UIView.animate(withDuration: 1.0, animations: {
            
            if(hidden)
            {
                self.view.backgroundColor = UIColor.red
            }
            else
            {
                self.view.backgroundColor = UIColor.blue
            }
            
        } ) { (finished) in
            
            completion(true)
            
        }
    }
    
    func slideY(y:CGFloat,completion: @escaping (_ success:Bool) -> Void)
        
    {
        UIView.animate(withDuration: 1.0, animations: {
            
            self.view.backgroundColor = UIColor.green
            
            
        } ) { (finished) in
            
            completion(true)
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

