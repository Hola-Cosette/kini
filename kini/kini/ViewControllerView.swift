//
//  ViewController.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/14.
//

//
//  ViewController.swift
//  FoodLensTestApp
//
//  Created by HwangChun Lee on 29/03/2019.
//  Copyright © 2019 DoingLab Inc. All rights reserved.
//

import UIKit
import FoodLens
import SwiftUI

//struct ViewControllers: UIViewControllerRepresentable {
////    let viewController = ViewController()
//    func makeUIViewController(context: Context) -> ViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController()
//        return viewController as! ViewController
//    }
//
//    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
//
//    }
//}
//struct ViewControllerView: View {
//    @State private var isPresentingStoryboard = false
//    var body: some View {
//        VStack {
////            Image(systemName: "face.smiling")
//////                .sheet(isPresented: $isPresentingStoryboard) {
//////                    // Main Storyboard로 이동
//////                ViewControllers()
//////                }
////                .onTapGesture {
////
////                }
//            NavigationLink(destination: ViewControllers()) {
//                Image(systemName: "face.smiling")
//            }
//            var vc = ViewControllers()
////            vc.makeUIViewController(context: self.context)
//        }
//    }
//}
struct ViewControllerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
            // Return MyViewController instance
//        var vc = ViewController()
////        vc.startCameraUIService((Any).self)
//        print("makeUIViewController")
//        return vc
        UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
        typealias UIViewControllerType = ViewController
        print("updateUIViewController")
    }
}

struct ShowViewController: View {
    @State var isPresented = false
        
        var body: some View {
//            Button("ViewController") {
//                isPresented = true
//            }
//            .sheet(isPresented: $isPresented) {
//                ViewControllerView()
//
//            }
            ViewControllerView()
        }
}

struct ViewControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ShowViewController()
    }
}

