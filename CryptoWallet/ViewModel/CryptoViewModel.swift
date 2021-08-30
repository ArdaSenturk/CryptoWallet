//
//  CryptoViewModel.swift
//  CryptoWallet
//
//  Created by Arda Sentürk on 30.08.21.
//

import Foundation


struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
    
    var currency: String {
        return self.cryptoCurrency.name
    }
    var price: String {
        return self.cryptoCurrency.price
    }
    var image: String {
        return self.cryptoCurrency.logo_url
    }
}
