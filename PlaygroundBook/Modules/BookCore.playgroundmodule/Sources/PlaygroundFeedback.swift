//
//  PlaygroundFeedback.swift
//  BookCore
//
//  Created by Hock Shem Chong on 17/05/2020.
//

import Foundation

public func feedbackForPassingSubmission(page: Page) -> String {
    var feedback = ""
    switch page {
    case .pageOne:
        feedback = "### Perfect!\nWhoa! You are such a fast learner! [**Tap here**](@next) to find out how to deal with numbers with different digits!"
    case .pageTwo:
        feedback = "### Well Done!\nYou figured it out so quickly! [**Tap here**](@next) to learn multiplying large numbers!"
    case .pageThree:
        feedback = "### Great Job!\nYou made it again! [**Tap here**](@next) to look at some advanced applications of Multiply By Lines!"
    case .pageFour:
        feedback = "### Amazinggg!\nYou have completed all of the questions in this playground book! You should be proud of how amazing you are! Check out the [**last page**](@next) in this book :)"
    default:
        break
        
    }
    return feedback
}

public func feedbackAndSolutionForFailingSubmission(page: Page) -> (String, String) {
    let feedback = "### Woops!\nThe answer you submitted is incorrect. Please give it another try!"
    var solution = ""
    switch page {
    case .pageOne:
        solution = correctAnswerForPage(page: .pageOne)
    case .pageTwo:
        solution = correctAnswerForPage(page: .pageTwo)
    case .pageThree:
        solution = correctAnswerForPage(page: .pageThree)
    case .pageFour:
        solution = correctAnswerForPage(page: .pageFour)
    default:
        break
    }
    return (feedback,solution)
}
