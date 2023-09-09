import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewViewModel
    let screenHeight = UIScreen.main.bounds.height
    @State private var isShowingFullImageScreen = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 300) {
                VStack(spacing: 8) {
                    Image("panda")
                        .frame(width: 150, height: screenHeight * 0.3, alignment: .leading)
                        .scaledToFill()
                        .clipped()
                    VStack {
                        HStack(spacing: 20) {
                            Button(action: {
                                viewModel.isLocked.toggle()
                            }) {
                                Text(viewModel.isLocked ? "Unlock" : "Lock")
                                    .frame(height: 58)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                            }
                            .frame(height: 58)
                            .frame(maxWidth: .infinity)
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .background(viewModel.isLocked ? Color.blue.opacity(0.5) : Color.blue)
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.indigo, lineWidth: 3)
                            )
                            
                            if !viewModel.isLocked {
                                Button("Open from top") {
                                    withAnimation {
                                        isShowingFullImageScreen.toggle()
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(18)
                                .buttonStyle(.borderedProminent)
                                .controlSize(.large)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.indigo, lineWidth: 3)
                                )
                                
                                .fullScreenCover(isPresented: $isShowingFullImageScreen) {
                                    FullImageScreen()
                                        .transition(.move(edge: .top))
                                }
                            } else {
                                Text("Open from top")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 58)
                                    .foregroundColor(.white)
                                    .background(Color.blue.opacity(0.5))
                                    .cornerRadius(18)
                                    .buttonStyle(.borderedProminent)
                                    .controlSize(.large)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(Color.indigo, lineWidth: 3)
                                    )
                            }
                        }
                    }
                    Spacer()
                    
                    NavigationLink(destination: FullImageScreen().navigationBarBackButtonHidden(true)) {
                        Text("Open full")
                            .frame(maxWidth: .infinity)
                            .frame(height: 58)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(18)
                            .buttonStyle(.borderedProminent)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.indigo, lineWidth: 3)
                            )
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewViewModel())
    }
}
