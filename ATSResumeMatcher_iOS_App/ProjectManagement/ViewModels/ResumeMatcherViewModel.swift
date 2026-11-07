//
//  ResumeMatcherViewModel.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation
import Observation

@Observable
@MainActor
final class ResumeMatcherViewModel {
    
    var selectedFileName: String?
    var pdfData: Data?
    var jobDescription: String = ""
    var pdfSize: String = ""
    
    
    var analysisResult: AnalysisResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiService = ResumeAPIService()
    
    
    //  MARK: -  Load PDF File
    func loadPDF(from url: URL) async {
        let accessGranted = url.startAccessingSecurityScopedResource()
        
        defer {
            if accessGranted {
                url.stopAccessingSecurityScopedResource()
            }
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            
            // Validate PDF signature
            guard String(data: data.prefix(5), encoding: .ascii) == "%PDF-" else {
                errorMessage = "Please select a valid PDF file."
                return
            }
            
            // Validate file size (10 MB)
            guard data.count <= 10 * 1024 * 1024 else {
                errorMessage = "PDF must be smaller than 10 MB."
                return
            }
            
            pdfData = data
            selectedFileName = url.lastPathComponent
            pdfSize = getPDFFileSize(url: url) ?? ""
            
            print("Selected PDF URL:", url)
            print("PDF Name:", selectedFileName ?? "")
            print("pdfSize:", pdfSize)

            
            analysisResult = nil
            errorMessage = nil
            
        } catch {
            errorMessage = "Unable to read PDF: \(error.localizedDescription)"
        }
    }
    
    // MARK: - Analyze Resume API Call
    func analyzeResume() async {
        guard let pdfData else {
            errorMessage = "Please select a resume PDF."
            return
        }
        
        let jobDesc = jobDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !jobDesc.isEmpty else {
            errorMessage = "Please enter a job description."
            return
        }
        
        guard jobDesc.count <= 20_000 else {
            errorMessage = "Job description is too long."
            return
        }
        
        isLoading = true
        errorMessage = nil
        analysisResult = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let result = try await apiService.analyzeResume(
                pdfData: pdfData,
                fileName: selectedFileName ?? "resume.pdf",
                jobDescription: jobDesc
            )
            
            analysisResult = result            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    //  GET PDF FILE SIZE
    func getPDFFileSize(url: URL) -> String? {
        do {
            let resourceValues = try url.resourceValues(forKeys: [.fileSizeKey])

            if let fileSize = resourceValues.fileSize {
                let formatter = ByteCountFormatter()
                formatter.allowedUnits = [.useKB, .useMB]
                formatter.countStyle = .file
                return formatter.string(fromByteCount: Int64(fileSize))
            }
        } catch {
            print("Error getting PDF size:", error.localizedDescription)
        }

        return nil
    }
}
