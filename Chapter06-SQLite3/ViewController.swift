//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by 심찬영 on 2021/01/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dbPath = self.getDBPath()
        self.dbExecute(dbPath: dbPath)
    }
    
    func dbExecute(dbPath: String) {
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
                
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else { // DB를 연결, db 객체 생성
            print("Database Connect Fail")
            return
        }
        
        // 데이터베이스 연결 종료
        defer {
            print("Close Database Connection")
            sqlite3_close(db) // DB 연결 종료, 이 때, db 해제
        }
        
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else { // SQL 구문을 전달할 준비, 컴파일된 SQL 구문 객체 생성(stmt)
            print("Prepare Statement Fail")
            return
        }
        
        // stmt 변수 해제
        defer {
            print("Finalize Statement")
            sqlite3_finalize(stmt) // 컴파일된 SQL 구문 객체를 삭제, 이 때, stmt 해제
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE { // 컴파일된 SQL 구문 객체를 DB에 전달
            print("Create Table Success!")
        }
    }
    
    func getDBPath() -> String {
        // 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾음
        let fileMgr = FileManager()
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        
        // dbPath 경로에 파일이 없다면 앱 번들에 만들어 둔 db.sqlite를 가져와 복사
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        return dbPath
    }
}


