//
//  banquemisr_challenge05UITests.swift
//  banquemisr.challenge05UITests
//
//  Created by Mahmoud Abd ElAziz on 05/02/2025.
//

import XCTest

final class banquemisr_challenge05UITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

     override func setUp() {
         super.setUp()
         continueAfterFailure = false
         app = XCUIApplication()
         app.launch()
     }

     override func tearDown() {
         app = nil
         super.tearDown()
     }
    
    
    func moviesTableViewExistsAndLoadsData() {
        let tableView = app.tables["MoviesTableView"]
        XCTAssertTrue(tableView.waitForExistence(timeout: 5), "Movies table view exist")
        XCTAssertGreaterThan(tableView.cells.count, 0, "Table view loaded movies")
    }
    
    
    
}
