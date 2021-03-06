//  main.swift
//  SwiftPlayground
//
//  Created by 심찬영 on 2020/11/11.
//

import Foundation

//typealias PersonTuple = (name: String, age: Int)
//
//var sim: PersonTuple = ("chanyeong", 26)
//
//print("이름 : \(sim.name), 나이 : \(sim.age)")


//var names: Array<String> = ["sim", "chan", "yeong"]
//// == var names: [String] = ["sim", "chan", "yeong"]
//
//var emptyArray: Array<Any> = [Any]()
//// == var emptyArray: [Any] = Array<Any>()

//print(emptyArray.isEmpty)
//print(names.count)

//names.append(contentsOf: ["한국", "사람"])
//names.insert(contentsOf: ["first", "second"], at: 0)
//print(names)
//print(names.firstIndex(of: "sim"))
//print(names.firstIndex(of: "hello"))
//print(names.first)
//print(names.last)
//names[0...2] = ["hello", "i'm", "Korean"]
//print(names)

//var array: Array<Int> = [0, 1, 2, 3, 4]
//var set: Set<Int> = [0, 1, 2, 3, 4]
//var dictionary: Dictionary<String, Int> = ["a" : 1, "b" : 2, "c" : 3]
//var string: String = "string"
//
//print(array.randomElement())
//print(array.shuffled())
//print(array)
//array.shuffle()
//print(array)
//
//print(set.shuffled())
//// set.shuffle() set은 순서가 없으므로 오류
//print(dictionary.shuffled()) // Dictionary를 섞으면 (키, 값)이 쌍을 이룬 튜플의 배열로 반환
//print(string.shuffled())

//enum School: String {
//    case primary // 유치원
//    case elementary // 초등
//    case middle // 중등
//    case high // 고등
//    case college // 대학
//    case university = "대학교" // 대학교
//    case graduate // 대학원
//}
//
//let a: School = School.university
//print("저의 최종 학력은 : \(a.rawValue)")

//enum MainDish {
//    case pasta(taste: String)
//    case pizza(dough: String, topping: String)
//    case chicken(withSauce: Bool)
//    case rice
//}
//
//var dinner: MainDish = .pasta(taste: "크림") // 크림 파스타
//dinner = .pizza(dough: "치즈크러스트", topping: "불고기") // 불고기 치즈크러스트 피자
//dinner = .chicken(withSauce: true) // 양념 통닭
//dinner = .rice // 밥

// ---------
//enum PastaTaste {
//    case cream, tomato
//}
//
//enum PizzaDough {
//    case cheeseCrust, thin, original
//}
//
//enum PizzaTopping {
//    case peppeoni, cheese, bacon
//}
//
//enum MainDish {
//    case pasta(taste: PastaTaste)
//    case pizza(dough: PizzaDough, topping: PizzaTopping)
//    case chicken(withSauce: Bool)
//    case rice
//}
//
//var dinner: MainDish = .pasta(taste: PastaTaste.tomato)
//dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
//
//let allCases: Array<MainDish> = .allCases
//print(allCases)
//


//let t: Bool
//t = false
//
//print(t ? "true" : "false")
//
//
//prefix operator **
//
//prefix func ** (value: Int) -> Int {
//    return value * value
//}
//
//let value: Int = 10
//print(**value)
//
//
//prefix func ! (value: String) -> Bool {
//    return value.isEmpty
//}
//
//let string: String = "Hello World!"
//let emptyString: String = ""
//print(!string)
//print(!emptyString)
//
//
//prefix func ** (value: String) -> String {
//    return value + " " + value
//}
//print(**string)


//postfix operator **
//postfix func ** (value: Int) -> Int {
//    return value + 10
//}
//
//let five: Int = 5
//print(five**)

//
//infix operator ** : MultiplicationPrecedence
//func ** (ls: String, rs: String) -> Bool {
//    return ls.contains(rs)
//}
//
//let ls: String = "hello world!"
//let rs: String = "i'm fine"
//
//print(ls**rs)

