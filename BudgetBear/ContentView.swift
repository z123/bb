
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                Image("badger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
                    .padding(.top, -80)
                    .padding(.bottom, -130)
                
                VStack {
                    Text("BUDGET BADGER")
                        .font(.custom("AvenirNext-Bold", size: 32))
                        .foregroundColor(Color.text)
                        .padding(.top, 20)
                    ProgressCircleView()
                    TransactionListView()
                }
                .background(Color.background)
                .cornerRadius(20)
            }
            
            TabBarView()
        }
        .background(Color.headerBackground)

    }
}

struct ProgressCircleView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .foregroundColor(Color.progressTrack)
                
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.progressBar)
                    .rotationEffect(Angle(degrees: 270.0))
                
                VStack {
                    Text("$1,500")
                        .font(.custom("AvenirNext-Bold", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color.text)
                    Text("of $2,000")
                        .font(.custom("AvenirNext-Medium", size: 20))
                        .foregroundColor(Color.text.opacity(0.6))
                }
            }
            .frame(width: 200, height: 200)
            .padding()
        }
    }
}

struct TransactionListView: View {
    var body: some View {
        VStack {
            TransactionRow(icon: "cart.fill", name: "Groceries", amount: "$400", color: Color.groceries)
            TransactionRow(icon: "list.bullet.rectangle.portrait.fill", name: "Bills", amount: "$650", color: Color.bills)
            TransactionRow(icon: "party.popper.fill", name: "Entertainment", amount: "$250", color: Color.entertainment)
            TransactionRow(icon: "piggy.bank.fill", name: "Savings", amount: "$200", color: Color.savings)
        }
        .padding(.horizontal)
    }
}

struct TransactionRow: View {
    var icon: String
    var name: String
    var amount: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .padding(12)
                .background(color.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(color)
            
            Text(name)
                .font(.custom("AvenirNext-Medium", size: 18))
            
            Spacer()
            
            Text(amount)
                .font(.custom("AvenirNext-Bold", size: 18))
        }
        .padding()
        .cornerRadius(20)
        .padding(.bottom, 5)
        .foregroundColor(Color.text)
    }
}

struct TabBarView: View {
    @State var selectedTab = "Overview"
    
    var body: some View {
        HStack {
            TabBarItem(icon: "chart.pie.fill", text: "Overview", isSelected: selectedTab == "Overview")
                .onTapGesture { selectedTab = "Overview" }
            Spacer()
            TabBarItem(icon: "arrow.left.arrow.right", text: "Transactions", isSelected: selectedTab == "Transactions")
                .onTapGesture { selectedTab = "Transactions" }
            Spacer()
            TabBarItem(icon: "gear", text: "Settings", isSelected: selectedTab == "Settings")
                .onTapGesture { selectedTab = "Settings" }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct TabBarItem: View {
    var icon: String
    var text: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 22))
            Text(text)
                .font(.custom("AvenirNext-Medium", size: 14))
        }
        .foregroundColor(isSelected ? Color.progressBar: Color.text.opacity(0.5))
        .padding(.vertical, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
