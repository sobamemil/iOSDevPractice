//
//  SideBarViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by 심찬영 on 2021/01/22.
//

import UIKit
class SideBarViewController: UITableViewController {
    // 메뉴 제목 배열
    let titles = [
        "메뉴 01",
        "메뉴 02",
        "메뉴 03",
        "메뉴 04",
        "메뉴 05"
    ]
    
    // 메뉴 아이콘 배열
    let icons = [
        UIImage(named: "icon01"),
        UIImage(named: "icon02"),
        UIImage(named: "icon03"),
        UIImage(named: "icon04"),
        UIImage(named: "icon05")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 계정 정보를 표시할 레이블 객체를 정의
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        accountLabel.text = "sieh96@naver.com"
        accountLabel.textAlignment = .left
        accountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        accountLabel.textColor = .white
        
        // 테이블 뷰 상단에 표시될 뷰를 정의
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountLabel)
        
        // 생성된 뷰 v를 테이블 헤더 뷰 영역에 등록
        self.tableView.tableHeaderView = v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 큐로부터 테이블 셀을 꺼냄
        let id = "menucell" // 재사용 큐에 등록할 식별자
//        var cell = tableView.dequeueReusableCell(withIdentifier: id)
//
//        // 재사용 큐에 menucell키로 등록된 테이블 뷰 셀이 없다면 새로 추가
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }
        
        // --> nil 병합 연산자를 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
//        // 재사용 큐를 사용하지 않고 cell을 만드는 경우
//        let cell = UITableViewCell() // 모든 경우에 셀을 새로 생성
        
        // 타이틀과 이미지를 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        // 폰트 설정
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
}
