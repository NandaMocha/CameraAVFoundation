//
//  DataManager.swift
//  CobaCamera
//
//  Created by Nanda Mochammad on 22/08/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import Foundation
import UIKit
import CloudKit


class DataManager{
    
    static let shared = DataManager()
    private init (){}
    
    func getDirectoryPath() -> String {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("CobaCamera")
        //print("path: \(path)")
        return path
    }
    
    func savePhoto(image: UIImage, date: String) {
        let imageName = "Sampah Pict_\(date)"
        print("saving imageName: \(imageName)")
        saveImageToDisk(image: image, imageName: imageName)
    }
    
//    func uploadCloudKit(image : UIImage){
//        let data = image.pngData()!
//        let url = NSURL(absoluteURLWithDataRepresentation: data, relativeTo: <#T##URL?#>)
//    }
    
    func saveImageToDisk(image: UIImage, imageName: String) {
        let fileManager = FileManager.default
        let path = getDirectoryPath()
        // Make sure the directory exists
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let pathUrl = URL(string: path)
        let imagePath = pathUrl!.appendingPathComponent(imageName)
        let urlString: String = imagePath.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.5)
        fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
    
}
