//
//  Similarity.swift
//  BookCore
//
//  Created by Hock Shem Chong on 17/05/2020.
//

import Foundation
import Vision
import UIKit


class FeatureObservationManager {
    var featureObservationsForAnswers: [Page: [VNFeaturePrintObservation]] = [:]
    let pages: [Page] = [.pageOne, .pageTwo, .pageThree, .pageFour, .pageFive]
    
    init() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.computeAnswerFeatureObservations()
        }
    }
    
    private func computeAnswerFeatureObservations() {
        for page in self.pages {
            let answerURLs = answerUrlsForPage(page: page)
            
            for answerUrl in answerURLs {
                guard let answerUrl = answerUrl, let answerFPO = self.featureObservationForImage(atURL: answerUrl)
                    else { continue }
            
                if self.featureObservationsForAnswers[page] == nil {
                    self.featureObservationsForAnswers[page] = []
                }
                
                self.featureObservationsForAnswers[page]?.append(answerFPO)
            }
        }
    }
    
    private func featureObservationForImage(atURL url: URL) -> VNFeaturePrintObservation? {
        let requestHandler = VNImageRequestHandler(url: url, options: [:])
        let request = VNGenerateImageFeaturePrintRequest()
        do {
            try requestHandler.perform([request])
            return request.results?.first as? VNFeaturePrintObservation
        } catch {
            print("Vision error: \(error)")
            return nil
        }
    }
    
    func computeSimilarityToAnswer(forPage page: Page, userDrawnImage: UIImage, completion: @escaping (Float) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageData = userDrawnImage.jpegData(compressionQuality: 1.0) else { return }
            let baseURL = FileManager.default.temporaryDirectory
            let imageURL = baseURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("jpeg")
            
            do {
                try imageData.write(to: imageURL)
            } catch {
                print("Error writing to image.")
                return
            }
            
            let submissionFPO = self.featureObservationForImage(atURL: imageURL)
            
            guard let answerFPOs = self.featureObservationsForAnswers[page] else { return }
            
            var distanceFloats : [Float] = []
            for answerFPO in answerFPOs {
                var distance = Float(0)
                do {
                    try submissionFPO?.computeDistance(&distance, to: answerFPO)
                } catch {
                    print("Error computing distance between featureprints.")
                    return
                }
                distanceFloats.append(distance)
            }
            
            DispatchQueue.main.async {
                guard let distanceFloat = distanceFloats.sorted().first else { return }
                completion(distanceFloat)
            }
        }
    }
}

