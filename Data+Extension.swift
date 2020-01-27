//
//  Data+Extension.swift
//  Legendary
//
//  Created by Kartheek Boggarapu on 18/12/19.
//  Copyright © 2019 Soffice. All rights reserved.
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
