//
//  MapKitViewController.swift
//  Chapter03-Alert
//
//  Created by 심찬영 on 2021/01/21.
//

import UIKit
import MapKit
class MapKitViewController: UIViewController {
    override func viewDidLoad() {
        // 뷰 컨트롤러에 맵킷 뷰 추가
        let mapKitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)) // mapKitView는 rootview 따라서 자동으로 화면을 가득 채움
        self.view = mapKitView
        self.preferredContentSize.height = 500
        
        // 위치 정보를 설정. 위도, 경도 사용
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        
        // 지도에서 보여줄 넓이. 일종의 축척. 숫자가 작을수록 좁은 범위를 확대시켜서 보여줌
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        // 지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        
        // 지도 뷰에 표시
        mapKitView.region = region
        mapKitView.regionThatFits(region)
        
        // 위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapKitView.addAnnotation(point)
    }
}
