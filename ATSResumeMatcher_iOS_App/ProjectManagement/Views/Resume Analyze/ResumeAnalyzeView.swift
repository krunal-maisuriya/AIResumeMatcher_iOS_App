//
//  ResumeAnalyzeView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 04/11/2026.
//

import SwiftUI
import UniformTypeIdentifiers

struct ResumeAnalyzeView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var resumeViewModel = ResumeMatcherViewModel()
    
    @State private var isChoosedResume: Bool = false

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView {
                    
                    ///  JOB DESCRIPTION
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Job Description")
                            .font(.system(size: 18, weight: .bold))
                        
                        ZStack(alignment: .topLeading) {
                            if resumeViewModel.jobDescription.isEmpty {
                                Text("Enter Job Description")
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                            }
                            
                            TextEditor(text: $resumeViewModel.jobDescription)
                                .scrollContentBackground(.hidden)
                                .background(.clear)
                        }
                        .padding(10)
                        .frame(height: 280)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray.opacity(0.15))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(colorScheme == .dark ? .white.opacity(0.7) : .black.opacity(0.7), lineWidth: 1)
                                )
                        )
                    }
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    
                    ///  RESUME UPLOAD
                    VStack(alignment: .leading) {
                        Text("Upload Your Resume")
                            .font(.system(size: 18, weight: .bold))
                        
                        VStack {
                            Button {
                                isChoosedResume = true
                            } label: {
                                VStack(spacing: 5) {
                                    Image(systemName: "icloud.and.arrow.up")
                                        .resizable()
                                        .scaledToFit()
                                        .font(.system(size: 15, weight: .semibold))
                                        .frame(width: 35, height: 35)
                                        .padding(.bottom, 15)
                                    
                                    Text("Upload PDF Resume")
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Text("PDF format · Maximum 10 MB")
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(0.6)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(colorScheme == .dark ? .white : .black,
                                                      style: StrokeStyle(lineWidth: 1.5, dash: [8, 5]))
                                }
                        }
                        
                        if let fileName = resumeViewModel.selectedFileName {
                            SelectedResumeView(
                                fileName: fileName,
                                fileSize: resumeViewModel.pdfSize,
                                removeAction: {
                                    resumeViewModel.selectedFileName = nil
                                    resumeViewModel.pdfData = nil
                                    resumeViewModel.pdfSize = ""
                                    resumeViewModel.analysisResult = nil
                                    
                                    isChoosedResume = false
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button {                        
                        Task {
                            await resumeViewModel.analyzeResume()
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Spacer()
                            
                            if (resumeViewModel.isLoading) {
                                ProgressView().tint(.white)
                                Text("Analyzing...")
                            } else {
                                Image(systemName: "sparkles")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                Text("Analyze My Resume")
                            }
                            Spacer()
                        }
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(colorScheme == .dark ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }
                    .frame(height: 55)
                    .background(Capsule().fill(colorScheme == .dark ? .white : .black))
                    .frame(maxWidth: .infinity)
                    .glassEffect()
                    .padding(.vertical, 15)
                    .buttonStyle(.plain)
                    .padding(.horizontal)
                    .disabled(resumeViewModel.isLoading
                              || resumeViewModel.pdfData == nil
                              || resumeViewModel.jobDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    )
                }
            }
            .background(AppColors.backgroundColor)
            .navigationTitle("AI Resume Matcher")
            .navigationBarTitleDisplayMode(.inline)
            .fileImporter(
                isPresented: $isChoosedResume,
                allowedContentTypes: [.pdf],
                allowsMultipleSelection: false
            ) { result in
                
                switch result {
                case .success(let urls):
                    guard let url = urls.first else { return }
                    
                    Task {
                        await resumeViewModel.loadPDF(from: url)
                    }
                                        
                case .failure(let error):
                    print("PDF selection failed:", error.localizedDescription)
                    resumeViewModel.errorMessage = error.localizedDescription
                }
            }
            .alert(
                "Validation Message",
                isPresented: Binding(
                    get: { resumeViewModel.errorMessage != nil },
                    set: { isPresented in
                        if !isPresented {
                            resumeViewModel.errorMessage = nil
                        }
                    }
                )
            ) {
                Button("OK", role: .cancel) {
                    resumeViewModel.errorMessage = nil
                }
            } message: {
                Text(resumeViewModel.errorMessage ?? "")
            }
            .navigationDestination(
                isPresented: Binding(
                    get: { resumeViewModel.analysisResult != nil },
                    set: { isPresented in
                        if !isPresented {
                            resumeViewModel.analysisResult = nil
                        }
                    })
            ) {
                if let result = resumeViewModel.analysisResult {
                    ResumeAnalyzeResultView(analyzeResult: result)
                }
            }
        }
    }
}

#Preview {
    ResumeAnalyzeView()
}
