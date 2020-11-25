//
//  File.swift
//  
//
//  Created by Richard Clements on 24/11/2020.
//

import Foundation

struct Query {
    struct Name: ExpressibleByStringLiteral {
        let rawValue: String
        
        init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    struct Value: ExpressibleByStringLiteral {
        let rawValue: String
        
        init(stringLiteral value: StringLiteralType) {
            self.rawValue = value
        }
    }
    
    let name: Name
    let value: Value
}

struct Queries {
    
    let queries: [Query]
    
    @_functionBuilder struct QueryBuilder {
        static func buildBlock(_ queries: Query...) -> Queries {
            Queries(queries)
        }
        
        static func buildBlock(_ query: Query) -> Queries {
            Queries([query])
        }
        
        static func buildIf(_ query: Query?) -> Queries {
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
    
    init(@QueryBuilder builder: () -> Queries) {
        self = builder()
    }
    
}

extension Query: PartialRequest {
    
    var url: URL? {
        nil
    }
    
    var scheme: String? {
        nil
    }
    
    var host: String? {
        nil
    }
    
    var path: String? {
        nil
    }
    
    var method: String? {
        nil
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    var timeoutInterval: TimeInterval? {
        nil
    }
    
    var query: [Query]? {
        [self]
    }
    
    var headers: [Header]? {
        nil
    }
    
    var body: Body? {
        nil
    }
    
    var bodyStream: InputStream? {
        nil
    }
    
    var httpShouldHandleCookies: Bool? {
        nil
    }
    
    var httpShouldUsePipelining: Bool? {
        nil
    }
    
    var allowsCellularAccess: Bool? {
        nil
    }
    
    var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
}

extension Queries: PartialRequest {
    
    var url: URL? {
        nil
    }
    
    var scheme: String? {
        nil
    }
    
    var host: String? {
        nil
    }
    
    var path: String? {
        nil
    }
    
    var method: String? {
        nil
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        nil
    }
    
    var timeoutInterval: TimeInterval? {
        nil
    }
    
    var query: [Query]? {
        queries
    }
    
    var headers: [Header]? {
        nil
    }
    
    var body: Body? {
        nil
    }
    
    var bodyStream: InputStream? {
        nil
    }
    
    var httpShouldHandleCookies: Bool? {
        nil
    }
    
    var httpShouldUsePipelining: Bool? {
        nil
    }
    
    var allowsCellularAccess: Bool? {
        nil
    }
    
    var allowsConstrainedNetworkAccess: Bool? {
        nil
    }
    
    var allowsExpensiveNetworkAccess: Bool? {
        nil
    }
    
    var networkServiceType: URLRequest.NetworkServiceType? {
        nil
    }
}
