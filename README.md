# 🚀 AI-Powered Resume Analyzer (iOS)
An AI-powered Resume Analyzer iOS application built using **SwiftUI, MVVM Architecture, Swift Vapor, and Google Gemini AI**. It helps job seekers evaluate their resumes against job descriptions, analyze their skills and experience, and receive AI-generated recommendations to improve their chances of getting shortlisted.

The application uses a custom-built **Swift Vapor REST API backend** integrated with **Google's Gemini AI** to extract PDF resume content, perform intelligent analysis, and calculate an overall resume match percentage.

[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://www.swift.org/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/uikit)
[![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
![MVVM](https://img.shields.io/badge/MVVM-6C63FF?style=for-the-badge)
![URLSession](https://img.shields.io/badge/URLSession-007AFF?style=for-the-badge&logo=apple&logoColor=white)
![Swift Concurrency](https://img.shields.io/badge/Swift_Concurrency-FA7343?style=for-the-badge&logo=swift&logoColor=white)
[![REST API](https://img.shields.io/badge/REST_API-009688?style=for-the-badge)](https://restfulapi.net/)
[![Vapor](https://img.shields.io/badge/Vapor-Backend-0D0D0D?style=for-the-badge&logo=vapor&logoColor=white)](https://vapor.codes/)
[![Google Gemini AI](https://img.shields.io/badge/Google_Gemini-AI_Integration-4285F4?style=for-the-badge&logo=googlegemini&logoColor=white)](https://ai.google.dev/)

## 📖  Overview
* AI-Powered Resume Analyzer is an iOS application designed in SwiftUI to help job seekers understand how well their resumes match a particular job description.
* The iOS application communicates with **Swift Vapor backend**, which **extracts resume content**, **processes the information**, and **integrates with Google's Gemini AI** to generate meaningful analysis.
* Calculates the final resume match percentage based on three major categories:
    | Analysis Category | Weight |
    |:---:|:---|
    | Skills Match | 50% |
    | Experience Match | 30% |
    | Projects Match | 20% |

## 📱  Screenshots & Video
#### 🎥 Application Demo
[▶ Watch AI-Powered Resume Matcher App Demo](https://github.com/krunal-maisuriya/AIResumeMatcher_iOS_App/releases/download/v1.0-demo/Screen.Recording.iPhone.18.Pro.07-11-2026.at.12.35.28.PM.mp4)

#### 📸 Application Screenshots
<img width="200" height="440" alt="Resume Matcher Screenshot1" src="https://github.com/user-attachments/assets/0f0b5009-a8bf-4331-91fc-4fbfb83c4e82" />
<img width="200" height="440" alt="Resume Matcher Screenshot2" src="https://github.com/user-attachments/assets/94fc6f5e-6592-4ab9-842d-b7e56d0cdcd5" />

## ✨ Features
1. Job Description Input
2. PDF Resume Upload
3. Gemini-Powered Resume Analysis
4. Weighted Resume Match Percentage
5. Skills, Experience & Project Evaluation
6. Overall Match Score Display
7. SwiftUI-Based User Interface
8. REST API Backend Integration

## 🛠 Tech Stack
#### iOS Application
* Swift
* SwiftUI
* MVVM Architecture - (Model, View, ViewModel)
* URLSession
* Swift Concurrency (async/await)
* REST API Integration
* JSON Encoding/Decoding (Codable)

#### Backend
* Swift & Swift Vapor Framework
* RESTful API Development
* Multipart File Upload
* PDF Text Extraction
* Google Gemini API Integration
* JSON Response Handling

#### AI Integration
* Google Gemini AI
* AI-powered resume evaluation
* Skills matching
* Experience analysis
* Project analysis
* Personalized improvement recommendations

## 🏗 System Architecture
The application follows a client-server architecture:

          ┌──────────────────────────────┐
          │        iOS Application       │
          │                              │
          │       SwiftUI Views          │
          │             ↓                │
          │       MVVM Architecture      │
          │             ↓                │
          │       API Service            │
          │       (URLSession)           │
          └──────────────┬───────────────┘
                         ↓
          ┌──────────────────────────────┐
          │      Swift Vapor Backend     │
          │                              │
          │       REST API               │
          │             ↓                │
          │       PDF Extraction         │
          │             ↓                │
          │       Gemini AI API          │
          │             ↓                │
          │       Resume Analysis        │
          │             ↓                │
          │       JSON Response          │
          └──────────────┬───────────────┘
                         ↓
          ┌──────────────────────────────┐
          │       iOS Application        │
          │              ↓               │
          │    Detailed Analysis UI      │
          └──────────────────────────────┘

## 🚀 Getting Started
#### Prerequisites
* Xcode 16+
* iOS 18+
* Swift 6 (if required by the project configuration)
* A running Swift Vapor backend

#### Installation
* Clone the repository:
  ```bash
  git clone https://github.com/krunal-maisuriya/AIResumeMatcher_iOS_App.git
  ```
* Navigate to the project directory:
  ```bash
  cd ATSResumeMatcher_iOS_App
  ```
* Open the Xcode project:
  ```bash
  open ATSResumeMatcher_iOS_App.xcodeproj
  ```
* Build and run the application using Xcode Simulator or a physical iOS device.

**Note:** This project requires a running instance of the Swift Vapor backend. 
The backend is currently configured for local development and has not yet been deployed to a public server.

## 🎯 Key Highlights
* Built with modern SwiftUI development practices
* PDF document upload and text extraction.
* Custom REST API backend developed using Swift Vapor.
* Google Gemini AI integration for intelligent resume analysis.
* AI-powered skills, experience, and project evaluation.
* Asynchronous networking using URLSession and async/await.
* Clean MVVM architecture.
* Structured API response handling using Codable.

## 🔮 Future Enhancements
* Job description matching with multiple resumes.
* AI-powered cover letter generation.
* Resume improvement suggestions.
* Resume history and saved analysis.
* Advanced ATS compatibility analysis.

## 📊 GitHub Repository Stats
<p align="left">
  <img src="https://img.shields.io/github/stars/krunal-maisuriya/AIResumeMatcher_iOS_App?style=for-the-badge&logo=github&label=Stars" alt="GitHub Stars" />
  <img src="https://img.shields.io/github/forks/krunal-maisuriya/AIResumeMatcher_iOS_App?style=for-the-badge&logo=github&label=Forks" alt="GitHub Forks" />
  <img src="https://img.shields.io/github/watchers/krunal-maisuriya/AIResumeMatcher_iOS_App?style=for-the-badge&logo=github&label=Watchers" alt="GitHub Watchers" />
    <img src="https://hits.dwyl.com/krunal-maisuriya/AIResumeMatcher_iOS_App.svg?style=flat-square&show=total" alt="Repository Views" />
</p>

## 👨‍💻 Connect With Me
**Krunal Maisuriya**<br>
Senior iOS Developer | Mobile Application Developer - Flutter

<p align="left">
  <a href="https://github.com/krunal-maisuriya">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
  </a>
  <a href="https://www.linkedin.com/in/krunal-maisuriya/">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
  </a>
</p>

##
⭐ If you find this project interesting, don't forget to star the repository!