//let integerValue: Int = 5
//
//switch integerValue {
//case 0:
//    print("Value == zero")
//case 1...10:
//    print("Value == 1~10")
//    fallthrough
//case Int.min..<0, 101..<Int.max:
//    print("Value < 0 or Value > 100")
//default:
//    print("10 < Value <= 100")
//}

//typealias NameAge = (name: String, age: Int)
//
//let tupleValue: NameAge = ("sim", 25)
//
//switch tupleValue {
//case ("sim", 25):
//    print("정확히 맞았습니다!")
//case ("sim", let age):
//    print("이름만 맞았습니다. 나이는 \(age)입니다!")
//case (let name, 25):
//    print("나이만 맞았습니다. 이름은 \(name)입니다!")
//default:
//    print("둘 다 틀렸습니다!")
//}

//let 직급: String = "사원"
//let 연차: Int = 1
//let 인턴인가: Bool = false
//
//switch 직급 {
//case "사원" where 인턴인가 == true:
//    print("인턴입니다.")
//case "사원" where 연차 < 2 && 인턴인가 == false:
//    print("신입사원입니다.")
//case "사원" where 연차 > 5:
//    print("연식 좀 된 사원입니다.")
//case "사원":
//    print("사원입니다.")
//case "대리":
//    print("대리입니다.")
//default:
//    print("사장입니까?")
//}

//
//// 열거형과 같이 한정된 범위의 값을 입력 값으로 받을 경우 값에 대응하는 각 case를 전부 구현한다면 default는 구현하지 않아도 됨
//enum School {
//    case primary, elementary, middle, high, college, university, graduate
//}
//
//let 최종학력: School = School.university
//
//switch 최종학력 {
//case .primary:
//    print("최종학력은 유치원입니다.")
//case .elementary:
//    print("최종학력은 초등학교입니다.")
//case .middle:
//    print("최종학력은 중학교입니다.")
//case .high:
//    print("최종학력은 고등학교입니다.")
//case .college, .university:
//    print("최종학력은 대학(교)입니다.")
//case .graduate:
//    print("최종학력은 대학원입니다.")
//}
//

//
//for i in 0...4 {
//    if i.isMultiple(of: 2) {
//        print(i)
//        continue
//    }
//    print("\(i) == 홀수")
//}
//
//let helloSwift: String = "Hello Swift!"
//
//for char in helloSwift {
//    print(char)
//}
//
//var result: Int = 1
//
//for _ in 1...3 {
//    result *= 10
//}
//
//print("10의 3제곱은 \(result)입니다.")


//let friends: Dictionary<String, Int> = ["sim" : 25, "kim" : 26]
//
//for tuple in friends {
//    print(tuple)
//}

//let 주소: Dictionary<String, String> = ["도" : "강원도", "시군구" : "원주시", "읍면동" : "태장1동"]
//
//for (키, 값) in 주소 {
//    print("\(키) : \(값)")
//}

//var names: Array<String> = ["Joker", "Jenney", "Nova", "Sim"]
//
//while names.isEmpty == false {
//    print("Good bye \(names.removeFirst())")
//    // removeFirst()는 요소를 삭제하고 삭제한 요소를 반환함
//}
//
//var names: Array<String> = ["Joker", "Jenney", "Nova", "Sim"]
//
//repeat {
//    print("Good bye \(names.removeFirst())")
//}while names.isEmpty == false

//
//func hello(name: String) -> String {
//    //return "Hello \(name)!"
//    "Hello \(name)!"
//}
//
//let helloSim: String = hello(name: "sim")
//print(helloSim)


//func sayHello(from myName: String, to name: String) -> String {
//    "Hello \(name)! I'm \(myName)"
//}
//
//print(sayHello(from: "Sim", to: "Kim"))


