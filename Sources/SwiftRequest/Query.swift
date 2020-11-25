//
//  File.swift
//  
//
//  Created by Richard Clements on 24/11/2020.
//

import Foundation

public struct Query: Equatable {
    public struct Name: ExpressibleByStringLiteral, Equatable {
        let rawValue: String
        
        public init(_ value: String) {
            self.rawValue = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    public struct Value: ExpressibleByStringLiteral, Equatable {
        let rawValue: String
        
        public init(_ value: String) {
            self.rawValue = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    let name: Name
    let value: Value
    
    public init(name: Name, value: Value) {
        self.name = name
        self.value = value
    }
}

extension Query {
    
    public init(name: String, value: String) {
        self.init(name: Name(name), value: Value(value))
    }
    
    public init(name: Name, value: String) {
        self.init(name: name, value: Value(value))
    }
    
    public init(name: String, value: Value) {
        self.init(name: Name(name), value: value)
    }
    
}

public struct Queries: Equatable {
    
    let queries: [Query]
    
    @_functionBuilder public struct QueryBuilder {
        public static func buildBlock(_ queries: Query...) -> Queries {
            Queries(queries)
        }
        
        public static func buildBlock(_ query: Query) -> Queries {
            Queries([query])
        }
        
        public static func buildIf(_ query: Query?) -> Queries {
            if let query = query {
                return Queries([query])
            } else {
                return Queries([])
            }
        }
    }
    
    private init(_ queries: [Query]) {
        self.queries = queries
    }
    
    public init(@QueryBuilder builder: () -> Queries) {
        self = builder()
    }
    
}

extension Query: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
    }
    
    public var host: String? {
        nil
    }
    
    public var path: String? {
        nil
    }
    
    public var method: String? {
        nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    public var timeoutInterval: TimeInterval? {
        nil
    }
    
    public var query: [Query]? {
        [self]
    }
    
    public var headers: [Header]? {
        nil
    }
    
    public var body: Body? {
        nil
    }
    
    public var bodyStream: InputStream? {
        nil
    }
    
    public var httpShouldHandleCookies: Bool? {
        nil
    }
    
    public var httpShouldUsePipelining: Bool? {
        nil
    }
    
    public var allowsCellularAccess: Bool? {
        nil
    }
    
    public var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    public var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    public var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
}

extension Queries: PartialRequest {
    
    public var url: URL? {
        nil
    }
    
    public var scheme: String? {
        nil
    }
    
    public var host: String? {
        nil
    }
    
    public var path: String? {
        nil
    }
    
    public var method: String? {
        nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    public var timeoutInterval: TimeInterval? {
        nil
    }
    
    public var query: [Query]? {
        queries
    }
    
    public var headers: [Header]? {
        nil
    }
    
    public var body: Body? {
        nil
    }
    
    public var bodyStream: InputStream? {
        nil
    }
    
    public var httpShouldHandleCookies: Bool? {
        nil
    }
    
    public var httpShouldUsePipelining: Bool? {
        nil
    }
    
    public var allowsCellularAccess: Bool? {
        nil
    }
    
    public var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    public var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    public var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
}
