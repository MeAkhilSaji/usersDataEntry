part of '../user_data_entry_screen.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Username:', style: DataEntryScreenTextStyles.subHeads),
        TextFormField(
          style: DataEntryScreenTextStyles.username,
          focusNode: BlocProvider.of<UserDataCubit>(context).focusNode,
          controller:
              BlocProvider.of<UserDataCubit>(context).usernameController,
          decoration: InputDecoration(
              labelStyle: DataEntryScreenTextStyles.username,
              labelText: 'Username',
              hintStyle: DataEntryScreenTextStyles.username),
        ),
      ],
    );
  }
}

// class User {
//   final String username;
//   final String country;
//   final String gender;
//   final String dateOfBirth;
//   final String imageFilePath;

//   User({
//     required this.username,
//     required this.country,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.imageFilePath,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'username': username,
//       'country': country,
//       'gender': gender,
//       'dateOfBirth': dateOfBirth,
//       'imageFilePath': imageFilePath,
//     };
//   }
// }

// class DatabaseHelper {
//   static Database? _database;
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   DatabaseHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final databasesPath = await getDatabasesPath();
//     final path = join(databasesPath, 'user_database.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         username TEXT,
//         country TEXT,
//         gender TEXT,
//         dateOfBirth TEXT,
//         imageFilePath TEXT
//       )
//     ''');
//   }

//   Future<int> insertUser(User user) async {
//     final Database db = await database;
//     return await db.insert('users', user.toMap());
//   }

//   Future<List<User>> getUsers() async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('users');
//     return List.generate(maps.length, (i) {
//       return User(
//         username: maps[i]['username'],
//         country: maps[i]['country'],
//         gender: maps[i]['gender'],
//         dateOfBirth: maps[i]['dateOfBirth'],
//         imageFilePath: maps[i]['imageFilePath'],
//       );
//     });
//   }

//   Future<List<User>> getUsersPaged(int page, int pageSize) async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'users',
//       limit: pageSize,
//       offset: (page - 1) * pageSize,
//     );
//     return List.generate(maps.length, (i) {
//       return User(
//         username: maps[i]['username'],
//         country: maps[i]['country'],
//         gender: maps[i]['gender'],
//         dateOfBirth: maps[i]['dateOfBirth'],
//         imageFilePath: maps[i]['imageFilePath'],
//       );
//     });
//   }

//   Future<List<User>> searchUsers(String searchTerm) async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'users',
//       where:
//           'username LIKE ? OR country LIKE ? OR gender LIKE ? OR dateOfBirth LIKE ?',
//       whereArgs: List.generate(4, (_) => '%$searchTerm%'),
//     );
//     return List.generate(maps.length, (i) {
//       return User(
//         username: maps[i]['username'],
//         country: maps[i]['country'],
//         gender: maps[i]['gender'],
//         dateOfBirth: maps[i]['dateOfBirth'],
//         imageFilePath: maps[i]['imageFilePath'],
//       );
//     });
//   }
// }

// class DataEntryScreen extends StatefulWidget {
//   @override
//   _DataEntryScreenState createState() => _DataEntryScreenState();
// }

// class _DataEntryScreenState extends State<DataEntryScreen> {
//   final TextEditingController usernameController = TextEditingController();
//   bool isCountry1Selected = false;
//   bool isCountry2Selected = false;
//   String selectedGender = '';
//   DateTime? selectedDate;
//   File? _image; // Store the selected image file

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   void saveUserData() async {
//     final userData = User(
//       username: usernameController.text,
//       country:
//           '${isCountry1Selected ? 'Country 1, ' : ''}${isCountry2Selected ? 'Country 2' : ''}',
//       gender: selectedGender,
//       dateOfBirth: selectedDate != null ? selectedDate!.toString() : '',
//       imageFilePath: _image != null ? _image!.path : '',
//     );
//     await DatabaseHelper.instance.insertUser(userData);
//     usernameController.clear();
//     setState(() {
//       isCountry1Selected = false;
//       isCountry2Selected = false;
//       selectedGender = '';
//       selectedDate = null;
//       _image = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Entry'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 controller: usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),
//               SizedBox(height: 16.0),
//               const Text('Select Country:'),
//               CheckboxListTile(
//                 title: const Text('Country 1'),
//                 value: isCountry1Selected,
//                 onChanged: (value) {
//                   setState(() {
//                     isCountry1Selected = value!;
//                   });
//                 },
//               ),
//               CheckboxListTile(
//                 title: Text('Country 2'),
//                 value: isCountry2Selected,
//                 onChanged: (value) {
//                   setState(() {
//                     isCountry2Selected = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Text('Select Gender:'),
//               Radio(
//                 value: 'Male',
//                 groupValue: selectedGender,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGender = value as String;
//                   });
//                 },
//               ),
//               Radio(
//                 value: 'Female',
//                 groupValue: selectedGender,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGender = value as String;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Text('Date of Birth:'),
//               InkWell(
//                 onTap: () {
//                   _selectDate(context);
//                 },
//                 child: InputDecorator(
//                   decoration: InputDecoration(
//                     hintText: 'Select Date',
//                   ),
//                   child: Text(
//                     selectedDate != null
//                         ? '${selectedDate!.toLocal()}'.split(' ')[0]
//                         : 'Select Date',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _getImage();
//                 },
//                 child: Text('Select Image'),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   saveUserData();
//                 },
//                 child: Text('Save User'),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserListPage(),
//                     ),
//                   );
//                 },
//                 child: Text('View User Data'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime picked = (await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     ))!;
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
// }

// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }

// class _UserListPageState extends State<UserListPage> {
//   final TextEditingController searchController = TextEditingController();
//   int currentPage = 1;
//   int pageSize = 10;
//   List<User> userList = [];
//   ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//     _scrollController.addListener(_onScroll);
//   }

//   void _loadUsers() async {
//     final users =
//         await DatabaseHelper.instance.getUsersPaged(currentPage, pageSize);
//     setState(() {
//       userList.addAll(users);
//       currentPage++;
//     });
//   }

//   void _searchUsers(String searchTerm) async {
//     final users = await DatabaseHelper.instance.searchUsers(searchTerm);
//     setState(() {
//       userList.clear();
//       userList.addAll(users);
//     });
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       // User has scrolled to the end, load more users
//       _loadUsers();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search Users',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     _searchUsers(searchController.text);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               itemCount: userList.length,
//               itemBuilder: (context, index) {
//                 final user = userList[index];
//                 return ListTile(
//                   title: Text('Username: ${user.username}'),
//                   subtitle: Text(
//                     'Country: ${user.country}\n' +
//                         'Gender: ${user.gender}\n' +
//                         'Date of Birth: ${user.dateOfBirth}',
//                   ),
//                   leading: user.imageFilePath.isNotEmpty
//                       ? Image.file(File(user.imageFilePath))
//                       : SizedBox(),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
