//
//  imageViewModel.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/08/02.
//

import Foundation
import UIKit
import FirebaseStorage


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var label    : UILabel!
    // 이렇게 하면 저기 위에 있는 것을 볼 수 있게 된다고 한다.
    
    private let storage = Storage.storage().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
        
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL (string: urlString) else{
            return
            }
        
        label.text = urlString
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQoS.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        })
        
        task.resume()
        
    }
    
    
    
    
        @IBAction func didTapButton(){
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true)
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        //upload image data
        //get download url
        // save download url to userDefaults
        
        
        storage.child("images/file.png").putData(imageData, metadata: nil, completion :{ _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            self.storage.child("images/file.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else{
                    return
                }
                let urlString = url.absoluteString
                
                DispatchQueue.main.async{
                    self.label.text = urlString
                    self.imageView.image = image
                }
                
                print("download url : \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
    }

    //picker 가 cancel 될때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}

