//
//  NetworkAPIClient .swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//
import Foundation

// Define HTTP Methods
enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

// Define API Request Structure
struct APIRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let queryParams: [String: Any]?
    let body: Data?
}

// Define Custom Errors
enum AppError: Error {
    case invalidURL
    case httpFailure
    case decodingError
    case noHttpBody
}

// API Client using URLSession
final class URLSessionApiClient {
    
    private let configuration: URLSessionConfiguration
    private let session: URLSession
    
    init() {
        self.configuration = URLSessionConfiguration.default
        self.configuration.timeoutIntervalForRequest = 30.0
        self.configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        self.session = URLSession(configuration: self.configuration)
    }
    
    private func prepareURL(_ api: APIRequest) -> URL? {
        var urlComponents = URLComponents(string: api.url.absoluteString)
        let queryItems = api.queryParams?.map({ (key, value) in
            return URLQueryItem(name: key, value: String(describing: value))
        })
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
    
    func dataTask<T: Codable>(_ api: APIRequest, onCompletion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = prepareURL(api) else {
            return onCompletion(.failure(AppError.invalidURL))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.allHTTPHeaderFields = api.headers
        urlRequest.httpBody = api.body
        
        self.session.dataTask(with: urlRequest) { data, response, error in
            
            // onFailure
            if let err = error {
                onCompletion(.failure(err))
                return
            }
            
            // Validation
            guard (200...299).contains((response as? HTTPURLResponse)?.statusCode ?? 0) else {
                onCompletion(.failure(AppError.httpFailure))
                return
            }
            
            // onSuccess
            if let data = data {
                // Transform Data to Codable Type
                if let userModel = try? JSONDecoder().decode(T.self, from: data) {
                    onCompletion(.success(userModel))
                } else {
                    onCompletion(.failure(AppError.decodingError))
                }
            } else {
                onCompletion(.failure(AppError.noHttpBody))
            }
        }.resume()
    }
}
// Example Function to Execute API Requests
func executeApiRequests() {
    let apiClient = URLSessionApiClient()
    
    // Register User
    if let registerUrl = URL(string: "http://localhost:8080/api/register") {
        let registerRequestModel = RegisterRequest(username: "user1", password: "pass123")
        let registerData = try! JSONEncoder().encode(registerRequestModel)
        let registerAPIRequest = APIRequest(url: registerUrl, method: .POST, headers: nil, queryParams: nil, body: registerData)
        
        apiClient.dataTask(registerAPIRequest) { (result: Result<RegisterResponse, Error>) in
            switch result {
            case .success(let response):
                print("Register Success: \(response)")
            case .failure(let error):
                print("Register Error: \(error)")
            }
        }
    }
    
    // Login User
    if let loginUrl = URL(string: "http://localhost:8080/api/login") {
        let loginRequestModel = LoginRequest(username: "user1", password: "pass123")
        let loginData = try! JSONEncoder().encode(loginRequestModel)
        let loginAPIRequest = APIRequest(url: loginUrl, method: .POST, headers: nil, queryParams: nil, body: loginData)
        
        apiClient.dataTask(loginAPIRequest) { (result: Result<LoginResponse, Error>) in
            switch result {
            case .success(let response):
                print("Login Success: \(response)")
            case .failure(let error):
                print("Login Error: \(error)")
            }
        }
    }
    
    // Update Account
    if let updateAccountUrl = URL(string: "http://localhost:8080/api/accounts/1") {
        let updateAccountRequestModel = AccountUpdateRequest(accountName: "New Account Name")
        let updateAccountData = try! JSONEncoder().encode(updateAccountRequestModel)
        let updateAccountAPIRequest = APIRequest(url: updateAccountUrl, method: .PUT, headers: nil, queryParams: nil, body: updateAccountData)
        
        apiClient.dataTask(updateAccountAPIRequest) { (result: Result<AccountDetailsResponse, Error>) in
            switch result {
            case .success(let response):
                print("Update Account Success: \(response)")
            case .failure(let error):
                print("Update Account Error: \(error)")
            }
        }
    }
    
    // Transfer Money
    if let transferMoneyUrl = URL(string: "http://localhost:8080/api/transactions/transfer") {
        let transferMoneyRequestModel = TransferRequest(fromAccountId: 1, toAccountId: 2, amount: 100.0)
        let transferMoneyData = try! JSONEncoder().encode(transferMoneyRequestModel)
        let transferMoneyAPIRequest = APIRequest(url: transferMoneyUrl, method: .POST, headers: nil, queryParams: nil, body: transferMoneyData)
        
        apiClient.dataTask(transferMoneyAPIRequest) { (result: Result<TransactionResponse, Error>) in
            switch result {
            case .success(let response):
                print("Transfer Money Success: \(response)")
            case .failure(let error):
                print("Transfer Money Error: \(error)")
            }
        }
    }
    
    // Get Account Details
    if let getAccountDetailsUrl = URL(string: "http://localhost:8080/api/accounts") {
        let getAccountDetailsAPIRequest = APIRequest(url: getAccountDetailsUrl, method: .GET, headers: nil, queryParams: nil, body: nil)
        
        apiClient.dataTask(getAccountDetailsAPIRequest) { (result: Result<[AccountDetailsResponse], Error>) in
            switch result {
            case .success(let response):
                print("Get Account Details Success: \(response)")
            case .failure(let error):
                print("Get Account Details Error: \(error)")
            }
        }
    }
    
    // Get Transactions
    if let getTransactionsUrl = URL(string: "http://localhost:8080/api/transactions") {
        let getTransactionsAPIRequest = APIRequest(url: getTransactionsUrl, method: .GET, headers: nil, queryParams: nil, body: nil)
        
        apiClient.dataTask(getTransactionsAPIRequest) { (result: Result<[TransactionResponse], Error>) in
            switch result {
            case .success(let response):
                print("Get Transactions Success: \(response)")
            case .failure(let error):
                print("Get Transactions Error: \(error)")
            }
        }
    }
    
    // Add Favorite
    if let addFavoriteUrl = URL(string: "http://localhost:8080/api/favorites/1/2") {
        let addFavoriteAPIRequest = APIRequest(url: addFavoriteUrl, method: .POST, headers: nil, queryParams: nil, body: nil)
        
        apiClient.dataTask(addFavoriteAPIRequest) { (result: Result<FavoritesResponse, Error>) in
            switch result {
            case .success(let response):
                print("Add Favorite Success: \(response)")
            case .failure(let error):
                print("Add Favorite Error: \(error)")
            }
        }
    }
    
    // Delete Favorite
    if let deleteFavoriteUrl = URL(string: "http://localhost:8080/api/accounts/1") {
        let deleteFavoriteAPIRequest = APIRequest(url: deleteFavoriteUrl, method: .DELETE, headers: nil, queryParams: nil, body: nil)
        
        apiClient.dataTask(deleteFavoriteAPIRequest) { (result: Result<FavoritesResponse, Error>) in
            switch result {
            case .success(let response):
                print("Delete Favorite Success: \(response)")
            case .failure(let error):
                print("Delete Favorite Error: \(error)")
            }
        }
    }
}
