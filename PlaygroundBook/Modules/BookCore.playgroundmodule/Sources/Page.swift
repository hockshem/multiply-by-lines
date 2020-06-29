//
//  Page.swift
//  BookCore
//
//  Created by Hock Shem Chong on 16/05/2020.
//

import Foundation

public enum Page {
    case pageOne
    case pageTwo
    case pageThree
    case pageFour
    case pageFive
}

public func correctAnswerForPage(page: Page) -> String {
    switch page {
    case .pageOne:
        return "169"
    case .pageTwo:
        return "26"
    case .pageThree:
        return "209"
    case .pageFour:
        return "2(x^2)+5xy+2(y^2)"
    case .pageFive:
        return ""
    }
}

public func answerUrlsForPage(page: Page) -> [URL?] {
    var urlsToReturn : [URL?] = []
    switch page {
    case .pageOne:
        urlsToReturn.append(contentsOf: [Bundle.main.url(forResource: "PageOneAnswer1", withExtension: "jpeg"), Bundle.main.url(forResource: "PageOneAnswer2", withExtension: "jpeg")])
    case .pageTwo:
        urlsToReturn.append(contentsOf: [Bundle.main.url(forResource: "PageTwoAnswer1", withExtension: "jpeg"), Bundle.main.url(forResource: "PageTwoAnswer2", withExtension: "jpeg"), Bundle.main.url(forResource: "PageTwoAnswer3", withExtension: "jpeg"), Bundle.main.url(forResource: "PageTwoAnswer4", withExtension: "jpeg")])
    case .pageThree:
        urlsToReturn.append(contentsOf: [Bundle.main.url(forResource: "PageThreeAnswer1", withExtension: "jpeg"), Bundle.main.url(forResource: "PageThreeAnswer2", withExtension: "jpeg"), Bundle.main.url(forResource: "PageThreeAnswer3", withExtension: "jpeg")])
    case .pageFour:
        urlsToReturn.append(contentsOf: [Bundle.main.url(forResource: "PageFourAnswer1", withExtension: "jpeg"), Bundle.main.url(forResource: "PageFourAnswer2", withExtension: "jpeg"), Bundle.main.url(forResource: "PageFourAnswer3", withExtension: "jpeg"), Bundle.main.url(forResource: "PageFourAnswer4", withExtension: "jpeg")])
    default:
        break
    }
    return urlsToReturn
}
