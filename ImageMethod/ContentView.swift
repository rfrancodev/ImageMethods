//
//  ContentView.swift
//  ImageMethod
//
//  Created by Rafael Franco on 23/09/24.
//

import SwiftUI

extension   Image    {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
//            .cornerRadius(24)
//            .shadow(color: .blue, radius: 22, x: 12, y: 12)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
                
    }
}

struct ContentView: View {
    private let imageURL: String = "https://francoprogramador.com.br/imagens/fotoCapa.png"
    
    var body: some View {
        //    MARK - Basic
        //        AsyncImage(url: URL(string: imageURL))
        
        //    MARK - SCALE
        //        AsyncImage(url: URL(string: imageURL), scale: 1.5)
        
        //    MARK - PLACEHOLDER
        /*
        AsyncImage(url: URL(string: imageURL)) {image in image.imageModifier()
            } placeholder: {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
            .padding(12)
        */
        
//        MARK - PHASE
        /*
        AsyncImage(url: URL(string: imageURL)) {phase in
            SUCCESS - Imagem foi carregada
            FAILURE - Imagem falhou imagem tem um erro
            EMPTY - Nada foi carregado
         
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
                }
            }
        .padding(40)
        */
        
//        MARK - SWITCH CASE
        AsyncImage(url: URL(string: imageURL),
                transaction:
                    Transaction(animation:
                            .spring(response: 0.5,
                                dampingFraction: 0.6,
                                blendDuration: 0.25)))
            {phase in
            switch phase {
            
                case .success(let image):
                    image.imageModifier()
    //                    .transition(.move(edge: .bottom))
                        .transition(.scale(scale: 0.5))
                case .failure:
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                @unknown default:
                    ProgressView()
            }
        }
            .padding(40)
        }
    }

#Preview {
    ContentView()
}