//func sayHello(_ name: String, _ times: Int) -> String {
//    var result: String = ""
//
//    for _ in 0..<times {
//        result += "Hello \(name)!" + " "
//    }
//
//    return result
//}
//
//print(sayHello("Chope", 2))


//func crashAndBurn() -> Never {
//    fatalError("Something very, very bad happend")
//}
//
//crashAndBurn() // 프로세스 종료 후 오류 보고
//
//func someFunction(isAllIsWell: Bool) {
//    guard isAllIsWell else {
//        print("마을에 도둑이 들었습니다!")
//        // crashAndBurn()
//    }
//    print("All is well")
//}
//
//someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false)


//func say(_ something: String) -> String {
//    print(something)
//    return something
//}
//
//@discardableResult func discardableResultSay(_ something: String) -> String {
//    print(something)
//    return something
//}
//
//say("hello") // return 값을 사용하지 않았으므로 컴파일라가 경고 표시
//discardableResultSay("Hello!!!") // return 값을 사용하지 않을 수 있다고 미리 경고하였으므로 경고하지 않음


//class testClass {
//    var v: Int =3
//    let l: Int = 3
//
//    init(v: Int = 0) {
//
//        print("initialized!!\nv : \(v), l : \(l)")
//    }
//}
//
//var class1: testClass = testClass()


//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//}
//
//class Position {
//    var point: CoordinatePoint? // 현재 사람의 위치를 모를 수 있으므로 옵셔널 타입
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let myPosition: Position = Position(name: "Sim")
//
//myPosition.point = CoordinatePoint(x: 10, y:20)
//
//if let myPoint = myPosition.point {
//    print("\(myPosition.name), \(myPoint)")
//}


//struct CoordinatePoint {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//class Position {
//    lazy var point: CoordinatePoint = CoordinatePoint()
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let myPosition: Position = Position(name: "SimChanYeong")
//print(myPosition.point)


//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//
//    var oppositePoint: CoordinatePoint {
//        //접근자
//        get {
//            return CoordinatePoint(x: -x, y: -y)
//        }
//
//        //설정자
//        set(opposite) {
//            x = -opposite.x
//            y = -opposite.y
//        }
//    }
//}
//
//var myPosition: CoordinatePoint = CoordinatePoint(x: 1, y: 1)
//print(myPosition)
//
//print(myPosition.oppositePoint)
//
//myPosition.oppositePoint = CoordinatePoint(x: 10, y:10)
//print(myPosition)
//
//
//
//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//
//    var oppositePoint: CoordinatePoint {
//        //접근자
//        get {
//            CoordinatePoint(x: -x, y: -y)
//        }
//
//        //설정자
//        set {
//            x = -newValue.x
//            y = -newValue.y
//        }
//    }
//}
//
//var myPosition: CoordinatePoint = CoordinatePoint(x: 1, y: 1)
//print(myPosition)
//
//print(myPosition.oppositePoint)
//
//myPosition.oppositePoint = CoordinatePoint(x: 10, y:10)
//print(myPosition)


//class Account {
//    var credit: Int {
//        willSet {
//            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
//        }
//        didSet {
//            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
//        }
//    }
//
//    init(credit: Int) {
//        self.credit = credit
//    }
//}
//
//let myAccount: Account = Account(credit: 100)
//
//myAccount.credit = 1000



//class Account {
//    var credit: Int = 0 {
//        willSet {
//            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
//        }
//    }
//
//    var dollarValue: Double {
//        get {
//            Double(credit) / 1000.0
//        }
//
//        set {
//            credit = Int(newValue * 1000)
//            print("잔액을 \(newValue)달러로 변경 중입니다.")
//        }
//    }
//}
//
//class ForeignAccount: Account {
//    override var dollarValue: Double {
//        willSet {
//            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
//        }
//    }
//}
//
//let myAccount: ForeignAccount = ForeignAccount()
//myAccount.credit = 1000
//
//myAccount.dollarValue = 2


