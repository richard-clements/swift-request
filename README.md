# SwiftRequest

This library allows you to create `URLRequest` objects in a more declarative way, using function builders. E.g.
```
let request = URLRequest {
  Method(.post)
  BaseUrl("https://www.test.com")
  Paths {
    Path("directory1")
    Path("directory2")
    Path("directory3")
  }
  Queries {
    Query(name: "query1", value: "value1")
    Query(name: "query2", value: "value2"
  }
  Headers {
    Header(name: .accept, value: .applicationJson)
    Header(name: .contentType, value: .applicationJson)
    if let authToken = authToken {
      Header(name: .authorization, value: .bearer(token: authToken))
    }
  }
  Body {
    Json {
      [
        [
          "key1": "value1",
          "key2": 2
        ]
      ]
    }
  }
}
```
