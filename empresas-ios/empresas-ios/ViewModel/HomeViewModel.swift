//
//  HomeViewModel.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var enterprises: [Enterprise]?
    @Published var search: String = "" {
        didSet {
            searchDispatch()
        }
    }
    @Published var isLoading = false
    @Published var isSearching = false
    @Published var showingResults = false

    var compactSearch: Bool {
        isSearching || showingResults
    }

    var searchTask: DispatchWorkItem?

    func searchDispatch() {
        isLoading = true

        self.searchTask?.cancel()
        let task = DispatchWorkItem { [weak self] in
            self?.getEnterprises()
        }
        self.searchTask = task
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: task)
    }

    func getEnterprises() {
        API().getEnterprises(search: search, completion: { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let enterprises):
                        self.enterprises = enterprises.enterprises
                        self.showingResults = true
                    default:
                        print("erro")
                }
                self.isLoading = false
            }
        })
    }

}
