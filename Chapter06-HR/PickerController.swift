//
//  PickerController.swift
//  Chapter06-HR
//
//  Created by 심찬영 on 2021/02/01.
//

import UIKit

class DepartPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // 멤버 변수와 메소드가 작성될 영역
    let departDAO = DepartmentDAO() // DAO 객체
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]! // 피커 뷰의 데이터 소스
    var pickerView: UIPickerView // 피커 뷰 객체
    
    // 현재 피커 뷰에 선택되어 있는 부서의 코드를 가져옴
    var selectedDepartCd: Int {
        let row = self.pickerView.selectedRow(inComponent: 0)
        return self.departList[row].departCd
    }
    
    override func viewDidLoad() {
        // DB에서 부서 목록을 가져와 튜플 배열을 초기화
        self.departList = self.departDAO.find()
        
        // 피커 뷰 객체를 초기화하고, 최상위 뷰의 서브 뷰로 추가함
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.view.addSubview(self.pickerView)
        
        // 외부에서 뷰 컨트롤러를 참조할 때를 위한 사이즈를 지정
        let pWidth = self.pickerView.frame.width
        let pHeight = self.pickerView.frame.height
        self.preferredCOntentSize = CGSize(width: pWidth, height: pHeight)
    }
}
