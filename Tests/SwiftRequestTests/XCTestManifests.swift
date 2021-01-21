import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BaseUrlTests.allTests),
        testCase(BehaviourTests.allTests),
        testCase(BodyStreamTests.allTests),
        testCase(BodyTests.allTests),
        testCase(CachePolicyTests.allTests),
        testCase(HeaderTests.allTests),
        testCase(HeadersTests.allTests),
        testCase(HostTests.allTests),
        testCase(MethodTests.allTests),
        testCase(PathTests.allTests),
        testCase(PortTests.allTests),
        testCase(QueryTests.allTests),
        testCase(SchemeTests.allTests),
        testCase(ServiceTypeTests.allTests),
        testCase(TimeoutPolicyTests.allTests),
        testCase(RequestTests.allTests),
        testCase(JsonTests.allTests),
        testCase(MultipartFormTests.allTests)
    ]
}
#endif
