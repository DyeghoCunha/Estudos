import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/fundoSimplesNacional2.png"),
                fit: BoxFit.cover,
              )),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                            flex: 15,
                            child: Image.asset(
                              "assets/images/logo2.png",
                            )),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Já tem Cadastro ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Text("Faça seu login e esteja no controle do seu futuro", style: TextStyle(fontSize: 14),),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 8,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Faça seu login e esteja no ',
                              style: TextStyle(color: Colors.green),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'controle',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' do seu futuro.'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 4.0,
                                spreadRadius: 2.0)
                          ]),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.symmetric(vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.yellowAccent),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Digite seu Email",
                            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7)),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 4.0,
                                spreadRadius: 2.0)
                          ]),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        obscureText: isObscureText,
                        controller: senhaController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.yellowAccent,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Digite a sua senha",
                          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7)),
                          prefixIcon: const Icon(Icons.key_outlined),
                          prefixIconColor: Theme.of(context).colorScheme.onBackground,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      // color: Colors.green,
                      height: 40,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const MainPage()),);

                            // if (emailController.text.trim() == "dyeghocunha@gmail.com" &&
                            //     senhaController.text.trim() == "12345") {
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const MainPage()),);
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text(
                            //         "Erro ao "
                            //         "efetuar o login",
                            //         textAlign: TextAlign.center,
                            //       ),
                            //     ),
                            //   );
                            // }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        "Esqueci miha senha",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        "Criar conta",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900]),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
