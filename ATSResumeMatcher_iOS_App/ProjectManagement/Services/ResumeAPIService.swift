//
//  APIServices.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

struct ResumeAPIService {
    
    // MARK: - Base URL
    private let baseURL = URL(string: "")!
    
    //  MARK: - Analyze Resume API Call
    func analyzeResume(
        pdfData: Data,
        fileName: String,
        jobDescription: String
    ) async throws -> AnalysisResponse {
        
        let url = baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("resume")
            .appendingPathComponent("analyze")
        
        // Create unique multipart boundary
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = createMultipartBody(
            pdfData: pdfData,
            fileName: fileName,
            jobDescription: jobDescription,
            boundary: boundary
        )
        
        //  URLSession Request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Validate HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ResumeAPIError.invalidResponse
        }
        
        // Check status code
        guard (200...299).contains(httpResponse.statusCode) else {
            
            ///  Check Server Error with Custom ENUM Error response model
            if let serverError = try? JSONDecoder().decode(VaporErrorResponse.self, from: data) {
                throw ResumeAPIError.server(serverError.reason ?? "Something went wrong.")
            }
            
            throw ResumeAPIError.httpStatus(httpResponse.statusCode)
        }
        
        // Decode successful response
        do {
            return try JSONDecoder().decode(AnalysisResponse.self, from: data)
        } catch {
            print("Error ==> \(error.localizedDescription)")
            throw ResumeAPIError.decodingFailed(error)
        }
    }
    
    
    // MARK: - Multipart Body
    private func createMultipartBody(
        pdfData: Data,
        fileName: String,
        jobDescription: String,
        boundary: String
    ) -> Data {
        
        var body = Data()
        
        func appendText(_ text: String) {
            body.append(Data(text.utf8))
        }
        
        let safeFileName = fileName.replacingOccurrences(of: "\"", with: "")
        
        // PDF field
        appendText("--\(boundary)\r\n")
        
        appendText("Content-Disposition: form-data; name=\"resume\"; filename=\"\(safeFileName)\"\r\n")
        appendText("Content-Type: application/pdf\r\n\r\n")
        body.append(pdfData)
        
        appendText("\r\n")
        
        // Job description field
        appendText("--\(boundary)\r\n")
        appendText("Content-Disposition: form-data; name=\"job_description\"\r\n\r\n")
        appendText(jobDescription)
        
        appendText("\r\n")
        
        // End multipart body
        appendText("--\(boundary)--\r\n")
        
        return body
    }
}
