//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 29.03.2025.
//

import SwiftUI

struct RMSettingsView: View {
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
            List(viewModel.cellViewModels) { viewModel in
                HStack{
                    if let image = viewModel.image{
                        Image(uiImage: image)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.red)
                            .padding(8)
                            .background(Color(viewModel.iconContainerColor))
                            .cornerRadius(6)
                    }
                    Text(viewModel.title)
                        .padding(.leading ,10 )
                    Spacer()
                }
                .padding(.bottom,3)
                .onTapGesture {
                    viewModel.onTapHandler(viewModel.type)
                }
            }
        }
    }


struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View{
        RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0){option in
                
            }
            
        })))
    }
}
