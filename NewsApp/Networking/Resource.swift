import Foundation

public enum RequestMethod: String {
    case DELETE
    case GET
    case POST
    case PUT
    case HEAD
    case PATCH
}

enum APIVersion: String {
    case v1 = "/v1"
    case v2 = "/v2"
    case none = ""
}

public struct Resource<T> {
    let path: String
    var method: RequestMethod = .GET
    var headers: [String: String] = [:]
    var requestBody: Data?
    var queryItems: [URLQueryItem]?
    var api: APIVersion = .none
}

public extension Resource {
    
    init(path: String, method: RequestMethod = .GET) {
        self.path = path
        self.method = method
    }
}

/// Used when HTTP response body is empty
public struct EmptyResponse: Codable { }
