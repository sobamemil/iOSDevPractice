//
//  DepartmentListVC.swift
//  Chapter06-HR
//
//  Created by 심찬영 on 2021/01/29.
//

import UIKit
class DepartmentListVC: UITableViewController {
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]! // 데이터 소스용 멤버 변수
    let departDAO = DepartmentDAO() // SQLite 처리를 담당할 DAO 객체
    
    // UI 초기화 함수
    func initUI() {
        // 내비게이션 타이틀용 레이블 속성 설정
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "부서 목록 \n" + " 총 \(self.departList.count) 개"
        
        // 내비게이션 바 UI 설정
        self.navigationItem.titleView = navTitle
        self.navigationItem.leftBarButtonItem = self.editButtonItem // 편집 버튼 추가
        
        // 셀을 스와이프했을 때 편집 모드가 되도록 설정
        self.tableView.allowsSelectionDuringEditing = true
    }
    
    override func viewDidLoad() {
        self.departList = self.departDAO.find() // 기존 저장된 부서 정보를 가져옴
        self.initUI()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.departList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath 매개변수가 가리키는 행에 대한 데이터를 읽어옴
        let rowData = self.departList[indexPath.row]
        
        // 셀 객체를 생성하고 데이터를 배치
        let cell = tableView.dequeueReusableCell(withIdentifier: "DEPART_CELL")
        
        cell?.textLabel?.text = rowData.departTitle
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        cell?.detailTextLabel?.text = rowData.departAddr
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell!
    }
    
    @IBAction func add(_ sender: Any) {
        // 여기에 비즈니스 로직
        let alert = UIAlertController(title: "신규 부서 등록", message: "신규 부서를 등록해 주세요", preferredStyle: .alert)
        
        // 부서명 및 주소 입력용 텍스트 필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "부서명"
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "주소"
        })
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil)) // 취소 버튼
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
                // 부서 등록 로직이 들어갈 자리
                let title = alert.textFields?[0].text // 부서명
                let addr = alert.textFields?[1].text // 부서 주소
            
                if self.departDAO.create(title: title!, addr: addr!) {
                    // 신규 부서가 등록되면 DB에서 목록을 다시 읽어온 후, 테이블을 갱신
                    self.departList = self.departDAO.find()
                    self.tableView.reloadData()
                    
                    // 내비게이션 타이틀에도 변경된 부서 정보를 반영
                    let navTitle = self.navigationItem.titleView as! UILabel
                    navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
                }
            }
        )) // 확인 버튼
        
        self.present(alert, animated: false, completion: nil)
    }
}
