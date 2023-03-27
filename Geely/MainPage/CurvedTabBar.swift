//
//  CurvedTabBar.swift
//  Geely
//
//  Created by Abd Qasem on 22/03/2023.
//
import UIKit

@IBDesignable
class CurvedTabBar: UITabBar {

    private var shapeLayer: CALayer?

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = dropShadow.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    func createPath() -> CGPath {

        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))

        
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 25), y: 0), controlPoint2: CGPoint(x: centerWidth - 30, y: height))
      
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 30, y: height), controlPoint2: CGPoint(x: (centerWidth + 25), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }

    

    @IBInspectable var height: CGFloat = 50

       override func sizeThatFits(_ size: CGSize) -> CGSize {
           var sizeThatFits = super.sizeThatFits(size)
           if height > 0.0 {
               sizeThatFits.height = height
           }
           return sizeThatFits
       }
    
}




