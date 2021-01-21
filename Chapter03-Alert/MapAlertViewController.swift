//
//  MapAlertViewController.swift
//  Chapter03-Alert
//
//  Created by 심찬영 on 2021/01/21.
//

import UIKit
import MapKit
class MapAlertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 생성 및 속성 설정
        let alertBtn = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 30))
        alertBtn.center.x = self.view.frame.size.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        // 이미지 알림창 버튼 생성
        let imageBtn = UIButton(type: .system)
        
        // 이미지 알림창 버튼 속성 설정
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.size.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
        
        // 슬라이더 알림창 버튼 생성
        let sliderBtn = UIButton(type: .system)
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.size.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(sliderBtn)
    }
    
    @objc func mapAlert(_ sender: Any) {
        // 경고창 객체를 생성하고, OK 및 Cancel 버튼 추가
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러 생성, 알림창에 등록
        let contentVC = MapKitViewController()
        
        // 뷰 컨트롤러를 알림창의 콘텐츠 뷰 컨트롤러 속성에 등록
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func imageAlert(_ sender: Any) {
        // 경고창 객체를 생성하고, OK 버튼 추가
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러 생성, 알림창에 등록
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func sliderAlert(_ sender: Any) {
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성
        let contentVC = ControlViewController()
        
        // 경고창 객체를 생성
        let alert = UIAlertController(title: nil, message: "이번 글의 평점을 입력해주세요.", preferredStyle: .alert)
        
        // 컨트롤 뷰 컨트롤러를 알림창에 등록
        alert.setValue(contentVC, forKey: "contentViewController")
        
        // OK 버튼을 추가
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print(">>> sliderValue = \(contentVC.sliderValue)")
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
