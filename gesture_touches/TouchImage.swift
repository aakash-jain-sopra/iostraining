//
//  TouchImage.swift
//  gesture_touches
//
//  Created by Aakash Jain on 12/04/21.
//

import UIKit

class TouchImage: UIImageView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("began touch");
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch ended")
    }
    
}
