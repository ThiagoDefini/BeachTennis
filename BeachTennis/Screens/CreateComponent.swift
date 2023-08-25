import SwiftUI

struct CreateComponent: View {
//    @State private var name: String = ""
//    @State private var tennisCourt: String = ""
//    @State private var adress: String = ""
//    @State private var startDate = Date()
//    @State private var endDate = Date()
    var tournament: Tournament
    @State private var image = Image("")
    
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 104)
                .foregroundColor(.white)
            VStack(alignment: .leading){
                
                HStack(spacing: 20){
                    Text(tournament.name)
                        .foregroundColor(Color("gray"))
                        .bold()
                        .font(.system(size: 24))
                        .frame(width: 300)
                        .lineLimit(1)
                        
                    
                    
                }
                HStack{
                    Text(tournament.id)
                        .font(.system(size: 18))
                        .foregroundColor(Color("orange"))
                        .bold()
                        .padding(.horizontal)
                        .frame(width: 250)
                        .lineLimit(1)
                }
            }
            .padding(.trailing,40)
            ShareLink(item: link){
                Label("", systemImage: "square.and.arrow.up")
                    .foregroundColor(Color("blue"))
                    .font(.system(size: 30))
                
            }
            .padding(.leading,300)
            
            RoundedCorner(radius: 20)
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color("orange"))
                .frame(width: 350, height: 104)
            
        }
        
        
    }
}

struct CreateComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateComponent(tournament: c1!)
    }
}