class ViewController: UIViewController, UserServiceResultHandler, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet weak var statusLabel: UILabel!
    var result : RecognitionResult? = nil
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UserServiceResultHandler Methods
    // 성공적인 결과를 받았을 때 호출되는 메서드
    func onSuccess(_ result: RecognitionResult) {
        self.result = result
        tableView.reloadData()
        NSLog("Success")
        print("onSuccess")
    }
    
    // 사용자가 작업을 취소했을 때 호출되는 메서드
    func onCancel() {
        NSLog("Canceled")
    }
    
    // 에러가 발생했을 때 호출되는 메서드
    func onError(_ error: BaseError) {
        print("onError")
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource Methods
    // 테이블 뷰 셀의 높이를 설정하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    // 섹션의 행 수를 반환하는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = self.result {
            return result.getFoodPositions().count+1 ?? 0
        }
        else {
            return 0
        }
    }
    
    // 각 행에 대한 셀을 반환하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // 첫 번째 행일 경우, 전체 이미지를 표시
        if indexPath.row == 0 {
            if let imagePath = result?.getRecognizedImage()?.split(separator: "/").last {   // result 객체의 getRecognizedImage() 메서드를 호출하여 인식된 이미지의 경로를 가져옵니다. 경로는 "/"로 분리되어 있으며, 가장 마지막 부분인 파일 이름을 추출합니다.
                cell.foodImage.image = Util.load(path: "foodlensStore", fileName: String(imagePath))    // Util 클래스의 load 메서드를 호출하여 이미지를 로드하여 cell의 foodImage에 설정합니다. 이미지는 "foodlensStore" 경로와 추출한 파일 이름으로 지정됩니다.
            }
            cell.foodName.text = "full image"   // 셀의 foodName 레이블에 "full image"라는 텍스트를 설정합니다.
            cell.foodUnit.text = "" // 셀의 foodUnit 레이블에는 빈 문자열을 설정합니다.
        }
        else {
            // 그 외의 행일 경우, 식품 정보를 표시
            if let data = result?.getFoodPositionAtIndex(index: indexPath.row-1) {
                if let imageFilename = data.foodImagepath?.split(separator: "/").last {
                    cell.foodImage.image = Util.load(path: "foodlensStore", fileName: String(imageFilename))
                }
                
                // 사용자가 선택한 식품 이름 표시
                if let foodname = data.userSelectedFood?.foodName {
                    cell.foodName.text = data.userSelectedFood?.foodName ?? ""
                }
                else {
                    // 식품 후보 중 첫 번째 식품 이름 표시
                    cell.foodName.text = data.foodCandidates[0].foodName
                }
                
                // 사용자가 선택한 식품의 칼로리 표시
                if let calorie = data.userSelectedFood?.nutrition?.calories {
                    cell.foodUnit.text = "\(calorie) Kcal"
                }
                else if let calorie = data.foodCandidates[0].nutrition?.calories {
                    // 식품 후보 중 첫 번째 식품의 칼로리 표시
                    cell.foodUnit.text = "\(calorie) Kcal"
                }
                
            }
        }
        return cell
    }
    
    // 특정 행이 선택되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startEditUIService()
    }
    
    var uiService : UIService? = nil
    var networkService : NetworkService? = nil

    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 초기 설정
        FoodLens.uiServiceMode = .userSelectedWithCandidates
        
        
        // UIService와 NetworkService 인스턴스 생성
        uiService = FoodLens.createUIService(appToken: "15fe634fd3064ccba3a3b27eb3eea75c", companyToken: "fd508cf1418a42808a54f0197646e058")
        networkService = FoodLens.createNetworkService(nutritionRetrieveMode: .allNutirition, appToken: "15fe634fd3064ccba3a3b27eb3eea75c", companyToken: "fd508cf1418a42808a54f0197646e058")
        
        // 현재 로케일 확인
        print(Locale.current)

        // 사용자의 우선 로케일을 가져오는 함수
        func getPreferredLocale() -> Locale {
            guard let preferredIdentifier = Locale.preferredLanguages.first else {
                return Locale.current
            }
            return Locale(identifier: preferredIdentifier)
        }
        
        // 사용자의 우선 로케일의 언어 코드 출력
        print(getPreferredLocale().languageCode)
    }
    
    // 카메라 UI 서비스 시작 버튼이 눌렸을 때 호출되는 메서드
    @IBAction func startCameraUIService(_ sender: Any) {
//        statusLabel?.text = ""
        Util.deleteDirectory(path : "foodlensStore")
//        uiService?.startCameraUIService(parent: self, completionHandler: self)
    }
    
    // 검색 UI 서비스 시작 버튼이 눌렸을 때 호출되는 메서드
    @IBAction func startSearchUIService(_ sender: Any) {
//        uiService?.startSearchUIService(parent: self, completionHandler: self)
    }
    
    // 갤러리 UI 서비스 시작 버튼이 눌렸을 때 호출되는 메서드
    @IBAction func startGalleryUIService(_ sender: Any) {
//        uiService?.startGalleryUIService(parent: self, completionHandler: self)
    }
    
    // 이미지 저장 및 파일 경로 반환하는 메서드
    func saveImage() -> String? {
        let path:String = "foodlensStore";  // 저장 경로의 폴더 이름을 설정합니다.
        let image = UIImage(named: "aa2c2043c2984529b77851d25c7bbf6c.jpg")  // 저장할 이미지를 가져옵니다.
        let filename = "aa2c2043c2984529b77851d25c7bbf6c.jpg"   // 이미지 파일의 이름을 설정합니다.
        
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!   // 이미지 저장 경로를 가져옵니다.
        
        var targetUrl:URL! = documentsUrl   // 실제 저장될 폴더의 URL을 설정합니다.
        
        targetUrl = documentsUrl.appendingPathComponent(path)   // 저장 경로에 폴더를 추가합니다.
        
        let fileURL = targetUrl.appendingPathComponent(filename)    // 저장될 파일의 URL을 설정합니다.
        
        if let imageData = image?.jpegData(compressionQuality: 1.0) {   // 이미지 데이터를 JPEG 형식으로 변환합니다.
            do {
                try FileManager.default.createDirectory(atPath: targetUrl.path, withIntermediateDirectories: true, attributes: nil) // 저장할 폴더를 생성합니다.
                try imageData.write(to: fileURL, options: .atomic)  // 이미지 데이터를 파일로 저장합니다.
                return fileURL.absoluteString // ----> Save fileName    // 파일의 절대 경로를 반환합니다. (파일명을 저장)
            }
            catch {
                print("Error saving image : \(error)")  // 이미지 저장 중에 오류가 발생한 경우 오류 메시지를 출력합니다.
            }
        }
        
        return nil  // 이미지 저장이 실패한 경우 nil을 반환합니다.
    }
    
    // 더미 데이터를 사용하여 편집 UI 서비스 시작하는 메서드
    @IBAction func startEditServiceWithDummy(_ sender: Any) {
        let mealData = PredictionResult()
        
        
        // 인식된 이미지의 경로 설정
        mealData.setRecognizedImagePath(saveImage()!)
        
        // 첫 번째 음식 데이터 추가
        var foodPosition = FoodPosition()
        var food = Food()
        food.foodName = "아욱된장국"
        var nutrition = Nutrition()
        nutrition.calories = 5000
        food.nutrition = nutrition
        foodPosition.imagePosition = Box()
        foodPosition.imagePosition?.xmin = 568
        foodPosition.imagePosition?.xmax = 1017
        foodPosition.imagePosition?.ymin = 442
        foodPosition.imagePosition?.ymax = 898
        foodPosition.foodCandidates.append(food)
        foodPosition.userSelectedFood = foodPosition.foodCandidates[0]
        mealData.putFoodPosition(foodPosition)
        
        // 두 번째 음식 데이터 추가
        foodPosition = FoodPosition()
        food = Food()
        food.foodName = "깍두기"
        nutrition = Nutrition()
        nutrition.calories = 5000
        food.nutrition = nutrition
        foodPosition.imagePosition = Box()
        foodPosition.imagePosition?.xmin = 758
        foodPosition.imagePosition?.xmax = 1018
        foodPosition.imagePosition?.ymin = 74
        foodPosition.imagePosition?.ymax = 345
        foodPosition.foodCandidates.append(food)
        foodPosition.userSelectedFood = foodPosition.foodCandidates[0]
        mealData.putFoodPosition(foodPosition)
        
        // 세 번째 음식 데이터 추가
        foodPosition = FoodPosition()
        food = Food()
        food.foodName = "고등어조림"
        nutrition = Nutrition()
        nutrition.calories = 5000
        food.nutrition = nutrition
        foodPosition.imagePosition = Box()
        foodPosition.imagePosition?.xmin = 400
        foodPosition.imagePosition?.xmax = 678
        foodPosition.imagePosition?.ymin = 177
        foodPosition.imagePosition?.ymax = 411
        foodPosition.foodCandidates.append(food)
        foodPosition.userSelectedFood = foodPosition.foodCandidates[0]
        mealData.putFoodPosition(foodPosition)
        
        // 네비게이션 바 테마 설정
        let navTheme = NavigationBarTheme(foregroundColor : UIColor.black, backgroundColor : UIColor.blue)
        
        // 툴바 테마 설정
        let toolbarTheme = ToolBarButtonTheme(backgroundColor: UIColor.brown, buttonTheme: ButtonTheme(backgroundColor: UIColor.cyan, textColor: UIColor.darkGray, borderColor: UIColor.gray))
        
        // 버튼 테마 설정
        let buttonTheme = ButtonTheme(backgroundColor: UIColor.green, textColor: UIColor.lightGray, borderColor: UIColor.magenta)
        
        // 위젯 버튼 테마 설정
        let widgetButtonTheme = ButtonTheme(backgroundColor: UIColor.orange, textColor: UIColor.purple, borderColor: UIColor.red)
        
        // UIService 인스턴스 생성 및 편집 UI 서비스 시작
        let uiService = FoodLens.createUIService(appToken: "15fe634fd3064ccba3a3b27eb3eea75c", companyToken: "fd508cf1418a42808a54f0197646e058", navigationBarTheme: navTheme, toolbarTheme: toolbarTheme, buttonTheme: buttonTheme,  widgetButtonTheme : widgetButtonTheme)
        uiService.startEditUIService(mealData, parent: self, completionHandler: self)
    }
    
    // 편집 UI 서비스 시작 메서드
    func startEditUIService() {
        guard let result = result else {
            return
        }
        
        let mealData = PredictionResult()
        mealData.setRecognizedImagePath(result.getRecognizedImage()!)   // 이미지 경로를 설정합니다.
        for elem in result.getFoodPositions() {
            mealData.putFoodPosition(elem)  // 음식 위치 정보를 추가합니다.
        }
        uiService?.startEditUIService(mealData, parent: self, completionHandler: self)
    }
    
    // 네트워크 서비스를 시작하는 액션 메서드
    @IBAction func startNetworkService(_ sender: Any) {
        // 상태 레이블 초기화
//        statusLabel.text = ""
//
        // "foodlensStore" 경로에 있는 디렉토리 삭제
        Util.deleteDirectory(path : "foodlensStore")
        
        // 이미지 피커 생성
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // 이미지 편집 비허용, 사진 라이브러리에서 선택
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        // 이미지 피커 모달로 표시
        present(imagePicker, animated: true, completion: nil)
    }
    
    // 갤러리에서 이미지 선택 시 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let pickedImage = info[.originalImage] as? UIImage,  // 선택된 이미지를 가져옵니다.
        let networkService = self.networkService {
//            statusLabel.text = "wait for response..."
            
            // 네트워크 서비스를 이용하여 이미지 예측을 요청합니다.
            networkService.predictMultipleFood(image: pickedImage) { (result : PredictionResult?, status : ProcessStatus) in
//                self.statusLabel.text = "completed"
                self.result = result    // 결과를 저장합니다.
                self.tableView.reloadData() // 테이블 뷰를 새로고침하여 데이터를 업데이트합니다.
            }
        }
    }
}

