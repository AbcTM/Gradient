//
//  CircularProgressView.swift
//  test
//
//  Created by tm on 2018/7/7.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {
    struct Constant {
        static let lineWidth: CGFloat = 5
        static let trackColor = UIColor.clear
        //    static let progressColoar = UIColor(hexInt: 0x2fd037)
        static let progressColoar = UIColor.red
    }
    
    
    let progressLayer = CAShapeLayer()
    let path = UIBezierPath()
    
    @IBInspectable var progress: CGFloat = 0.5 {
        didSet {
             setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.addSublayer(lineShape)
    }
    
    let linePath = UIBezierPath()
    
    let lineShape = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        linePath.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.width/2 - Constant.lineWidth, startAngle: angleToRadian(-90), endAngle: angleToRadian(270), clockwise: true)

        lineShape.frame = bounds
        lineShape.lineWidth = 2
        lineShape.strokeColor = UIColor.red.cgColor
        lineShape.path = linePath.cgPath
        lineShape.fillColor = UIColor.clear.cgColor
        lineShape.strokeEnd = 0.8
        
        

    }
    
    fileprivate func angleToRadian(_ angle: CGFloat)->CGFloat {
        return CGFloat(angle/180.0*CGFloat.pi)
    }

}

