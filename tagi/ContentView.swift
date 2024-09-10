//
//  ContentView.swift
//  tagi
//
//  Created by Sadık İzgi on 10.09.2024.
//

import SwiftUI
import PDFKit   // Eğer PDFKit kullanıyorsak
import AVFoundation  // Eğer AVFoundation kullanıyorsak

struct PDFViewController: UIViewRepresentable {
    let pdfDocument: PDFDocument?

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        if let pdfURL = Bundle.main.url(forResource: "example", withExtension: "pdf"),
           let pdfDocument = PDFDocument(url: pdfURL) {
            PDFViewController(pdfDocument: pdfDocument)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("PDF Bulunamadı")
        }
    }
}
