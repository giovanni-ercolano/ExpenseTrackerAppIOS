//
//  Recents.swift
//  ExpenseTrackerApp_Tutorial
//
//  Created by Giovanni Ercolano on 11/02/24.
//

import SwiftUI

struct Recents: View {
    /// uSer Properties
    @AppStorage("userName") private var userName: String = ""
    /// view Properties
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    var body: some View {
        GeometryReader{
            //for animation
            let size = $0.size
            
            NavigationStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]){
                        Section{
                            /// Date filter button
                            Button(action: { }, label: {
                                Text("\(format(date: startDate, format: "dd - MMM yy")) to \(format(date: startDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            })
                            .hSpacing(.leading)
                            
                            /// Card View | Tutorial da continuare minuto 11:06 link -> https://www.youtube.com/watch?v=TXJF8fkOp4c&t=185s&ab_channel=Kavsoft
                            
                        }header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView(_ size: CGSize)-> some View{
        HStack(spacing:10){
            VStack(alignment: .leading, spacing: 5, content: {
                Text("Welcome!")
                    .font(.title.bold())
                
                if !userName.isEmpty{
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            })
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }

            Spacer(minLength: 0)
            
            NavigationLink{
                
            }label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
            }
        }
        .padding(.bottom,  userName.isEmpty ? 10 : 5)
        .background {
            VStack(spacing:0){
                Rectangle()
                    .fill(.ultraThinMaterial)
                Divider()
            }
            .visualEffect { content, geometryProxy in
                content
                    .opacity(headerBGOpacity(geometryProxy))
            }
                .padding(.horizontal,-15)
                .padding(.top,-(safeArea.top + 15))
            
        }
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat{
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
        
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat{
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress,0),1)) * 0.4
        return 1 + scale
    }
}

#Preview {
    ContentView()
}
