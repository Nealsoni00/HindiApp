//
//  DrawableView.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 8/10/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit

class DrawableView: UIView {
    
    var path = UIBezierPath()
    var previousPoint: CGPoint
    var lineWidth: CGFloat = 5.0
    
    override init(frame: CGRect) {
        previousPoint = CGPoint.zero
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        previousPoint = CGPoint.zero
        super.init(coder: aDecoder)!
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
        panGestureRecognizer.maximumNumberOfTouches = 1
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        UIColor.green.setStroke()
        path.stroke()
        path.lineWidth = lineWidth
    }
    func reset(){
        previousPoint = CGPoint.zero
        print("Resetting the drawingboard")
        path.removeAllPoints()
        self.setNeedsDisplay()
    }
    
    @objc func pan(panGestureRecognizer:UIPanGestureRecognizer)->Void {
        let currentPoint = panGestureRecognizer.location(in: self)
        let midPoint = self.midPoint(p0: previousPoint, p1: currentPoint)
        
        if panGestureRecognizer.state == .began {
            path.move(to: currentPoint)
        }
        else if panGestureRecognizer.state == .changed {
            path.addQuadCurve(to: midPoint,controlPoint: previousPoint)
        }
        
        previousPoint = currentPoint
        self.setNeedsDisplay()
    }
    
    func midPoint(p0:CGPoint,p1:CGPoint)->CGPoint {
        let x=(p0.x+p1.x)/2
        let y=(p0.y+p1.y)/2
        return CGPoint(x: x, y: y)
    }
}
