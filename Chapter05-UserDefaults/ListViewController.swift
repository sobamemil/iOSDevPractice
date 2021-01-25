//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by 심찬영 on 2021/01/25.
//

import UIKit
class ListViewConotroller: UITableViewController {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var married: UISwitch!
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        // 입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록 함
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요.", preferredStyle: .alert)
        
        // 입력 필드 추가
        alert.addTextField(configurationHandler: {
            $0.text = self.name.text // name 레이블의 텍스트를 입력폼에 기본값으로 넣어줌
        })
    
        // 버튼 및 액션 추가
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            // 사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard // 기본 저장소를 가져옴
            plist.setValue(value, forKey: "name") // "name"이라는 키로 값을 저장
            plist.synchronize() // 동기화 처리
            
            // 수정된 값을 이름 레이블에도 적용
            self.name.text = value
            
            // 변경이 완료되었다는 알림창을 띄워줌
            let changeOkAlert = UIAlertController(title: nil, message: "변경이 완료되었습니다.", preferredStyle: .alert)
            
            changeOkAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(changeOkAlert, animated: true)
        }))
        
        // 알림창을 띄움
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0이면 남자, 1이면 여자
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져옴
        plist.set(value, forKey: "gender") // "gender"라는 키로 값을 저장
        plist.synchronize() // 동기화 처리
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn // ture면 기혼, false면 미혼
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져옴
        plist.set(value, forKey: "married") // "married"라는 키로 값을 저장
        plist.synchronize() // 동기화 처리
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 { // 첫 번째 셀이 클릭되었을 때에만
//
//        }
    }
    
    override func viewDidLoad() {
        let plist = UserDefaults.standard
        
        // 저장된 값을 꺼내어 각 컨트롤에 설정
        self.name.text = plist.string(forKey: "name") // 이름
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender") // 성별
        self.married.isOn = plist.bool(forKey: "married") // 결혼 여부
    }
}
