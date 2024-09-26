//
//  YuGiOhTests.swift
//  YuGiOhTests
//
//  Created by Marko Sentivanac on 15.8.24..
//

import XCTest
import TinyNetworking

@testable import YuGiOh

final class YuGiOhTests: XCTestCase {
    
    func testGetAllCards() async {
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolMock.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let tinyNetworking = TinyNetworking<APIRequest>(stubbedSession: mockSession)
        
        AppDependenciesContainer.register(type: TinyNetworking<APIRequest>.self, tinyNetworking)
        
        let url = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php?")
        
        let jsonEnc = JSONEncoder()
        let data = try! jsonEnc.encode(CardData(data: [
            Card(id: 0, name: "testcard", desc: "testcardaaa", cardImages: [CardImage(id: 0, imageURL: "test", imageURLSmall: "test", imageURLCropped: "test")], type: "test")
        ]))
        let response = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolMock.mockURLs[url] = (nil, data, response)
        
        let sut = HomeViewModel()
        
        let expectation1 = XCTestExpectation()
        
        await sut.getAllCards()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            XCTAssertNotNil(sut.allCards.first(where: { $0.name == "testcard" } ))
            
            expectation1.fulfill()
            
        }
        
        wait(for: [expectation1], timeout: 5.0)
    }
}