//var numbers: Array<Int> = [2,1,3,4,1]
//let result: Array<Int> = solution(numbers)
//
//func solution(_ numbers:[Int]) -> [Int] {
//    var result: Array<Int> = Array<Int>()
//
//    for i in 0..<numbers.count {
//        for j in i+1..<numbers.count {
//            result.append(numbers[i] + numbers[j])
//        }
//    }
//
//    return Set(result).sorted()
//}
//
//print(result)

//func solution(_ s:String) -> Int {
//    return Int(s)!
//}
//
//print(solution("123"))


//func solution(_ n:Int) -> String {
//    var answer: String = ""
//
//    for i in 1...n {
//        if i%2 != 0 {
//            answer.append("수")
//            continue
//        }
//        answer.append("박")
//    }
//    return answer
//}
//print(solution(3))

//class AClass {
//    static var typeProperty: Int = 0
//
//    var instanceProperty: Int = 0 {
//        didSet {
//            Self.typeProperty = instanceProperty + 100
//        }
//    }
//
//    static var typeComputedProperty: Int {
//        get {
//            return typeProperty
//        }
//
//        set {
//            typeProperty = newValue
//        }
//    }
//}
//
//AClass.typeProperty = 123
//print(AClass.typeProperty)
//
//let classInstance: AClass = AClass()
//classInstance.instanceProperty = 100
//
//print(AClass.typeProperty)
//print(AClass.typeComputedProperty)


//func someFunction(paramA: Any, paramB: Any) {
//    print("someFunction called...")
//}
//
//var functionReference = someFunction(paramA:paramB:)
//functionReference(1,2)

//class Person {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}
//
//print(type(of: \Person.name))
//print(type(of: \Stuff.name))
//
//let keyPath = \Stuff.owner
//let nameKeyPath = keyPath.appending(path: \.name)
//
//print(keyPath)
//print(nameKeyPath)


//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    return commands.map{ array[$0[0]-1..<$0[1]].sorted()[$0[2]-1]}
//}
//
//let array: Array<Int> = [1, 5, 2, 6, 3, 7, 4]
//let commands: Array<Array<Int>> = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
//print(solution(array, commands))
//
//
//
//func solution(_ s:String) -> Bool {
//    if Int(s) != nil && s.count == 4 || s.count == 6 {
//        return true
//    }
//    return false
//}

//
//func solution(_ s:String) -> Bool {
//    Int(s) != nil && s.count == 4 || s.count == 6 ? true : false
//}
//
//let string: String = "a123"
//let numString: String = "1234"
//
//print(solution(string))
//print(solution(numString))

//func solution(_ s:String) -> String {
//    s.count%2 == 0 ? String(s[s.index(s.startIndex, offsetBy: s.count/2-1)...s.index(s.startIndex, offsetBy: s.count/2)]) : String(s[s.index(s.startIndex, offsetBy: s.count/2)])
//}
//
//let s: String = "abcde"
//print(solution(s))


//struct LevelStruct {
//    var level: Int = 0 {
//        didSet {
//            print("Level \(level)")
//        }
//    }
//
//    mutating func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//    mutating func jumpLevel(to level: Int) {
//        print("Jump to \(level)")
//        self.level = level
//    }
//}
//
//var game: LevelStruct = LevelStruct()
//game.levelUp()
//game.levelUp()
//game.jumpLevel(to: 10)


//struct LevelStruct {
//    var level: Int = 0
//
//    mutating func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//    mutating func reset() {
//        print("Reset!")
//        self = LevelStruct()
//    }
//}
//
//var levelStructInstance: LevelStruct = LevelStruct()
//levelStructInstance.levelUp()
//print(levelStructInstance.level)
//
//levelStructInstance.reset()
//print(levelStructInstance.level)
//
//enum OnOffSwitch {
//    case on, off
//    mutating func nextState() {
//        self = self == .on ? .off : .on
//    }
//}
//
//var toggle: OnOffSwitch = OnOffSwitch.off
//toggle.nextState()
//print(toggle)


