//
//  ViewController.swift
//  Chapter03-CSButton
//
//  Created by 심찬영 on 2021/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let csBtn = CSButton(frame: CGRect(x: 30, y: 50, width: 150, height: 30))
//        self.view.addSubview(csBtn)
        
        let csBtn = CSButton()
        csBtn.frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        self.view.addSubview(csBtn)
        
        // 인자값에 따라 다른 스타일로 결정되는 버튼 1
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30, y: 200, width: 150, height: 30)
        self.view.addSubview(rectBtn)
        
        // 인자값에 따라 다른 스타일로 결정되는 버튼 2
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 200, width: 150, height: 30)
        self.view.addSubview(circleBtn)
        
        // 프로퍼티 옵저버를 통해 다른 스타일로 버튼을 변경
        circleBtn.style = .rect // 타원 형대로 정의된 버튼의 스타일을 다시 사각형으로 설정
    }
}

