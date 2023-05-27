//
//  ViewController.swift
//  masking_effect
//
//  Created by Mehedi Hasan on 5/26/23.
//

import UIKit

// variable
private let viewHeight: CGFloat = 80
private let yValue: CGFloat = 280
private var upperView: UIView = UIView.init() // upper view
private var lowerView: UIView = UIView.init() // lower view
private var circleView: UIView = UIView.init() // circle view
private var xStep: CGFloat = 5
private var indicatorShapeLayer: CAShapeLayer = CAShapeLayer() // shape layer

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // lower view
        lowerView = UIView.init(frame: CGRect(x: 0, y: yValue, width: self.view.frame.size.width, height: viewHeight))
        lowerView.backgroundColor = .green
        self.view.addSubview(lowerView)
        addXvalue(parentView: lowerView, color: .blue)
        
        // upper view
        upperView = UIView.init(frame: CGRect(x: 0, y: yValue, width: self.view.frame.size.width, height: viewHeight))
        upperView.backgroundColor = .purple
        self.view.addSubview(upperView)
        addXvalue(parentView: upperView, color: .white)
        
        // mask layer
        addMaskLayer(parentView: upperView)
    }
    
    //MARK: Button Action
    // forward button action
    @IBAction func forwardBtnAc(_ sender: UIButton) {
        xStep += 5
        updateBezierPath()   // update path
    }
    // backward button action
    @IBAction func backwardBtnAc(_ sender: UIButton) {
        xStep -= 5
        updateBezierPath()  // update path
    }
    //MARK: UI Design
    // update path
    private func updateBezierPath(){
        let modifyWidth: CGFloat = viewHeight - 10
        let roundPath = UIBezierPath.init(roundedRect: CGRect(x: xStep, y: 5, width: modifyWidth, height: modifyWidth), cornerRadius: viewHeight/2)
        indicatorShapeLayer.path = roundPath.cgPath
    }
    // circle
    private func circleViewAdd(){
        circleView = UIView.init(frame: CGRect(x: 120, y: yValue, width: viewHeight, height: viewHeight))
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = viewHeight/2
        circleView.layer.masksToBounds = true
        self.view.addSubview(circleView)
    }
    // add mask layer
    private func addMaskLayer(parentView: UIView) {
        // beizerpath
        let modifyWidth: CGFloat = viewHeight - 10
        let roundPath = UIBezierPath.init(roundedRect: CGRect(x: xStep, y: 5, width: modifyWidth, height: modifyWidth), cornerRadius: viewHeight/2)
        indicatorShapeLayer.fillColor = UIColor.yellow.cgColor
        indicatorShapeLayer.path = roundPath.cgPath
        parentView.layer.mask = indicatorShapeLayer
    }
    // add x value
    func addXvalue(parentView: UIView, color: UIColor){
        let totalCount: Int = 10
        var startXofLbl: CGFloat = 0
        let gapBetweenPoint: CGFloat = self.view.frame.width/CGFloat(totalCount)
        
        for index in 0...totalCount {
            //print("index: \(index)")
            let lbl: UILabel = UILabel(frame: CGRect(x: startXofLbl, y: 0.0, width: gapBetweenPoint, height: parentView.frame.size.height))
            lbl.text = String("\(index)\(index)")
            if index%2 == 0 { lbl.backgroundColor = UIColor.clear }
            else { lbl.backgroundColor = UIColor.clear }
            lbl.textColor = color
            lbl.textAlignment = .center
            parentView.addSubview(lbl)
            startXofLbl += gapBetweenPoint
        }
    }
}

