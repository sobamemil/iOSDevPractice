//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 심찬영 on 2021/01/19.
//

import UIKit

class ViewController: UIViewController {
    var paramEmail: UITextField! // 이메일 입력 필드
    var paramUpdate: UISwitch! // 스위치 객체
    var paramInterval: UIStepper! // 스테퍼
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 내비게이션 바 타이틀을 입력
        self.navigationItem.title = "설정"
        
        // 이메일 레이블을 생성하고 영역과 기본 문구를 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 120, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        // 레이블의 폰트를 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        // 레이블을 루트 뷰에 추가
        self.view.addSubview(lblEmail)
        
        // 자동갱신 레이블을 생성하고 루트 뷰에 추가
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblUpdate)
        
        // 갱신주기 레이블을 생성하고 루트 뷰에 추가
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblInterval)
        
        // 이메일 입력을 위한 텍스트 필드 추가
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.placeholder = "이메일 예) sieh96@naver.com"
        
        self.view.addSubview(self.paramEmail)
        
        // 스위치 객체를 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        
        // 스위치가 On 되어 있는 상태를 기본값으로 설정
        self.paramUpdate.setOn(true, animated: true)
        
        self.view.addSubview(self.paramUpdate)
        
        // 갱신주기를 위한 스테퍼를 추가
        self.paramInterval = UIStepper()
        
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 스테퍼가 가질 수 있는 최소값
        self.paramInterval.maximumValue = 100 // 스테퍼가 가질 수 있는 최대값
        self.paramInterval.stepValue = 1 // 스테퍼의 값 변경 단위
        self.paramInterval.value = 0 // 초기값 설정
        
        self.view.addSubview(self.paramInterval)
    }


}

