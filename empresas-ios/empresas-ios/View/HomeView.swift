//
//  HomeView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel =  HomeViewModel()

    init() {
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ZStack {
                    SearchBackgroundView(compactSearch: viewModel.compactSearch)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("grey3"))
                        TextField("Pesquise por empresa", text: $viewModel.search)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   minHeight: 0,
                                   maxHeight: .infinity,
                                   alignment: .leading)
                    }
                    .padding(.leading)
                    .frame(height: 50)
                    .background(Color("grey"))
                    .cornerRadius(4)
                    .padding(.horizontal)
                    .offset(y: viewModel.compactSearch ? 25 : 95)
                }
                .zIndex(1)

                if viewModel.isLoading {
                    VStack {
                        Spacer()
                        LoaderView()
                        Spacer()
                    }
                } else {
                    if viewModel.showingResults && (viewModel.enterprises?.isEmpty ?? false) {
                        VStack {
                            Spacer()
                            Text("Nenhum resultado encontrado")
                                .font(.title3)
                                .fontWeight(.thin)
                                .foregroundColor(Color("grey3"))
                            Spacer()
                        }
                    }

                    ScrollView(showsIndicators: false) {
                        if !(viewModel.enterprises?.isEmpty ?? true) {
                            LazyVStack(alignment: .leading, spacing: 8) {
                                Text("\(viewModel.enterprises!.count) resultados encontrados")
                                    .fontWeight(.light)
                                    .foregroundColor(Color("grey3"))

                                ForEach(viewModel.enterprises!.indices) { index in
                                    let backgroundColor =
                                        index % 3 == 0 ? Color("EnterpriseBlue") :
                                        index % 2 == 0 ? Color("EnterpriseRed") :
                                        Color("EnterpriseGreen")

                                    NavigationLink(destination: EnterpriseDetailView(
                                                                    enterprise: viewModel.enterprises![index],
                                                                    backgroundColor: backgroundColor)
                                    ) {
                                        EnterpriseCardView(
                                            enterprise: viewModel.enterprises![index],
                                            backgroundColor: backgroundColor
                                        )
                                        .cornerRadius(4)
                                    }
                                }
                            }
                            .padding(.top, 80)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                NotificationCenter.default.addObserver(
                    forName: UIResponder.keyboardWillShowNotification,
                    object: nil,
                    queue: .main
                ){ (notification) in

                    withAnimation() {
                        viewModel.isSearching = true
                    }
                }

                NotificationCenter.default.addObserver(
                    forName: UIResponder.keyboardWillHideNotification,
                    object: nil,
                    queue: .main
                ){ (notification) in

                    withAnimation() {
                        viewModel.isSearching = false
                    }
                }
            }
        }
        .onTapGesture(perform: {
            hideKeyboard()
        })
    }
}

struct SearchBackgroundView: View {
    var compactSearch: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient3"), Color("Gradient4")]),
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .frame(height: compactSearch ? 50 : 190)

            Group {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 205, height: 160)
                    .offset(x: 60, y: 15)
                    .rotationEffect(.degrees(-132))

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 119, height: 94)
                    .offset(x: -110, y: 120)
                    .rotationEffect(.degrees(28))

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 119, height: 94)
                    .offset(x: -170, y: -20)
                    .rotationEffect(.degrees(163))

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 119, height: 94)
                    .offset(x: -80, y: -80)
                    .rotationEffect(.degrees(163))
            }
            .frame(height: compactSearch ? 0 : 190)
            .opacity(compactSearch ? 0 : 0.1)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
