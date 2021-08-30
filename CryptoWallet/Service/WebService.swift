//
//  WebService.swift
//  CryptoWallet
//
//  Created by Arda Sentürk on 30.08.21.
//

import Foundation

class WebService {
    func downloadCurrency(url: URL, completion: @escaping ([CryptoCurrency]?) -> ())  {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                do {
                    let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                    if let cryptoList = cryptoList {
                        completion(cryptoList)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
}
