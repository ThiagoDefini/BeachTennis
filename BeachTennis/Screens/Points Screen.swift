import SwiftUI

struct PointsCard: View {
    var tournament: Tournament
    var players: [String]
    @State private var id1: String = "0"
    @State private var id2: String = "0"
    @State private var player1 = "0"
    @State private var player2 = "0"
    @State private var winner1 = false
    @State private var winner2 = false
    @FocusState var colorFixer:Bool
    @State var isShowingKeyboard: Bool = false
    @State var favorite: Int = 0
    
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    var body: some View {
        ZStack{
            Color("bege")
                .ignoresSafeArea()
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color("light-orange"))
                    .frame(width: 440, height: 400)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                    .offset(y: -440)
            }
            VStack{
                HStack{
                    Spacer()
                    ZStack{
                        Circle()
                            .frame(width: 36)
                            .foregroundColor(.white)
                        Button {
                            if(favorite == 1){
                                favorite = 0
                            }else{favorite = 1}
                        } label: {
                            Image(systemName:"square.and.pencil")
                        }
                    }
                }
                .padding(.horizontal,52)
                Spacer()
                HStack {
                    Text("Partida #12")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .padding()
                .frame(width: 350, height: 64)
                .background(.white)
                .cornerRadius(16)
                
                VStack(){
                    Spacer()
                    HStack{
                        ZStack{
                            TextField("name", text: self.$player1)
                                .font(.title)
                                .bold()
                                .foregroundColor(winner1 ? .green : .black)
                                .multilineTextAlignment(.center)
                                .focused($colorFixer)
                            VStack{
                                Spacer()
                                Divider()
                            }
                        }
                        Text("X")
                            .foregroundColor(Color("orange"))
                            .bold()
                        
                        ZStack{
                            TextField("name", text: self.$player2)
                                .font(.title)
                                .bold()
                                .foregroundColor(winner2 ? .green : .black)
                                .multilineTextAlignment(.center)
                                .focused($colorFixer)
                            VStack{
                                Spacer()
                                Divider()
                            }
                        }
                        
                    }
                    .padding(16)
                    Spacer()
                    HStack {
                        VStack(spacing: 5){
                            Text(players[0].split(separator: "&")[0])
                                .foregroundColor(.black)
                            Text(players[0].split(separator: "&")[1])
                            .foregroundColor(.black)                }
                        .padding(.vertical)
                        .padding(.leading)
                        Spacer()
                        Divider()
                            .background(Color("orange"))
                            .foregroundColor(Color("orange"))
                            .bold()
                        Spacer()
                        VStack(spacing: 5){
                            Text(players[1].split(separator: "&")[0])
                                .foregroundColor(.black)
                            Text(players[1].split(separator: "&")[1])
                                .foregroundColor(.black)
                        }
                        .padding(.vertical)
                        .padding(.trailing)
                    }
                    .background(Color("dark-bege"))
                    .frame(width: 350)
                    .frame(height: 67)
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .overlay {
                        RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                            .stroke(lineWidth: 1)
                    }
                }
                //.padding()
                .frame(width: 350)
                .frame(height: 147)
                .background(colorFixer ? .white : Color("light-orange"))
                .cornerRadius(16)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("orange"), lineWidth: 1)
                }
                HStack(spacing:10){
                    Image("mapa")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight:18)
                        .frame(maxWidth:18)
                        .foregroundColor(Color("orange"))
                    VStack(alignment: .leading){
                        Text("Local")
                            .foregroundColor(.black)
                            .font(.title2)
                        Text("X")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                    .padding(10)
                    Spacer()
                }
                .padding(16)
                .frame(width: 340)
                .frame(height: 70)
                .cornerRadius(16)
                .overlay {
                    RoundedCorner(radius: 16)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("orange"))
                }
                MultiUseCell(text1: "Date", text2: "X", image: "calendar.badge.clock")
                
                MultiUseCell(text1: "Hour", text2: "X", image: "clock.fill")
                
                Button("Save Results"){
                    if(self.player1 == "6" && winner1 == false && winner2 == false){
                        tournament.selectWinnerTree(id: id1)
                        winner1 = true
                    }
                    if(self.player2 == "6"){
                        tournament.selectWinnerTree(id: id2)
                        winner2 = true
                    }
                }
                .frame(width: 350, height: 64)
                .background(Color("blue"))
                .cornerRadius(16)
                .foregroundColor(.white)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct PointsCard_Previews: PreviewProvider {
    static var previews: some View {
        PointsCard(tournament:c2!,players: ["Nescau & Cereal","Nescau & Leite"])
    }
}
