//
//import SwiftUI
//
//struct authView: View {
//    @State var email: String = "xxxxxx@gmail.com"
//    @State var password: String = "xxxxxx"
//    @State var emailInscri: String = ""
//    @State var passwordInscri: String = ""
//    @State var pseudo: String = ""
//    @State var loading = false
//    @State var error = false
//    @State var showDashboard = false
//    @State var showDashboardinscri = false
//    @State private var showAlert = false
//
//     var session: SessionStore = SessionStore()
//
//
//
//
//    var body: some View {
//        NavigationView {
//            VStack () {
//                /// Fields of connexion
//                VStack{
//
//                    Text("Se connecter").font(.title).foregroundColor(Color.green)
//                    TextField("Saisir ton mail", text: $email).keyboardType(.emailAddress)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(30).frame( height: 35, alignment: .center)
//                    SecureField("Saisir ton mot de passe", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(30).frame( height: 35, alignment: .center)
//
//                    VStack {
//                        NavigationLink(destination:  ContentView() , isActive: $showDashboard ) {
//                            Text("")
//                        }
//                        Button(action: {
//                            if self.email.isEmpty || self.password.isEmpty {
//                                print("vide")
//                                }
//                                else {
//                                    self.session.logIn(email: self.email, password: self.password) { (result, error) in
//                                        self.loading = false
//                                        if error != nil {
//                                            self.error = true
//                                            self.showAlert = true
//
//                                    }
//
//                                    else {
//                                        self.email = ""
//                                        self.password = ""
//                                        self.showDashboard = true
//
//                                    } } }
//                        }) {
//                            Text("Connexion").padding(.all, CGFloat(25)).foregroundColor(.white).background(Color.green).cornerRadius(CGFloat(20))
//                        }
//                    }
//                }
//
//                LabelledDivider(label: "or")
//
//                /// Fields of inscription
//                VStack{
//
//                    Text("S'inscrire").font(.title).foregroundColor(.green)
//                    TextField("Saisir ton mail", text: $emailInscri).keyboardType(.emailAddress)
//                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding(30).frame( height: 35, alignment: .center)
//
//                    SecureField("Saisir ton mot de passe", text: $passwordInscri)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(30).frame(alignment: .center).frame( height: 35, alignment: .center)
//
//                    TextField("Saisir ton pseudo", text: $pseudo)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(30).frame( height: 35, alignment: .center)
//                    VStack {
//                        NavigationLink(destination:  TabBarView() , isActive: $showDashboardinscri ) {
//                            Text("")
//                        }
//                        Button(action: {
//                            if self.emailInscri.isEmpty || self.passwordInscri.isEmpty {
//                                print("vide")
//                            }
//                            else {
//                                self.session.createUser(email: self.emailInscri, password: self.passwordInscri , pseudo : self.pseudo) { (result, error) in
//                                    self.loading = false
//                                    if error != nil {
//                                        self.error = true
//                                        self.showAlert = true
//                                    }
//                                    else {
//                                        self.email = ""
//                                        self.password = ""
//                                        self.pseudo = ""
//                                        self.showDashboardinscri = true
//                                    } } }
//                        }) {
//                            Text("Inscription").padding(.all, CGFloat(25)).foregroundColor(.white).background(Color.green).cornerRadius(CGFloat(20)).frame(width : 250,alignment: .center)
//                        }
//
//                    }
//                }
//            }
//        }.alert(isPresented: $showAlert) {
//            Alert(title: Text("Attention"), message: Text("Vérifier votre adresse email ou mot de passe"), dismissButton: .default(Text("Annuler")))
//        }
//
//    }
//}
//struct LabelledDivider: View {
//
//    let label: String
//    let horizontalPadding: CGFloat
//    let color: Color
//
//    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .green) {
//        self.label = label
//        self.horizontalPadding = horizontalPadding
//        self.color = color
//    }
//
//    var body: some View {
//        HStack {
//            line
//            Text(label).foregroundColor(.green)
//            line
//        }
//    }
//
//    var line: some View {
//        VStack { Divider().background(color) }.padding(horizontalPadding)
//    }
//}
//
