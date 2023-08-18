//
//  CloudKitCrudBootcamp.swift
//  BeachTennis
//
//  Created by Thiago Defini on 28/07/23.
//

import SwiftUI
import CloudKit
import Combine
import Foundation
import DequeModule

struct CloudKitFruitModelNames{
    static let name = "name"
    
}

struct FruitModel: Hashable, CloudKitableProtocol{
    let name: String
    let imageURL: URL?
    let record: CKRecord
    
    init?(record: CKRecord){
        guard let name = record["name"] as? String else { return nil }
        self.name = name
        let imageAsset = record["image"] as? CKAsset
        self.imageURL = imageAsset?.fileURL
        self.record = record
    }
    
    init?(name: String, imageURL: URL?){
        let record = CKRecord(recordType: "Fruits")
        record["name"] = name
        if let url = imageURL{
            let asset = CKAsset(fileURL: url)
            record["image"] = asset
        }
        self.init(record: record)
    }
    
    func update(newName: String) -> FruitModel?{
        let record = record
        record["name"] = newName
        return FruitModel(record: record)
        
    }
    
}


class CloudKitCrudBootcampViewModel: ObservableObject{
    
    @Published var text: String = ""
    @Published var fruits: [FruitModel] = []
    var cancellables = Set<AnyCancellable>()
    
    @Published var nodes: [Node] = []
    @Published var teams: [Team] = []
    @Published var courts: [Court] = []
    @Published var tournaments: [Tournament] = []
    @Published var persons: [Person] = []
    //    @Published var gameStates: [GameState] = []
    
    var ownerTournaments: [Tournament] {
        self.tournaments.filter({ $0.organizerId == person?.id })
    }
    
    @Published var playingTournaments: [Tournament]?
    
    @Published var userId: String?
    
    @Published var userName: String?
    
    @Published var person: Person?
    
    func findTournamentsPlaying(ids: [String]){
        fetchAllTournamentsById(ids: ids) { tournaments in
            self.playingTournaments = tournaments
        }
    }
    
    @Published var nodesById: [Node]?
    
    func findNodes(array: [String]){
        fetchAllNodesById(ids: array) { nodes in
            self.nodesById = nodes
        }
    }
    
    init(){
        CloudKitUtility.fetchUserRecordID { result in
            switch result{
            case .success(let id):
                DispatchQueue.main.async {
                    self.userId = id.recordName
                    self.fetchPersonById(id: id.recordName) { p in
                        self.person = p
                    }
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
        CloudKitUtility.discoverUserIdentityName()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] name in
                self?.userName = name
            }
            .store(in: &cancellables)
        
        
        fetchNodes()
        fetchTeams()
        fetchCourts()
        fetchPersons {}
        fetchTournaments()
    }
    
    func findPerson(completion: @escaping (Person) -> ()){
        fetchTournaments()
        fetchPersons {
            if let id = self.userId {
                self.fetchPersonById(id: id) { person in
                    completion(person)
                }
            }
        }
    }
    
    func setData() {
        fetchPersons() {
            CloudKitUtility.fetchUserRecordID { result in
                switch result{
                case .success(let id):
                    DispatchQueue.main.async {
                        self.userId = id.recordName
                        if !self.persons.contains(where: { $0.id == id.recordName }) {
                            self.addPerson(id: id.recordName, name: "Thiago", contact: "", tournamentsRegistered: [])
                        }
                        self.fetchPersonById(id: id.recordName) { p in
                            self.person = p
                            
                            self.findTournamentsPlaying(ids: p.tournamentsRegistered)
                            
                        }
                        
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        CloudKitUtility.discoverUserIdentityName()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] name in
                self?.userName = name
                print(self?.userName)
            }
            .store(in: &cancellables)
        
        fetchNodes()
        fetchTeams()
        fetchCourts()
        fetchTournaments()
        
    }
    
    func updateData(){
        fetchPersons() {
            if let id = self.userId{
                self.fetchPersonById(id: id) { p in
                    self.person = p
                }
            }
        }
        
        fetchNodes()
        fetchTeams()
        fetchCourts()
        fetchTournaments()
        if let tours = person?.tournamentsRegistered{
            findTournamentsPlaying(ids: tours)
        }
    }
    
    func addButtonPressed(){
        guard !text.isEmpty else { return }
        //        addItem(name: text)
        //        addNode(empty: 0, finished: 0, player: text, time: .now, courdId: "1", winner: 0)
        //        addTournament(name: text, tournamentType: .Tree, organizerId: "1", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startingTime: .now, endingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Asndoiasn da sivla", address: "Rua gorgeta")
        //        addCourt(name: text, line: Deque([]))
        //        addTeam(playersInGroup: [], matches: [])
        //        addPerson(name: text, contact: text, tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: [])
        //        addGameState(tournament: text, groupId: "1", players: [""])
        self.text = ""
    }
    
    private func addItem(name: String){
        guard let image = UIImage(named: "checkmark"),
              let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("checkmark.png"),
              let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        do{
            try data.write(to: url)
            guard let newFruit = FruitModel(name: name, imageURL: url) else { return }
            
            CloudKitUtility.add(item: newFruit) { result in
                //                DispatchQueue.main.async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    switch result{
                    case .success(_):
                        self.fruits.append(newFruit)
                    case .failure(_):
                        break
                    }
                    
                    self.fetchItems()
                    self.text = ""
                }
            }
        }catch let error{
            print(error)
        }
        
    }
    
    func fetchItems(){
        let predicate = NSPredicate(value: true)
        let recordType = "Fruits"
        //        let fruta = "Apple"
        //        let predicate = NSPredicate(format: "name = %@", argumentArray: [fruta])
        //        let query = CKQuery(recordType: "Fruits", predicate: predicate)
        //        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        //        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        //        let queryOperation = CKQueryOperation(query: query)
        //        queryOperation.resultsLimit = 2 //100 limit
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.fruits = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func updateItem(fruit: FruitModel){
        guard let newFruit = fruit.update(newName: "NEW NAME!!!!") else { return }
        
        CloudKitUtility.update(item: newFruit) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        //        let record = fruit.record
        
        CloudKitUtility.delete(item: fruit)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.fruits.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
}

struct CloudKitCrudBootcamp: View {
    
    @StateObject private var vm = CloudKitCrudBootcampViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                header
                textField
                addButton
                
                List{
                    ForEach(vm.nodes, id: \.self){ node in
                        HStack{
                            Text(node.id)
                            //                            if let url = node.imageURL,
                            //                               let data = try? Data(contentsOf: url),
                            //                               let image = UIImage(data: data){
                            //                                Image(uiImage: image)
                            //                                    .resizable()
                            //                                    .frame(width: 50, height: 50)
                            //                            }
                        }
                        .onTapGesture {
                            var nodeMut = node
                            nodeMut.id = "ID Mudado"
                            vm.updateNode(node: nodeMut)
                            vm.fetchNodes()
                        }
                    }
                    //                    .onDelete(perform: vm.deleteItem)
                }
                .listStyle(PlainListStyle())
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
}

struct CloudKitCrudBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitCrudBootcamp()
    }
}

extension CloudKitCrudBootcamp{
    
