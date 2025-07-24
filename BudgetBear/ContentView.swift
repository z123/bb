
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                    HeaderView()
                    ProgressCircleView()
                    TransactionListView()
            }
            
            TabBarView()
        }
        .background(Color.backgroundColor)

    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            Image("badger.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding(.top, 50)
            
            Text("BUDGET BADGER")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(Color.textColor)
                .padding(.top, 20)
        }
    }
}

struct ProgressCircleView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.progressTrackColor)
                
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.progressBarColor)
                    .rotationEffect(Angle(degrees: 270.0))
                
                VStack {
                    Text("$1,500")
                        .font(.custom("AvenirNext-Bold", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(Color.textColor)
                    Text("of $2,000")
                        .font(.custom("AvenirNext-Medium", size: 24))
                        .foregroundColor(Color.textColor)
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
            TransactionRow(icon: "basket.fill", name: "Groceries", amount: "$400")
            TransactionRow(icon: "doc.text.fill", name: "Bills", amount: "$650")
            TransactionRow(icon: "film.fill", name: "Entertainment", amount: "$250")
            TransactionRow(icon: "dollarsign.circle.fill", name: "Savings", amount: "$200")
        }
        .padding()
    }
}

struct TransactionRow: View {
    var icon: String
    var name: String
    var amount: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .padding()
                .background(Color.backgroundColor)
                .cornerRadius(10)
            
            Text(name)
                .font(.custom("AvenirNext-Medium", size: 22))
            
            Spacer()
            
            Text(amount)
                .font(.custom("AvenirNext-Bold", size: 22))
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.white)
        .cornerRadius(15)
        .padding(.bottom, 10)
        .foregroundColor(Color.textColor)
    }
}

struct TabBarView: View {
    var body: some View {
        HStack {
            TabBarItem(icon: "house.fill", text: "Overview")
            Spacer()
            TabBarItem(icon: "arrow.left.arrow.right.circle.fill", text: "Transactions")
            Spacer()
            TabBarItem(icon: "gearshape.fill", text: "Settings")
        }
        .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
        .background(Color.white)
        .cornerRadius(20)
        .foregroundColor(Color.textColor)
    }
}

struct TabBarItem: View {
    var icon: String
    var text: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(text)
                .font(.custom("AvenirNext-Medium", size: 16))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
