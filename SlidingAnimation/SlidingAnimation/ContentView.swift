//
//  ContentView.swift
//  SlidingAnimation
//

import SwiftUI
import CoreData


    
struct KeyboardTimeView: View {
    @ObservedObject var viewModel: calenderViewModel
    @State private var forwards = false
    @State private var show = false
    
    init(viewModel: calenderViewModel) {
        self.viewModel = viewModel
        self.viewModel.setupViewModel()
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                Button {
                    forwards = false
                    withAnimation(.easeInOut(duration: 0.5)) {
              
                        viewModel.backDateButtonAction()
                    }
                    
                } label: {
                    Image("backword").resizable().frame(width: 24, height: 24)
                }.padding(.leading, 6)
                    .foregroundColor(.black)
                
                Text(viewModel.date)
                    .frame(height: 32)
                    .frame(width: 168)
                    .foregroundColor(.black)
                    .transition(AnyTransition.asymmetric(
                        insertion: .move(edge: forwards ? .trailing : .leading),
                        removal: .move(edge: forwards ? .leading : .trailing))
                                
                    ).id(UUID())
                       
                Button {
                    forwards = true
                    withAnimation(.easeInOut(duration: 0.5)) {
                        
                        viewModel.rightDateButtonAction()
                    }
                   
//                    withAnimation(.easeInOut(duration: 0.5)) {
//                     //   forwards = true
//                        viewModel.rightDateButtonAction()
//                    }
                } label: {
                    Image("forward").resizable().frame(width: 24, height: 24)
                }.padding(.trailing, 6)
                    .foregroundColor(.black)
            }
            .background(Color.gray.opacity(0.8))
            .cornerRadius(4)
            .padding(.top, 20)
        }
    }
}


extension AnyTransition {

    static var myOpacity: AnyTransition {
      
        
        get {
            AnyTransition.modifier(
                active: MyOpacityModifier(opacity: 0.4),
                identity: MyOpacityModifier(opacity: 1))
        }
    }
}

struct MyOpacityModifier: ViewModifier {
    let opacity: Double
    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}

struct LeftTransition: ViewModifier {
  //  let show: Bool
    let forwards: Bool

    func body(content: Content) -> some View {
        if forwards {
            return AnyView(content.transition(AnyTransition.asymmetric(
                insertion: .push(from: .trailing),
                removal: .push(from: .leading)
             )).id(UUID()))
        } else {
            // return AnyView(content)
            return AnyView(content.transition(AnyTransition.asymmetric(
                insertion: .push(from: .leading),
                removal: .push(from: .trailing))
            ) .id(UUID()))
        }
    }
}

struct RightTransition: ViewModifier {
    func body(content: Content) -> some View {
        return AnyView(content.transition(AnyTransition.asymmetric(
            insertion: .push(from: .leading),
            removal: .push(from: .trailing))
        ) .id(UUID()))
    }
}


struct ConditionalTransition: ViewModifier {
  //  let show: Bool
    let forwards: Bool

    func body(content: Content) -> some View {
        if forwards {
            return AnyView(content.transition(AnyTransition.asymmetric(
                insertion: .push(from: .trailing),
                removal: .push(from: .leading)
             )).id(UUID()))
        } else {
            // return AnyView(content)
            return AnyView(content.transition(AnyTransition.asymmetric(
                insertion: .push(from: .leading),
                removal: .push(from: .trailing))
            ) .id(UUID()))
        }
    }
}