    private var header: some View{
        Text("CloudKit Crud ☁️")
            .font(.headline)
            .underline()
    }
    
    private var textField: some View{
        TextField("Add something here...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
        
    }
    
    private var addButton: some View{
        Button{
            vm.addButtonPressed()
        }label: {
            Text("Add")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .cornerRadius(10)
        }
    }
    
}


// MARK: Node
extension CloudKitCrudBootcampViewModel {
    
    func addNode(empty: Int, finished: Int, player: String, time: Date, courdId: String, winner: Int){
        print("Entrou no addNote")
        
        guard let newNode = Node(empty: empty, finished: finished, player: player, time: time, courtId: courdId, winner: winner) else { return }
        
        print("Criou o node")
        CloudKitUtility.add(item: newNode) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.nodes.append(newNode)
                    print("Node added")
                case .failure(_):
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func fetchNodes(){
        let predicate = NSPredicate(value: true)
        let recordType = "Node"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.nodes = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func fetchNodeById(id: String, completion: @escaping (Node) -> Void) {
        let recordType = "Node"
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { (returnedItems: [Node]) in
                guard let node = returnedItems.first else { return }
                completion(node)
            }
            .store(in: &cancellables)
        
    }
    
    func fetchAllNodesById(ids: [String], completion: @escaping ([Node]) -> Void) {
        let recordType = "Node"
        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] (returnedItems: [Node]) in
                self?.nodes = returnedItems
                completion(returnedItems)
            }
            .store(in: &cancellables)
        
    }
    
    
    func updateNode(node: Node){
        node.updateRecord()
        
        CloudKitUtility.update(item: node) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deleteNode(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let node = nodes[index]
        //        let record = node.record
        
        CloudKitUtility.delete(item: node)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.nodes.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
}

// MARK: Team
extension CloudKitCrudBootcampViewModel {
    
    func addTeam(playersInGroup: [String], matches: Deque<String>){
        
        guard let newTeam = Team(playersInGroup: playersInGroup, matches: matches) else { return }
        
        CloudKitUtility.add(item: newTeam) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.teams.append(newTeam)
                    print("Team added")
                case .failure(_):
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func fetchTeams(){
        let predicate = NSPredicate(value: true)
        let recordType = "Team"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.teams = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func fetchTeamById(id: String, completion: @escaping (Team) -> Void) {
        let recordType = "Team"
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { (returnedItems: [Team]) in
                guard let team = returnedItems.first else { return }
                completion(team)
            }
            .store(in: &cancellables)
        
    }
    
    func fetchAllTeamsById(ids: [String], completion: @escaping ([Team]) -> Void) {
        let recordType = "Team"
        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] (returnedItems: [Team]) in
                self?.teams = returnedItems
                completion(returnedItems)
            }
            .store(in: &cancellables)
        
    }
    
    func updateTeam(team: Team){
        team.updateRecord()
        
        CloudKitUtility.update(item: team) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deleteTeam(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let team = teams[index]
        //        let record = node.record
        
        CloudKitUtility.delete(item: team)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.teams.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
}

// MARK: Court
extension CloudKitCrudBootcampViewModel {
    
    func addCourt(name: String, line: Deque<String>){
        
        
        
        guard let newCourt = Court(name: name, line: line) else { return }
        
        
        CloudKitUtility.add(item: newCourt) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.courts.append(newCourt)
                    print("Court added")
                case .failure(_):
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func fetchCourts(){
        let predicate = NSPredicate(value: true)
        let recordType = "Court"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.courts = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func fetchCourtById(id: String, completion: @escaping (Court) -> Void) {
        let recordType = "Court"
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { (returnedItems: [Court]) in
                guard let court = returnedItems.first else { return }
                completion(court)
            }
            .store(in: &cancellables)
        
    }
    
    func fetchAllCourtsById(ids: [String], completion: @escaping ([Court]) -> Void) {
        let recordType = "Court"
        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] (returnedItems: [Court]) in
                self?.courts = returnedItems
                completion(returnedItems)
            }
            .store(in: &cancellables)
        
    }
    
    func updateCourt(court: Court){
        court.updateRecord()
        
        CloudKitUtility.update(item: court) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deleteCourt(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let court = courts[index]
        //        let record = node.record
        
        CloudKitUtility.delete(item: court)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.courts.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
    func deleteCourtById(id: String){
        fetchCourtById(id: id) { court in
            CloudKitUtility.delete(item: court)
                .receive(on: DispatchQueue.main)
                .sink { _ in } receiveValue: { _ in }
                .store(in: &self.cancellables)
        }
    }
    
}

// MARK: Tournament
extension CloudKitCrudBootcampViewModel {
    
    func addTournament(newTournament: Tournament){
        CloudKitUtility.add(item: newTournament) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.tournaments.append(newTournament)
                    print("Tournament added")
                case .failure(_):
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func addTournament(name: String, tournamentType: TournamentTypes, organizerId: String, selectedCourt: Int, nodesCreated: Int, numGroups: Int, players: [String], courts: [String], startDate: String, endDate: String,startTime: String, endTime: String, ranking: [String], tournamentMatches: [String], groups: [String], location: String, address: String){
        
        print("Entrou addTournament")
        guard let newTournament = Tournament(name: name, tournamentType: tournamentType, organizerId: organizerId, selectedCourt: selectedCourt, nodesCreated: nodesCreated, numGroups: numGroups, players: players, courts: courts, startDate: startDate, endDate: endDate, startTime: startTime, endTime: endTime, ranking: ranking, tournamentMatches: tournamentMatches, groups: groups, location: location, address: address) else { return }
        
        print("Passou guard let newTournament")
        
        CloudKitUtility.add(item: newTournament) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.tournaments.append(newTournament)
                    print("Tournament added")
                case .failure(_):
                    print("Falha na hora de criar")
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func fetchTournaments(){
        let predicate = NSPredicate(value: true)
        let recordType = "Tournament"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.tournaments = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func fetchTournamentById(id: String, completion: @escaping (Tournament) -> Void) {
        let recordType = "Tournament"
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { (returnedItems: [Tournament]) in
                guard let tournament = returnedItems.first else { return }
                completion(tournament)
            }
            .store(in: &cancellables)
        
    }
    
    func fetchAllTournamentsById(ids: [String], completion: @escaping ([Tournament]) -> Void) {
        let recordType = "Tournament"
        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] (returnedItems: [Tournament]) in
                //                self?.tournaments = returnedItems
                completion(returnedItems)
            }
            .store(in: &cancellables)
        
    }
    
    func updateTournament(tournament: Tournament){
        tournament.updateRecord()
        
        CloudKitUtility.update(item: tournament) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deleteTournament(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let tournament = tournaments[index]
        //        let record = node.record
        
        CloudKitUtility.delete(item: tournament)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.tournaments.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
}

// MARK: Person
extension CloudKitCrudBootcampViewModel {
    
    
    func addPerson(person: Person){
        
        print("Criando a nova person")
        
        print("Name: \(person.name)")
        print("contact: \(person.contact)")
        print("tournamentRegist: \(person.id)")
        
        CloudKitUtility.add(item: person) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.persons.append(person)
                    print("Person added")
                case .failure(_):
                    print("Entrou criar pessoa e falhou")
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func addPerson(id: String,name: String, contact: String, tournamentsRegistered: [String]){
        
        guard let newPerson = Person(id: id,name: name, contact: contact, tournamentsRegistered: tournamentsRegistered) else { return }
        
        print("id: \(newPerson.id)")
        print("Name: \(newPerson.name)")
        print("contact: \(newPerson.contact)")
        
        
        CloudKitUtility.add(item: newPerson) { result in
            DispatchQueue.main.async(){
                switch result{
                case .success(_):
                    self.persons.append(newPerson)
                    print("Person added")
                case .failure(_):
                    print("Entrou criar pessoa e falhou")
                    break
                }
                
                self.fetchItems()
                self.text = ""
            }
        }
        
    }
    
    func fetchPersons(completion: @escaping () -> Void){
        let predicate = NSPredicate(value: true)
        let recordType = "Person"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.persons = returnedItems
                completion()
            }
            .store(in: &cancellables)
        
    }
    
    func fetchPersonById(id: String, completion: @escaping (Person) -> Void) {
        let recordType = "Person"
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { (returnedItems: [Person]) in
                guard let person = returnedItems.first else { return }
                completion(person)
            }
            .store(in: &cancellables)
        
    }
    
    func fetchAllPersonsById(ids: [String], completion: @escaping ([Person]) -> Void) {
        let recordType = "Person"
        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] (returnedItems: [Person]) in
                self?.persons = returnedItems
                completion(returnedItems)
            }
            .store(in: &cancellables)
        
    }
    
    func updatePerson(person: Person){
        person.updateRecord()
        
        CloudKitUtility.update(item: person) { [weak self] result in
            print("UPDATE COMPLETED!")
            self?.fetchItems()
        }
    }
    
    func deletePerson(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let person = persons[index]
        //        let record = node.record
        
        CloudKitUtility.delete(item: person)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                print("DELETE IS: \(success)")
                self?.persons.remove(at: index)
            }
            .store(in: &cancellables)
        
    }
    
    //    func hasPersonById(id: String){
    //        var personsId: [String] = []
    //        ForEach person in persons{
    //            personsId = person.id
    //        }
    //
    //
    //        if personsId.contains(id){
    //
    //        }
    //    }
    
}

// MARK: GameState

//extension CloudKitCrudBootcampViewModel {
//
//    func addGameState(tournament: String, groupId: String, players: [String]){
//
//        guard let newGameState = GameState(tournament: tournament, groupId: groupId, players: players) else { return }
//
//            CloudKitUtility.add(item: newGameState) { result in
//                DispatchQueue.main.async(){
//                    switch result{
//                    case .success(_):
//                        self.gameStates.append(newGameState)
//                        print("GameState added")
//                    case .failure(_):
//                        break
//                    }
//
//                    self.fetchItems()
//                    self.text = ""
//                }
//            }
//
//    }
//
//    func fetchGameStates(){
//        let predicate = NSPredicate(value: true)
//        let recordType = "GameState"
//
//        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//
//            } receiveValue: { [weak self] returnedItems in
//                self?.gameStates = returnedItems
//            }
//            .store(in: &cancellables)
//
//    }
//
////    func fetchGameStateById(id: String, completion: @escaping (Node) -> Void) {
////        let recordType = "Node"
////        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
////
////        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
////            .receive(on: DispatchQueue.main)
////            .sink { _ in
////
////            } receiveValue: { (returnedItems: [Node]) in
////                guard let node = returnedItems.first else { return }
////                completion(node)
////            }
////            .store(in: &cancellables)
////
////    }
//
////    func fetchAllNodesById(ids: [String], completion: @escaping ([Node]) -> Void) {
////        let recordType = "Node"
////        let predicate = NSPredicate(format: "id IN %@", argumentArray: [ids])
////
////        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
////            .receive(on: DispatchQueue.main)
////            .sink { _ in
////
////            } receiveValue: { [weak self] (returnedItems: [Node]) in
////                self?.nodes = returnedItems
////                completion(returnedItems)
////            }
////            .store(in: &cancellables)
////
////    }
//
//
//    func updateNode(gameState: GameState){
//        gameState.updateRecord()
//
//        CloudKitUtility.update(item: gameState) { [weak self] result in
//            print("UPDATE COMPLETED!")
//            self?.fetchItems()
//        }
//    }
//
//    func deleteGameState(indexSet: IndexSet){
//        guard let index = indexSet.first else { return }
//        let gameState = gameStates[index]
////        let record = node.record
//
//        CloudKitUtility.delete(item: gameState)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//
//            } receiveValue: { [weak self] success in
//                print("DELETE IS: \(success)")
//                self?.gameStates.remove(at: index)
//            }
//            .store(in: &cancellables)
//
//    }
//
//}