//struct TestStruct {
//    let 상수: String
//    var 변수: Int
//}
//
//var testStruct: TestStruct = TestStruct(상수: "상수", 변수: 1)
//print(testStruct.self)

// MARK: - 함수형 프로그래밍
//let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

//func backwards(first: String, second: String) -> Bool {
//    print("\(first) \(second) 비교중")
//    return first > second
//}
//
//let reversed: [String] = names.sorted(by: backwards(first:second:))
//print(reversed)

//let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
//    return first > second
//})
//print(reversed)


//// 후행 클로저 사용
//let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
//    return first > second
//}

//// 소괄호 생략 가능
//let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
//    return first > second
//}

//func doSomething(do: (String) -> Void,
//                 onSuccess: (Any) -> Void,
//                 onFailure: (Error) -> Void) {
//    // do something...
//}
//
//// 다중 후행 클로저 사용
//doSomething { (someString: String) in
//    // do closure
//} onSuccess: { (result: Any) in
//    // success closure
//} onFailure: { (error: Error) in
//    // failure closure
//}

//// 클로저 표현 간소화
//let reversed: [String] = names.sorted { (first, second) in
//    return first > second
//}

//let reversed: [String] = names.sorted {
//    return $0 > $1
//}

//let reversed: [String] = names.sorted { $0 > $1 }

//let reversed: [String] = names.sorted(by: >)

//func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
//    var runningTotal = 0
//    func incrementer() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementer
//}
//
//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
//
//let first: Int = incrementByTwo() // 2
//let second: Int = incrementByTwo() // 4
//let third: Int = incrementByTwo() // 6

// MARK:- 옵셔널 체이닝과 빠른 종료

