//
//  SkinAIController.swift
//  PuppyDisease
//
//  Created by Herry on 2023/03/12.
//

import Foundation
import UIKit
import CoreML
import Vision

class SkinAIController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.editedImage] as? UIImage{
            imageView.image = userPickedImage
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("이미지 변환 실패")
            }
            
            detect(image: ciImage)
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func detect(image: CIImage) {
        // CoreML의 모델인 FlowerClassifier를 객체를 생성 후,
        // Vision 프레임워크인 VNCoreMLModel 컨터이너를 사용하여 CoreML의 model에 접근
        guard let model = try? VNCoreMLModel(for: PuppyClassification().model) else {
            fatalError("Could not load Model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
                   guard let results = request.results as? [VNClassificationObservation] else {
                       fatalError("model failed to process image")
                   }
            
            if let firstResult = results.first {
                if firstResult.identifier.contains("결절"){
                    self.navigationItem.title = "결절입니다"
                } else if firstResult.identifier.contains("구진") {
                    self.navigationItem.title = "구진입니다."}
                } else {
                self.navigationItem.title = "못찾음"
            }
            
               }
               
               let handler =  VNImageRequestHandler(ciImage: image)
               
               do {
                   try handler.perform([request])
               } catch {
                   print(error)
               }
        
    }
        

        
        @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
            
            present(imagePicker, animated: true, completion: nil)
        }
    
}
