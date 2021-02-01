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
    
    struct EmployeeVO {
        var empCd = 0 // 사원 코드
        var empName = "" // 사원명
        var joinDate = "" // 입사일
        var stateCd = EmpStateType.ING // 재직 상태(기본값 : 재직중)
        var departCd = 0 // 소속 부서 코드
        var departTitle = "" // 소속 부서명
    }
    
    // FMDatabase 객체 생성 및 초기화
    lazy var fmdb: FMDatabase! = {
        // 파일 매니저 객체를 생성
        let fileMgr = FileManager.default
        
        // 샌드박스 내 문서 디렉터리 경로에서 데이터베이스 파일을 읽어옴
        let docPath = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbPath = docPath!.appendingPathComponent("hr.sqlite").path
        
        // 샌드박스 경로에 hr.sqlite 파일이 없다면 메인 번들에 만들어 둔 파일을 가져와 복사
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource, toPath: dbPath)
        }
        
        // 준비된 데이터베이스 파일을 바탕으로 FMDatabase 객체를 생성
        let db = FMDatabase(path: dbPath)
        return db
    }()
}
