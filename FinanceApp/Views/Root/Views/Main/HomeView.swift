import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "line.3.horizontal")
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "bell")
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Total Balance")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("₦250,000.00")
                            .font(.largeTitle)
                            .bold()
                        
                        Button("Hide Balance") {}
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 4)
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        ActionCard(title: "Save", icon: "dollarsign.circle", color: Color.accentOrange)
                        ActionCard(title: "Invest", icon: "chart.line.uptrend.xyaxis", color: Color.primaryTeal)
                        ActionCard(title: "Spend", icon: "creditcard", color: .purple)
                    }
                    .padding(.horizontal)
                    
                    Text("Recent Activity")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(0..<5) { _ in
                        TransactionRow()
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ActionCard: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
                .frame(width: 60, height: 60)
                .background(color.opacity(0.2))
                .clipShape(Circle())
            
            Text(title)
                .font(.headline)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

struct TransactionRow: View {
    var body: some View {
        HStack {
            Image(systemName: "cart")
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Shopping")
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("-₦5,000")
                .foregroundColor(.red)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
