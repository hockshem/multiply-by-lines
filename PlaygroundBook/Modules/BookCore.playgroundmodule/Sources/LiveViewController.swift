//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport
import PencilKit

@objc(BookCore_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    @IBOutlet weak var canvasView: PKCanvasView!
    
    var bookPage: Page?
    var lastAnswerSubmitted: String?
    var featureObservationManager: FeatureObservationManager?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        self.canvasView.addGestureRecognizer(longPressRecognizer)
        self.featureObservationManager = FeatureObservationManager()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let window = view.window, let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: self.canvasView)
            toolPicker.addObserver(self.canvasView)
            self.canvasView.becomeFirstResponder()
        }
    }
    
    public func liveViewMessageConnectionClosed() {
        guard let currentPage = self.bookPage, let submission = self.lastAnswerSubmitted, !self.canvasView.drawing.bounds.isNull else {
            return
        }
        
        let imageBounds = self.canvasView.drawing.bounds
        let userDrawnImage = self.canvasView.drawing.image(from: imageBounds, scale: 1.0)
        
        self.featureObservationManager?.computeSimilarityToAnswer(forPage: currentPage, userDrawnImage: userDrawnImage) { deviation in
            let tolerance: Float = 13.0
            if deviation >= tolerance {
                PlaygroundPage.current.assessmentStatus = .fail(hints: ["It seems like your drawings isn't accurate enough...Try using a ruler!", "Current deviation from the correct answer: \(deviation) (must be below \(tolerance))"], solution: nil)
                return
            }
            
            let correctAnswer = correctAnswerForPage(page: currentPage)
            
            if submission != correctAnswer {
                let (feedback, solution) = feedbackAndSolutionForFailingSubmission(page: currentPage)
                PlaygroundPage.current.assessmentStatus = .fail(hints: [feedback], solution: solution)
                return
            }
            PlaygroundPage.current.assessmentStatus = .pass(message: feedbackForPassingSubmission(page: currentPage))
        }
    }
    
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case .string(let answer):
            self.lastAnswerSubmitted = answer
        default:
            break
        }
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let alertController = UIAlertController(title: "Clear Drawings", message: "Are you sure to clear your drawings?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in self.dismiss(animated: true, completion: { self.canvasView.becomeFirstResponder() }) }
            let clearAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in self.clearDrawings() }
            alertController.addAction(clearAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func clearDrawings() {
        self.canvasView.drawing = PKDrawing()
        self.canvasView.becomeFirstResponder()
    }
}


