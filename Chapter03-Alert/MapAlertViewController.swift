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
}
