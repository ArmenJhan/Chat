//
//  GradientView.swift
//  Chat
//
//  Created by Armen Madoyan on 13.03.2023.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    private var startColor: UIColor? {
        didSet {
            setupGradientColors(startColor: startColor, endColor: endColor)
        }
    }
    
   private var endColor: UIColor? {
        didSet {
            setupGradientColors(startColor: startColor, endColor: endColor)
        }
    }
    
    enum Point {
        case topLeading, leading, bottomLeading, top, center, bottom, topTrailing, trailing, bottomTrailing
        
        var point: CGPoint {
            switch self {
            case .topLeading: return CGPoint(x: 0, y: 0)
            case .leading: return CGPoint(x: 0, y: 0.5)
            case .bottomLeading: return CGPoint(x: 0, y: 1.0)
            case .top:  return CGPoint(x: 0.5, y: 0)
            case .center: return CGPoint(x: 0.5, y: 0.5)
            case .bottom: return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing: return CGPoint(x: 1.0, y: 0.0)
            case .trailing: return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing: return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    convenience init(startPoint: Point, endPoint: Point, startColor: UIColor, endColor: UIColor) {
        self.init()
        setupGradient(from: startPoint, to: endPoint, startColor: startColor, endColor: endColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient(from: .leading, to: .trailing, startColor: startColor, endColor: endColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradientColors(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
    private func setupGradient(from startPoint: Point, to endPoint: Point, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
    }
    
}
