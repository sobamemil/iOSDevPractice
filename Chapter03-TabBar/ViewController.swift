//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by 심찬영 on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30)) // x 좌표는 나중에 center 정렬
        
        // title 레이블 속성 설정
        title.text = "첫번째 탭"
        title.textColor = .red // 텍스트 색상은 빨간색
        title.textAlignment = .center // 레이블 내에서 중앙 정렬
        title.font = UIFont.systemFont(ofSize: 14) // 폰트는 System Font, 14pt
        
        // 콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        // X축의 중앙에 오도록 설정
        title.center.x = self.view.frame.width / 2
        
        // 수퍼 뷰에 추가
        self.view.addSubview(title)
        
//        // 탭 바 아이템에 커스텀 이미지를 등록하고 탭 이름을 입력
//        self.tabBarItem.image = UIImage(named: "calendar.png")
//        self.tabBarItem.title = "Calender"
    }

    // 화면을 탭하면 이 메소드가 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        
//        // 탭 바가 현재 숨겨진 상태라면 노출, 현재 노출된 상태라면 숨김
//        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(0.15)) {
            // alpha 값이 0이면 1로, 1이면 0으로 바꿈
            // 호출될 때마다 점점 투명해지고 다시 점점 진해짐
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }

}

