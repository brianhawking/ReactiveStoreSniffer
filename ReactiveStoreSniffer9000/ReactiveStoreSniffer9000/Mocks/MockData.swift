//
//  MockData.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation

let mockEntries: [Entry] = [
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3600), eventType: "Action", featureName: "Authentication", summary: "requestLogin", details: .dispatch(ActionDetails(action: "requestLogin", payload: "{\"username\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3500), eventType: "Action", featureName: "Authentication", summary: "Login success action dispatched", details: .dispatch(ActionDetails(action: "loginSuccess", payload: "{\"username\": \"user1\", \"token\": \"abcd1234\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3550), eventType: "Analytics", featureName: "Authentication", summary: "Potomac - User requested login", details: .analytics(LogDetails(logLevel: "info", logMessage: "User requested login"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3550), eventType: "Analytics", featureName: "Authentication", summary: "Monitor - User requested login", details: .analytics(LogDetails(logLevel: "info", logMessage: "User requested login"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3450), eventType: "Analytics", featureName: "Authentication", summary: "Potomac - Login success log", details: .analytics(LogDetails(logLevel: "info", logMessage: "User login successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3400), eventType: "Action", featureName: "Profile", summary: "Request profile action dispatched", details: .dispatch(ActionDetails(action: "requestProfile", payload: "{\"userId\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3300), eventType: "Action", featureName: "Profile", summary: "Profile request succeeded action dispatched", details: .dispatch(ActionDetails(action: "profileSuccess", payload: "{\"userId\": \"user1\", \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3350), eventType: "Analytics", featureName: "Profile", summary: "Request profile log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Profile request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3250), eventType: "Analytics", featureName: "Profile", summary: "Profile request succeeded log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Profile request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3200), eventType: "Action", featureName: "Account Balance", summary: "Request account balance action dispatched", details: .dispatch(ActionDetails(action: "requestBalance", payload: "{\"accountId\": \"acc123\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3100), eventType: "Action", featureName: "Account Balance", summary: "Account balance request succeeded action dispatched", details: .dispatch(ActionDetails(action: "balanceSuccess", payload: "{\"accountId\": \"acc123\", \"balance\": 1000.0, \"currency\": \"USD\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3150), eventType: "Analytics", featureName: "Account Balance", summary: "Request account balance log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Account balance request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3050), eventType: "Analytics", featureName: "Account Balance", summary: "Account balance request succeeded log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Account balance request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-3000), eventType: "Action", featureName: "Statements", summary: "Request statements action dispatched", details: .dispatch(ActionDetails(action: "requestStatements", payload: "{\"accountId\": \"acc123\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2900), eventType: "Action", featureName: "Statements", summary: "Statements request succeeded action dispatched", details: .dispatch(ActionDetails(action: "statementsSuccess", payload: "{\"accountId\": \"acc123\", \"statements\": [{\"date\": \"2024-01-01\", \"amount\": 100.0}, {\"date\": \"2024-02-01\", \"amount\": 150.0}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2950), eventType: "Analytics", featureName: "Statements", summary: "Request statements log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Statements request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2850), eventType: "Analytics", featureName: "Statements", summary: "Statements request succeeded log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Statements request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2800), eventType: "Action", featureName: "Referrals", summary: "Request referrals action dispatched", details: .dispatch(ActionDetails(action: "requestReferrals", payload: "{\"userId\": \"user1\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2700), eventType: "Action", featureName: "Referrals", summary: "Referrals request succeeded action dispatched", details: .dispatch(ActionDetails(action: "referralsSuccess", payload: "{\"userId\": \"user1\", \"referrals\": [{\"name\": \"Jane Smith\", \"status\": \"accepted\"}, {\"name\": \"Bob Johnson\", \"status\": \"pending\"}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2750), eventType: "Analytics", featureName: "Referrals", summary: "Request referrals log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Referrals request initiated"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2650), eventType: "Analytics", featureName: "Referrals", summary: "Referrals request succeeded log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Referrals request successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2600), eventType: "state", featureName: "Authentication", summary: "Authentication state updated", details: .state(StateDetails(state: "{\"isLoggedIn\": true, \"username\": \"user1\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2500), eventType: "state", featureName: "Profile", summary: "Profile state updated", details: .state(StateDetails(state: "{\"userId\": \"user1\", \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2400), eventType: "state", featureName: "Account Balance", summary: "Account balance state updated", details: .state(StateDetails(state: "{\"balance\": 1000.0, \"currency\": \"USD\"}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2300), eventType: "state", featureName: "Statements", summary: "Statements state updated", details: .state(StateDetails(state: "{\"statements\": [{\"date\": \"2024-01-01\", \"amount\": 100.0}, {\"date\": \"2024-02-01\", \"amount\": 150.0}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2200), eventType: "state", featureName: "Referrals", summary: "Referrals state updated", details: .state(StateDetails(state: "{\"referrals\": [{\"name\": \"Jane Smith\", \"status\": \"accepted\"}, {\"name\": \"Bob Johnson\", \"status\": \"pending\"}]}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2100), eventType: "Action", featureName: "Authentication", summary: "Logout action dispatched", details: .dispatch(ActionDetails(action: "logout", payload: "{}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-2000), eventType: "Analytics", featureName: "Authentication", summary: "Logout log", details: .analytics(LogDetails(logLevel: "info", logMessage: "User logged out"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1900), eventType: "Action", featureName: "Profile", summary: "Profile update request action dispatched", details: .dispatch(ActionDetails(action: "updateProfile", payload: "{\"userId\": \"user1\", \"name\": \"John Smith\", \"email\": \"john.smith@example.com\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1800), eventType: "Analytics", featureName: "Profile", summary: "Profile update log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Profile updated successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1700), eventType: "Action", featureName: "Account Balance", summary: "Deposit action dispatched", details: .dispatch(ActionDetails(action: "deposit", payload: "{\"accountId\": \"acc123\", \"amount\": 200.0}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1600), eventType: "Analytics", featureName: "Account Balance", summary: "Deposit log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Deposit of 200.0 USD successful"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1500), eventType: "Action", featureName: "Statements", summary: "Generate statement action dispatched", details: .dispatch(ActionDetails(action: "generateStatement", payload: "{\"accountId\": \"acc123\", \"period\": \"2024-01\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1400), eventType: "Analytics", featureName: "Statements", summary: "Generate statement log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Statement for period 2024-01 generated successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1300), eventType: "Action", featureName: "Referrals", summary: "Send referral action dispatched", details: .dispatch(ActionDetails(action: "sendReferral", payload: "{\"userId\": \"user1\", \"referralName\": \"Alice Johnson\"}"))),
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1200), eventType: "Analytics", featureName: "Referrals", summary: "Send referral log", details: .analytics(LogDetails(logLevel: "info", logMessage: "Referral sent to Alice Johnson successfully"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1100), eventType: "state", featureName: "Authentication", summary: "Authentication state updated", details: .state(StateDetails(state: "{\"isLoggedIn\": false}"))),
    
    Entry(id: UUID(), timestamp: Date().addingTimeInterval(-1000), eventType: "state", featureName: "Profile", summary: "Profile state updated", details: .state(StateDetails(state: "{\"userId\": \"user1\", \"name\": \"John Smith\", \"email\": \"john.smith@example.com\"}")))
]
