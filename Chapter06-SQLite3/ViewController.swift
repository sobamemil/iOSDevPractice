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
        
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        
        // 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾음
        let fileMgr = FileManager()
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        
        if sqlite3_open(dbPath, &db)  == SQLITE_OK { // DB를 연결, db 객체 생성
            // 데이터베이스가 잘 연결되었다면
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK { // SQL 구문을 전달할 준비, 컴파일된 SQL 구문 객체 생성(stmt)
                // SQL 컴파일이 잘 끝났다면
                if sqlite3_step(stmt) == SQLITE_DONE { // 컴파일된 SQL 구문 객체를 DB에 전달
                    print("Create Table Success!")
                }
                sqlite3_finalize(stmt) // 컴파일된 SQL 구문 객체를 삭제, 이 때, stmt 해제
            } else {
                print("Prepare Statement Fail")
            }
            sqlite3_close(db) // DB 연결 종료, 이 때, db 해제
        } else {
            print("Database Connect Fail")
            return
        }
    }
}

