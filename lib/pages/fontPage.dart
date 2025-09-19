import 'package:flutter/material.dart';
import 'package:flutter_application_1/datasource/get_data.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Fontpage(),
    );
  }
}

class Fontpage extends StatefulWidget {
  const Fontpage({super.key});

  @override
  _FontpageState createState() => _FontpageState();
}

class _FontpageState extends State<Fontpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      // Dummy credentials
      const dummyEmail = 'rijan@gmail.com';
      const dummyPassword = '11111111';

      if (email == dummyEmail && password == dummyPassword) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
 
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Rijan Thapa"),
              accountEmail: const Text("rijan4568@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://scontent.fktm21-2.fna.fbcdn.net/v/t39.30808-6/482011629_1816422099117723_4646625118437710707_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeHEIjUW-WZrq_LJQA_cBS6xIuiPBHdNqrQi6I8Ed02qtCfWgE3_oNYcHj98_PgezKDwF3uqQG3YH4V1XuELlWB1&_nc_ohc=VxOVsKiIECAQ7kNvwHfE4yF&_nc_oc=AdnTBSH-yyMlFwCCiyqMuHYuFv2BWZmTJUNj0IQAhdHROru9MViI1dMkK5APBIZqCvI&_nc_zt=23&_nc_ht=scontent.fktm21-2.fna&_nc_gid=Ju9FfGDQplEsXdeEfb7W1Q&oh=00_AfNMm75hQBn61-x-RAKSYRhBH8ksRmNttBqEi74qheO4uA&oe=684A1FFC",
                ),
              ),
              decoration: const BoxDecoration(color: Colors.blueAccent),
            ),
            const ListTile(leading: Icon(Icons.person), title: Text("Account")),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/fbIcon.png",
                  width: 200,
                  height: 150,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: hidePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Password is required'
                      : null,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
