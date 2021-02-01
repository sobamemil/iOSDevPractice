//
//  EmployeeDAO.swift
//  Chapter06-HR
//
//  Created by 심찬영 on 2021/02/01.
//

import Foundation

class EmployeeDAO {
    enum EmpStateType: Int {
        case ING = 0, STOP, OUT // 순서대로 재직중(0), 휴직(1), 퇴사(2)
        
        // 재직 상태를 문자열로 변환해 주는 메소드
        func desc() -> String {
            switch self {
            case .ING:
                return "재직중"
            case .STOP:
                return "휴직"
            case .OUT:
                return "퇴사"
            }
        }
    }
}
