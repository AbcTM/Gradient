//
//  ViewController.swift
//  test
//
//  Created by tm on 2018/7/7.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pview: CircularProgressView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = drawRadialGradient()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func drawRadialGradient() -> UIImage? {
//        let firstColor = UIColor.red.cgColor
//        let secondColor = UIColor.orange.cgColor
        
        //颜色分量的数组
        let colorComponents: [CGFloat] = [
            1, 0, 0, 1.00,//start color(r,g,b,alpha)
            255, 255, 255, 1.00,//end color
        ]
        
        let updatedSize = CGSize.init(width: 60, height: 60)
        
        // 色彩空间
        let rgbSpac = CGColorSpaceCreateDeviceRGB()
        // 渐变梯度
        let gradient = CGGradient.init(colorSpace: rgbSpac, colorComponents: colorComponents, locations: nil, count: 2) // count 位置的数量：这个参数指明了我们需要多少颜色和位置。
//        let gradient = CGGradient.init(colorsSpace: rgbSpac, colors: [firstColor, secondColor] as CFArray, locations: [0, 1])
        
        UIGraphicsBeginImageContextWithOptions(updatedSize, false, 0);
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        // 起点颜色起始圆心
        let startCenter: CGPoint = CGPoint.init(x: 30, y: 30)
        // 起始点颜色半径
        let startRadius: CGFloat = 0
        // 终点颜色起始圆心
        let endCenter: CGPoint = CGPoint.init(x: 30, y: 30)
        // 终点颜色半径
        let endRadius: CGFloat = 30
        
        // 放射状
        context.drawRadialGradient(gradient!, startCenter: startCenter, startRadius: startRadius, endCenter: endCenter, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        // 线状的
        context.drawLinearGradient(gradient!, start: startCenter, end: endCenter, options: CGGradientDrawingOptions())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
