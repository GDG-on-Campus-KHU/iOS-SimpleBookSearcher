//
//  ContentView.swift
//  SimpleBookSearcher
//
//  Created by 박현빈 on 3/16/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText : String
    @State var isEditing: Bool = false
    var handler: () -> Void
    
    var body: some View{
        HStack{
            TextField("검색어를 입력하세요", text: $searchText)
                .padding()
                .background(Color.gray)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal,10)
                .onSubmit {
                    handler()
                }
                .onTapGesture {
                    isEditing=true
                }
                .animation(.easeInOut, value: isEditing)
            if isEditing{
                Button{
                    isEditing=false
                } label : {
                    Text("cancel")
                }
                .padding(.trailing, 15)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview{
    SearchBar(searchText: .constant("한강")){
        
    }
}
