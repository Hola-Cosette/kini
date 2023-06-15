//
//  Util.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/14.
//

//
//  Util.swift
//  FoodLensTestApp
//
//  Created by HwangChun Lee on 02/04/2019.
//  Copyright © 2019 DoingLab Inc. All rights reserved.
//

import Foundation
import UIKit

class Util {
    static func save(image: UIImage, path:String?, fileName:String) -> String? {    // 이미지를 저장하는 메서드입니다.
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!   // 파일 매니저를 사용하여 문서 디렉토리의 URL을 가져옵니다.
        
        var targetUrl:URL! = documentsUrl   // 대상 URL을 문서 디렉토리 URL로 초기화합니다.
        if path != nil {    // 경로가 제공된 경우
            targetUrl = documentsUrl.appendingPathComponent(path!)  // 대상 URL에 추가 경로 컴포넌트를 추가합니다.
        }
        
        let fileURL = targetUrl.appendingPathComponent(fileName)    // 대상 URL에 파일 이름 컴포넌트를 추가하여 파일 URL을 생성합니다.
        
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {    // 이미지 데이터를 JPEG 형식으로 변환합니다.    // 파일의 전체 경로(절대 경로)
            do {
                // 저장할 디렉토리 생성
                try FileManager.default.createDirectory(atPath: targetUrl.path, withIntermediateDirectories: true, attributes: nil) // 대상 디렉토리를 생성합니다. 하위 디렉토리도 생성할 수 있도록 옵션을 설정합니다.
                // 이미지 데이터를 파일로 저장
                try imageData.write(to: fileURL, options: .atomic)  // 이미지 데이터를 파일로 쓰기 위해 `write` 메서드를 사용합니다. `.atomic` 옵션을 통해 원자적인 쓰기 작업을 수행합니다.
                return fileURL.absoluteString // ----> Save fileName    // 파일의 절대 경로를 반환합니다. (파일 이름만 반환하는 것이 아닌, 전체 경로를 반환합니다.)
            }
            catch {
                print("Error saving image : \(error)")  // 이미지 저장 중에 에러가 발생한 경우 에러 메시지를 출력합니다.
            }
        }
        //print("Error saving image")
        return nil  // 이미지 저장이 실패한 경우 nil을 반환합니다.
    }
    
    static func load(path:String?, fileName:String) -> UIImage? {   // 이미지를 로드하는 메서드입니다.
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!   // 파일 매니저를 사용하여 문서 디렉토리의 URL을 가져옵니다.
        var targetUrl:URL! = documentsUrl   // 대상 URL을 문서 디렉토리 URL로 초기화합니다.
        if path != nil {    // 경로가 제공된 경우
            targetUrl = documentsUrl.appendingPathComponent(path!)  // 대상 URL에 추가 경로 컴포넌트를 추가합니다.
        }
        
        let fileURL = targetUrl.appendingPathComponent(fileName)    // 대상 URL에 파일 이름 컴포넌트를 추가하여 파일 URL을 생성합니다.
        do {
            // 파일에서 데이터를 읽어와 UIImage로 변환
            let imageData = try Data(contentsOf: fileURL)   // 파일 URL에서 데이터를 읽어옵니다.
            return UIImage(data: imageData) // 읽어온 데이터를 UIImage로 변환하여 반환합니다.
        } catch {
            print("Error loading image : \(error)") // 이미지 로딩 중에 에러가 발생한 경우 에러 메시지를 출력합니다.
        }
        return nil  // 이미지 로딩이 실패한 경우 nil을 반환합니다.
    }
    
    static func deleteDirectory(path : String?) {   // 디렉토리를 삭제하는 메서드입니다.
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var dataPath:URL
        if path != nil {
            dataPath = documentsUrl.appendingPathComponent(path!)
        } else {
            dataPath = documentsUrl
        }
        
//        do {
//            // 디렉토리 삭제
//            try FileManager.default.removeItem(atPath: dataPath.path)
//        } catch {
//            print("Could not clear temp folder: \(error)")
//        }
        if FileManager.default.fileExists(atPath: dataPath.path) {
            // 디렉토리가 존재하는 경우에만 삭제 시도
            do {
                try FileManager.default.removeItem(atPath: dataPath.path)
            } catch {
                print("Could not clear temp folder: \(error)")
            }
        } else {
            print("no folder")
        }
    }
}
