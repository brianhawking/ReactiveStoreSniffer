//
//  MockData.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation

let mockEntries: [Entry] = [
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3600), eventType: "action", featureName: "Authentication", summary: "Request login action dispatched", details: .action(ActionDetails(actionType: "requestLogin", payload: "{\"username\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3500), eventType: "action", featureName: "Authentication", summary: "Login success action dispatched", details: .action(ActionDetails(actionType: "loginSuccess", payload: "{\"username\": \"user1\", \"token\": \"abcd1234\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3550), eventType: "log", featureName: "Authentication", summary: "Request login log", details: .log(LogDetails(logLevel: "info", logMessage: "User requested login"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3450), eventType: "log", featureName: "Authentication", summary: "Login success log", details: .log(LogDetails(logLevel: "info", logMessage: "User login successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3400), eventType: "action", featureName: "Profile", summary: "Request profile action dispatched", details: .action(ActionDetails(actionType: "requestProfile", payload: "{\"userId\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3300), eventType: "action", featureName: "Profile", summary: "Profile request succeeded action dispatched", details: .action(ActionDetails(actionType: "profileSuccess", payload: "{\"userId\": \"user1\", \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3350), eventType: "log", featureName: "Profile", summary: "Request profile log", details: .log(LogDetails(logLevel: "info", logMessage: "Profile request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3250), eventType: "log", featureName: "Profile", summary: "Profile request succeeded log", details: .log(LogDetails(logLevel: "info", logMessage: "Profile request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3200), eventType: "action", featureName: "Account Balance", summary: "Request account balance action dispatched", details: .action(ActionDetails(actionType: "requestBalance", payload: "{\"accountId\": \"acc123\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3100), eventType: "action", featureName: "Account Balance", summary: "Account balance request succeeded action dispatched", details: .action(ActionDetails(actionType: "balanceSuccess", payload: "{\"accountId\": \"acc123\", \"balance\": 1000.0, \"currency\": \"USD\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3150), eventType: "log", featureName: "Account Balance", summary: "Request account balance log", details: .log(LogDetails(logLevel: "info", logMessage: "Account balance request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3050), eventType: "log", featureName: "Account Balance", summary: "Account balance request succeeded log", details: .log(LogDetails(logLevel: "info", logMessage: "Account balance request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3000), eventType: "action", featureName: "Statements", summary: "Request statements action dispatched", details: .action(ActionDetails(actionType: "requestStatements", payload: "{\"accountId\": \"acc123\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2900), eventType: "action", featureName: "Statements", summary: "Statements request succeeded action dispatched", details: .action(ActionDetails(actionType: "statementsSuccess", payload: "{\"accountId\": \"acc123\", \"statements\": [{\"date\": \"2024-01-01\", \"amount\": 100.0}, {\"date\": \"2024-02-01\", \"amount\": 150.0}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2950), eventType: "log", featureName: "Statements", summary: "Request statements log", details: .log(LogDetails(logLevel: "info", logMessage: "Statements request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2850), eventType: "log", featureName: "Statements", summary: "Statements request succeeded log", details: .log(LogDetails(logLevel: "info", logMessage: "Statements request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2800), eventType: "action", featureName: "Referrals", summary: "Request referrals action dispatched", details: .action(ActionDetails(actionType: "requestReferrals", payload: "{\"userId\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2700), eventType: "action", featureName: "Referrals", summary: "Referrals request succeeded action dispatched", details: .action(ActionDetails(actionType: "referralsSuccess", payload: "{\"userId\": \"user1\", \"referrals\": [{\"name\": \"Jane Smith\", \"status\": \"accepted\"}, {\"name\": \"Bob Johnson\", \"status\": \"pending\"}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2750), eventType: "log", featureName: "Referrals", summary: "Request referrals log", details: .log(LogDetails(logLevel: "info", logMessage: "Referrals request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2650), eventType: "log", featureName: "Referrals", summary: "Referrals request succeeded log", details: .log(LogDetails(logLevel: "info", logMessage: "Referrals request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2600), eventType: "state", featureName: "Authentication", summary: "Authentication state updated", details: .state(StateDetails(stateData: "{\"isLoggedIn\": true, \"username\": \"user1\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2500), eventType: "state", featureName: "Profile", summary: "Profile state updated", details: .state(StateDetails(stateData: "{\"userId\": \"user1\", \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2400), eventType: "state", featureName: "Account Balance", summary: "Account balance state updated", details: .state(StateDetails(stateData: "{\"balance\": 1000.0, \"currency\": \"USD\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2300), eventType: "state", featureName: "Statements", summary: "Statements state updated", details: .state(StateDetails(stateData: "{\"statements\": [{\"date\": \"2024-01-01\", \"amount\": 100.0}, {\"date\": \"2024-02-01\", \"amount\": 150.0}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2200), eventType: "state", featureName: "Referrals", summary: "Referrals state updated", details: .state(StateDetails(stateData: "{\"referrals\": [{\"name\": \"Jane Smith\", \"status\": \"accepted\"}, {\"name\": \"Bob Johnson\", \"status\": \"pending\"}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2100), eventType: "action", featureName: "Authentication", summary: "Logout action dispatched", details: .action(ActionDetails(actionType: "logout", payload: "{}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2000), eventType: "log", featureName: "Authentication", summary: "Logout log", details: .log(LogDetails(logLevel: "info", logMessage: "User logged out"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1900), eventType: "action", featureName: "Profile", summary: "Profile update request action dispatched", details: .action(ActionDetails(actionType: "updateProfile", payload: "{\"userId\": \"user1\", \"name\": \"John Smith\", \"email\": \"john.smith@example.com\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1800), eventType: "log", featureName: "Profile", summary: "Profile update log", details: .log(LogDetails(logLevel: "info", logMessage: "Profile updated successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1700), eventType: "action", featureName: "Account Balance", summary: "Deposit action dispatched", details: .action(ActionDetails(actionType: "deposit", payload: "{\"accountId\": \"acc123\", \"amount\": 200.0}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1600), eventType: "log", featureName: "Account Balance", summary: "Deposit log", details: .log(LogDetails(logLevel: "info", logMessage: "Deposit of 200.0 USD successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1500), eventType: "action", featureName: "Statements", summary: "Generate statement action dispatched", details: .action(ActionDetails(actionType: "generateStatement", payload: "{\"accountId\": \"acc123\", \"period\": \"2024-01\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1400), eventType: "log", featureName: "Statements", summary: "Generate statement log", details: .log(LogDetails(logLevel: "info", logMessage: "Statement for period 2024-01 generated successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1300), eventType: "action", featureName: "Referrals", summary: "Send referral action dispatched", details: .action(ActionDetails(actionType: "sendReferral", payload: "{\"userId\": \"user1\", \"referralName\": \"Alice Johnson\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1200), eventType: "log", featureName: "Referrals", summary: "Send referral log", details: .log(LogDetails(logLevel: "info", logMessage: "Referral sent to Alice Johnson successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1100), eventType: "state", featureName: "Authentication", summary: "Authentication state updated", details: .state(StateDetails(stateData: "{\"isLoggedIn\": false}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1000), eventType: "state", featureName: "Profile", summary: "Profile state updated", details: .state(StateDetails(stateData: "{\"userId\": \"user1\", \"name\": \"John Smith\", \"email\": \"john.smith@example.com\"}")))
]
