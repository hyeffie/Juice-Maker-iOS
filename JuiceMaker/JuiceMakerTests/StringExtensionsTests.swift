//
//  StringExtensionsTests.swift
//  JuiceMakerTests
//
//  Created by Effie on 12/12/23.
//

import XCTest

final class StringExtensionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUppercasedFirst() throws {
        let input = "effie"
        let output = "Effie"
        let target = input.uppercasedFirst()
        XCTAssertEqual(target, output, "문자열 uppercasing 실패")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

struct SearchQueryCache {
    private let userDefaults: UserDefaults
    
    private let queryKey = "query"
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func storeQuery(_ query: String) {
        self.userDefaults.set(query, forKey: self.queryKey)
    }
    
    func searchQuery(_ query: String) -> String? {
        return self.userDefaults.string(forKey: queryKey)
    }
}

final class SearchQueryCacheTests: XCTestCase {

    private var userDefaults: UserDefaults!
    private var userDefaultsSuiteName: String!

    override func setUpWithError() throws {
        try super.setUpWithError()
        userDefaultsSuiteName = UUID().uuidString
        userDefaults = UserDefaults(suiteName: userDefaultsSuiteName)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        userDefaults.removeSuite(named: userDefaultsSuiteName)
        userDefaults = nil
    }

    func testSearchQueryStoring() {
        /// Use the generated user defaults as input:
        let cache = SearchQueryCache(userDefaults: userDefaults)
        cache.storeQuery(userDefaultsSuiteName)
        let result = cache.searchQuery(userDefaultsSuiteName)
        XCTAssertNotNil(result)
    }
}
