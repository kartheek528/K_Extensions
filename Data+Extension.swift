//
//  Data+Extension.swift
//
//  Created by Kartheek Boggarapu on 18/12/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

extension Data {
    private static let mimeTypeSignatures: [UInt8 : String] = [
        0xFF : "image/jpeg",
        0x89 : "image/png",
        0x47 : "image/gif",
        0x49 : "image/tiff",
        0x4D : "image/tiff",
        0x25 : "application/pdf",
        0x46 : "text/plain",
        0xD0 : "application/msword",
        0x50 : "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        ]

    var mimeType: String {
        var c: UInt8 = 0
        copyBytes(to: &c, count: 1)
        return Data.mimeTypeSignatures[c] ?? "application/octet-stream"
    }
}

struct DataType {
    static func ext(mime: String?) -> String {
        switch mime {
        case "image/jpeg":
            return ".jpeg"
        case "image/png":
            return ".png"
        case "application/pdf":
            return ".pdf"
        case "application/msword":
            return ".doc"
        case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
            return ".docx"
        default:
            break
        }
        return ""
    }
}

public extension Data {
    var fileExtension: String {
        var values = [UInt8](repeating:0, count:1)
        self.copyBytes(to: &values, count: 1)
        
        let ext: String
        switch (values[0]) {
        case 0xFF:
            ext = ".jpg"
        case 0x89:
            ext = ".png"
        case 0x47:
            ext = ".gif"
        case 0x49, 0x4D :
            ext = ".tiff"
        default:
            ext = ".png"
        }
        return ext
    }
}
