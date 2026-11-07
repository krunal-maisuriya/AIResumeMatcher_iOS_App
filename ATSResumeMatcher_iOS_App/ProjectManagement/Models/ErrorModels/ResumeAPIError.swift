//
//  ResumeAPIError.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

enum ResumeAPIError: LocalizedError {
    case invalidResponse
    case httpStatus(Int)
    case server(String)
    case decodingFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid server response."
            
        case .httpStatus(let code):
            return "Server error. Status code: \(code)"
        
        case .server(let message):
            return message
            
        case .decodingFailed(let error):
            return "Unable to decode response: \(error.localizedDescription)"
        }
    }
}
