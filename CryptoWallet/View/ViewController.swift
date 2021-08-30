//
//  ViewController.swift
//  CryptoWallet
//
//  Created by Arda Sentürk on 30.08.21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    private var cryptoListViewModel: CryptoListViewModel!
    
    /*
     Get API Key from this site.
     https://p.nomics.com/cryptocurrency-bitcoin-api
     */
    let token: String = "your-key-here"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    private func getData() {
        let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(token)&interval=1d&convert=EUR&per-page=100&page=1")!
        
        WebService().downloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.cryptoName.text = cryptoViewModel.currency
        cell.cryptoPrice.text = String(format: "%.2f", Float(cryptoViewModel.price)!)
        let url = URL(string: cryptoViewModel.image)!
        cell.icon.sd_setImage(with: URL(string: cryptoViewModel.image), completed: nil)
        return cell
    }
    
}

