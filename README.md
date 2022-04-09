# SwiftRequest

![Swift](https://github.com/richard-clements/swift-request/workflows/Swift/badge.svg)

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
    Query(name: "query2", value: "value2")
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

## Creating URL
The URL can be created in two declarative ways. Either by; declaring the base url (as a `URL` or `String`), or declaring the scheme and the host. The following are equivalent:
```
let request = URLRequest {
  BaseUrl("https://github.com")
}
```
```
let request = URLRequest {
  Scheme(.https)
  Host("github.com")
}
```

## HTTP Method
The method is `GET` by default. The method can be changed using `Method`. For example, a post request can be declared as:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method(.post)
}
```
You can also use a custom verb as well, should it be required:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method("CUSTOM VERB")
}
```

## Paths
Paths can be declared as separate components or as one component with subdirectories:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Path("apple/swift")
  Path("unittests")
  Path("CMakeLists.txt")
}
```
To make this cleaner, you can also add a `Paths` element to separate it from the rest of the request.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Paths {
    Path("apple/swift")
    Path("unittests")
    Path("CMakeLists.txt")
  }
}
```
Both of these create the url: `https://github.com/apple/swift/unittests/CMakeLists.txt`

## Querying
Queries are built by each query as a component.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Query(name: "query1", value: "value1")
}
```
To cleanly add more queries, you can use the `Queries` element to separate them. For example:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Queries {
    Query(name: "query1", value: "value1")
    Query(name: "query2", value: "value2")
  }
}
```
This creates the url: `https://github.com?query1=value1&query2=value2`


`ListQuery` allows you to create a multiple queries of the same name.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Queries {
    ListQuery(name: "listQuery", values: "value1", "value2")
  }
}
```
This creates the url: `https://github.com?listQuery=value1&listQuery=value2`


You can also create queries that use CSV styled values in the following way:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Queries {
    Query(name: "csvQuery", values: "value1", "value2")
  }
}
```
This creates the url: `https://github.com?csvQuery=value1,value2`

## Headers
Headers are built by each header as a component.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Header(name: "header1", value: "value1")
}
```
To cleanly add more headers, you can use the `Headers` element to separate them. For example:
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Headers {
    Header(name: "header1", value: "value1")
    Header(name: "header2", value: "value2")
  }
}
```
Adding multiple headers with the same name, by default, will append the header value.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Headers {
    Header(name: "header1", value: "value1")
    Header(name: "header1", value: "value2")
  }
}
```
When this request is made the value for `header1` will be `value1,value2`.

If you set the `Content-Type` header field to be `multipart/form-data` then this will be automatically set to be `multipart/form-data; boundary={UUID}`, where `UUID` is a unique string. The boundary will be used to construct the data for any multipart form data you append to the request.

## Body Stream
To use an `InputStream` object as the `httpBodyStream` of the request, use `BodyStream`. E.g.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method(.post)
  BodyStream(anInputStream)
}
```

## Body

### Json
You use the `Json` element to pass JSON in the request. This can be done by passing in an object conforming to `Encodable`, or by creating an `Array`, or `Dictionary`, conforming to `Encodable`.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method(.post)
  Body {
    Json(anEncodableObject)
  }
}
```
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method(.post)
  Body {
    Json { 
      [
        [
          "key": "value"
        ]
      ]
    }
  }
}
```

### Multipart Form Data
You use the `MultipartForm` element to add multipart form data to the request. Each part can take `Data`, or `String` as a value.
```
let request = URLRequest {
  BaseUrl("https://github.com")
  Method(.post)
  Body {
    MultipartForm {
      MultipartFormData(name: "name1", value: "Some string")
      MultipartFormData(name: "name2", value: someData)
    }
  }
}
```

## Cache Policy
The cache policy can be set using `CachePolicy`. The init method takes one argument that is `URLRequest.CachePolicy`.

## Network Service Type
The network service type can be set using `ServiceType`. The init method takes one argument that is `URLRequest.NetworkServiceType`.

## Request behaviour
You can define the behaviour for `httpShouldUsePipelining`, `httpShouldHandleCookies`, `allowsCellularAccess`, `allowsExpensiveNetworkAccess`, and `allowsConstrainedNetworkAccess`. To do this, use `Behaviour`. The init arguments are each of these behaviours, and are all optional.
