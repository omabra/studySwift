import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

var semaphore = DispatchSemaphore (value: 0)

let mail: String = "pwd001@ftqa.com"
let pwd: String = "Qweasdzxc10"

let parameters = "{ \"username\": \"\(mail)\",\"password\": \"\(pwd)\"}"
let postData = parameters.data(using: .utf8)

var request = URLRequest(url: URL(string: "https://auth.stage.sharecare.com/access/?grant_type=password")!,timeoutInterval: Double.infinity)
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("Basic c3RyZXNzLW1ncjo8YXZwSzlFP1Z0W1c5eSg=", forHTTPHeaderField: "Authorization")
request.addValue("en-US-u-ms-ussystem", forHTTPHeaderField: "accept-language")

request.httpMethod = "POST"
request.httpBody = postData

let task = URLSession.shared.dataTask(with: request) { data, response, error in
  guard let data = data else {
    print(String(describing: error))
    semaphore.signal()
    return
  }
  print(String(data: data, encoding: .utf8)!)
  semaphore.signal()
}

task.resume()
semaphore.wait()