//class Room { // 호실
//    var number: Int // 호실 번호
//
//    init(number: Int) {
//        self.number = number
//    }
//}
//
//class Building { // 건물
//    var name: String // 건물 이름
//    var room: Room? // 호실 정보
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Address { // 주소
//    var province: String // 광역시/도
//    var city: String // 시/군/구
//    var street: String // 도로명
//    var building: Building? // 건물
//    var detailAddress: String? // 건물 외 상세 주소
//
//    init(province: String, city: String, street: String) {
//        self.province = province
//        self.city = city
//        self.street = street
//    }
//
//    func fullAddress() -> String? {
//        var restAddress: String? = nil
//
//        if let buildingInfo: Building = self.building {
//            restAddress = buildingInfo.name
//        } else if let detail = self.detailAddress {
//            restAddress = detail
//        }
//
//        if let rest: String = restAddress {
//            var fullAddress: String = self.province
//
//            fullAddress += " " + self.city
//            fullAddress += " " + self.street
//            fullAddress += " " + rest
//
//            return fullAddress
//        } else {
//            return nil
//        }
//    }
//
//    func printAddress() {
//        if let address: String = self.fullAddress() {
//            print(address)
//        }
//    }
//}
//
//class Person { // 사람
//    var name: String // 이름
//    var address: Address? // 주소
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let sim: Person = Person(name: "sim")
//
//var roomNumber: Int? = nil
//
//if let simaddr: Address = sim.address {
//    if let simBuilding: Building = simaddr.building {
//        if let simRoom: Room = simBuilding.room {
//            roomNumber = simRoom.number
//        }
//    }
//}
//
//if let number: Int = roomNumber {
//    print(number)
//} else {
//    print("Can not find room number")
//}
//
//// 동일한 코드
//if let roomNumber: Int = sim.address?.building?.room?.number {
//    print(roomNumber)
//} else {
//    print("Can not find room number")
//}
//
//// 옵셔널 체이닝을 통한 값 할당 시도
//sim.address = Address(province: "**도", city: "**시", street: "**길")
//sim.address?.building = Building(name: "**빌딩")
//sim.address?.building?.room = Room(number: 0)
//sim.address?.building?.room?.number = 505
//print(sim.address?.building?.room?.number) // nil
//
//print(sim.address?.fullAddress()?.isEmpty)
//sim.address?.printAddress()


//// 옵셔널 체이닝을 통한 서브스크립트 호출
//let optionalArray: [Int]? = [1, 2, 3]
//optionalArray?[1] // 2
//
//var optionalDictionary: [String : [Int]]? = [String : [Int]]()
//optionalDictionary?["numberArray"] = optionalArray
//optionalDictionary?["numberArray"]?[2] // 3


//// 빠른 종료 guard
 /*
    guard Bool 타입의 값 else {
        예외사항 실행문
        제어문 전환 명령어
    }
 */

//func greet(_ person: [String : String]) {
//    guard let name: String = person["name"] else {
//        return
//    }
//
//    print("Hello \(name)!")
//
//    guard let location: String = person["location"] else {
//        print("I hope the weather is nice near you")
//        return
//    }
//
//    print("I hope the weather is nice in \(location)")
//}
//
//var personInfo: [String : String] = [String : String]()
//personInfo["name"] = "Jenny"
//
//greet(personInfo) // Hello Jenny!
//// I hope weather is nice near you
//
//personInfo["location"] = "Korea"
//greet(personInfo)
//// Hello Jenny
//// I hope the weather is nice in Korea
//
//func enterClub(name: String?, age: Int?) {
//    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
//        print("You are too young to enter the club")
//        return
//    }
//
//    print("Welcome \(name)")
//}

//let first: Int = 3
//let second: Int = 5
//
//guard first > second else {
//    // 여기에 들어올 제어문 전환 명령은 딱히 없습니다. 오류!
//}

//let numbers: [Int] = [0, 1, 2, 3, 4]
//
//var doubledNumbers: [Int] = [Int]()
//var strings: [String] = [String]()
//
//// for 구문 사용
//for number in numbers {
//    doubledNumbers.append(number * 2)
//    strings.append("\(number)")
//}
//
//print(doubledNumbers)
//print("\(strings)")
//
//// map 메소드 사용
//doubledNumbers = numbers.map({ (number: Int) -> Int in
//    return number * 2
//})
//
//strings = numbers.map { (number: Int) -> String in
//    return "\(number)"
//}
//
//print(doubledNumbers)
//print(strings)
//
//// 매개변수 및 반환 타입 생략
//doubledNumbers = numbers.map({ return $0 * 2})
//print(doubledNumbers)
//
//// 반환 키워드 생략
//doubledNumbers = numbers.map({$0 * 2})
//print(doubledNumbers)
//
//// 후행 클로저 사용
//doubledNumbers = numbers.map {$0 * 2}
//print(doubledNumbers)


//let evenNumbers: [Int] = [0, 2, 4, 6, 8]
//let oddNumbers: [Int] = [0, 1, 3, 5, 7]
//let multiplyTwo: (Int) -> Int = { $0 * 2 }
//
//let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
//print(doubledEvenNumbers)
//
//let doubledOddNumbers = oddNumbers.map(multiplyTwo)
//print(doubledOddNumbers)

//// 필터 메소드 사용
//let numbers: [Int] = [0, 1, 2, 3, 4, 5]

//let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
//    return number % 2 == 0
//}
//print(evenNumbers)
//
//let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }
//print(oddNumbers)

//let mappedNumbers: [Int] = numbers.map{ $0 + 3 }
//
//let evenNumbers: [Int] = mappedNumbers.filter{ (number: Int) -> Bool in
//    return number % 2 == 0
//}
//print(evenNumbers)
//
//let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1}
//print(oddNumbers)

//// 두 가지 형태의 리듀스
//// 1.
// public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
//// 2.
// public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result

//let numbers: [Int] = [1, 2, 3]

//// 첫 번째 형태인 reduce(_:_:) 메소드의 사용

//// 초깃값이 0이고 정수 배열의 모든 값을 더함
//var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
//    print("\(result) + \(next)")
//    // 0 + 1
//    // 1 + 2
//    // 2 + 3
//    return result + next
//})
//
//print(sum) // 6
//
//// 초깃값이 0이고 정수 배열의 모든 값을 뺌
//let subtract: Int = numbers.reduce(0, { $0 - $1 })
//print(subtract)
//
//// 초깃값이 3이고 정수 배열의 모든 값을 더함
//let sumFromThree: Int = numbers.reduce(3) { (result: Int, next: Int) in
//    return result + next
//}
//print(sumFromThree) // 9
//
//// 초깃값이 3이고 정수 배열의 모든 값을 뺌
//var subtractFromThree: Int = numbers.reduce(3) { $0 - $1 }
//print(subtractFromThree) // -3

//// 문자열 배열을 reduce(_:_:) 메소드를 이용해 연결
//let names: [String] = ["Chope", "Jay", "Joker", "Nova"]
//
//let reduceNames: String = names.reduce("sim's friends = ") {
//    $0 + ", " + $1
//}
//print(reduceNames)

//// 두 번째 형태의 reduce(into:_:) 메소드 사용
//
//// 초깃값이 0이고 정수 배열의 모든 값을 더함
//// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서 직접 이전 값을 변경한다는 점이 다름
//let sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
//    print("\(result) + \(next)")
//    // 0 + 1
//    // 1 + 2
//    // 2 + 3
//    result += next
//})
//print(sum) // 6
//
//// 초깃값이 3이고 정수 배열의 모든 값을 뺌
//// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서 직접 이전 값을 변경한다는 점이 다름
//let subtractFromThree = numbers.reduce(into: 3, { (result: inout Int, next: Int) in
//    print("\(result) - \(next)")
//    // 3 - 1
//    // 2 - 2
//    // 0 - 3
//    result -= next
//})
//print(subtractFromThree) // -3
//
//// 첫 번째 리듀스 형태와 다르므로 다른 컨테이너에 값을 변경하여 넣어줄 수도 있음
//// 이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수도 있음
//// 홀수는 걸러내고 짝수만 두 배로 변경하여 초깃값인 [1, 2, 3] 배열에 직접 연산
//var doubledNumbers: [Int] = numbers.reduce(into: [1, 2], { (result: inout [Int], next: Int) in
//    print("result: \(result) next: \(next)")
//
//    guard next.isMultiple(of: 2) else {
//        return
//    }
//
//    print("\(result) append \(next * 2)")
//
//    result.append(next * 2)
//})
//print(doubledNumbers)
//
//// 필터와 맵을 사용한 모습
//doubledNumbers = [1, 2] + numbers.filter({ (result: Int) -> Bool in return result.isMultiple(of: 2)}).map({ (result: Int) -> Int in return result * 2})
//print(doubledNumbers)
//
//// 이름을 모두 대문자로 변환하여 초깃값인 빈 배열에 직접 연산
//var upperCasedNames = names.reduce(into: [], { (result: inout [String], next: String) in
//    result.append(next.uppercased())
//})
//print(upperCasedNames)
//
//// 맵을 사용한 모습
//upperCasedNames = names.map({ (result: String) -> String in
//    result.uppercased()
//})
//print(upperCasedNames)

//// 필터, 맵, 리듀스의 연계 사용
//let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]
//
//// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더함
//var result: Int = numbers.filter{ $0.isMultiple(of: 2)}.map{ $0 * 3 }.reduce(0, { $0 + $1 })
//print(result) // 36
//
//// for-in 구문 사용 시
//result = 0
//for number in numbers {
//    guard number.isMultiple(of: 2) else {
//        continue
//    }
//    result += number * 3
//}
//print(result)


