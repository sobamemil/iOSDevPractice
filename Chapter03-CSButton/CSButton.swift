//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by 심찬영 on 2021/01/21.
//

import UIKit

// 버튼 타입을 결정하는 열거형
public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    // 스토리보드를 통해 객체를 생성할 때 호출되는 초기화 메소드
    required init(coder aDecoder: NSCoder) {
        // 상위 클래스의 초기화 메소드에서 처리하는 내용을 누락시키지 않게 하기 위해 부모의 초기화 메소드 또한 호출
        super.init(coder: aDecoder)!
        
        // 스토리보드 방식으로 버튼을 정의했을 때만 구현
        self.backgroundColor = .green // 녹색 배경
        self.setTitle("버튼", for: .normal)
        self.layer.borderWidth = 2 // 테두리 살짝 두껍게
        self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
    }
    
    // 프로그래밍 방식으로 객체를 생성할 때 사용할 초기화 메소드
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red // 빨간색 배경
        self.setTitle("코드로 생성된 버튼", for: .normal) // 기본 문구 설정
        self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
        self.layer.borderWidth = 2 // 테두리 살짝 두껍게
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = .red // 빨간색 배경
            self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
            self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
            self.layer.borderWidth = 2 // 테두리 살짝 두껍게
            self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
        case .circle:
            self.backgroundColor = .blue // 빨간색 배경
            self.setTitle("Circle Button", for: .normal) // 기본 문구 설정
            self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
            self.layer.borderWidth = 2 // 테두리 살짝 두껍게
            self.layer.cornerRadius = 50 // 모서리는 50만큼 둥글게
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect:
                self.backgroundColor = .red // 빨간색 배경
                self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
                self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
                self.layer.borderWidth = 2 // 테두리 살짝 두껍게
                self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
            case .circle:
                self.backgroundColor = .blue // 빨간색 배경
                self.setTitle("Circle Button", for: .normal) // 기본 문구 설정
                self.layer.borderColor = UIColor.white.cgColor // 테두리는 하얀색
                self.layer.borderWidth = 2 // 테두리 살짝 두껍게
                self.layer.cornerRadius = 50 // 모서리는 50만큼 둥글게
            }
        }
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
    
}
