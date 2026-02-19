import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State var playerWon = false
    @State var cpuWon = false
    
    var body: some View {
        ZStack {
            Image("background-plain")

            VStack {
                // Logo
                Spacer()
                Image("logo")
                    .padding(.bottom, 55)
                
                // Scores
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 1)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 1)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                
                // Cards
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                // Deal Button
                Spacer()
                Button {
                    dealCards()
                } label: {
                    Image("button")
                }
                .padding(.bottom, 100)
            }
            .padding()
            
            // Full-screen overlay for end state
            if playerWon || cpuWon {
                ZStack {
                    Color.black.opacity(0.8)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 24) {
                        if playerWon {
                            Text("You won!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        } else if cpuWon {
                            Text("CPU won!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            resetScores()
                        } label: {
                            Text("Play Again")
                                .font(.title3).bold()
                                .foregroundStyle(.white)
                                .padding(.horizontal, 28)
                                .padding(.vertical, 12)
                                .background(Color.orange, in: Capsule())
                        }
                    }
                    .padding()
                }
                .transition(.opacity)
            }
        }
    }
    
    func resetScores() {
        playerScore = 0
        cpuScore = 0
        playerCard = "back"
        cpuCard = "back"
        playerWon = false
        cpuWon = false
    }
    
    func dealCards() {
        // Randomize card values
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        // Update the card images
        playerCard = "card\(playerValue)"
        cpuCard = "card\(cpuValue)"
        
        // Calculate the score
        if playerValue > cpuValue {
            playerScore += 1
        } else if cpuValue > playerValue {
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }
            
        // Determine the winner
        if playerScore == 21 {
            playerWon = true
        } else if cpuScore == 21 {
            cpuWon = true
        }
    }
}

#Preview {
    ContentView()
}

