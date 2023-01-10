import 'package:example/core/simple_routes.dart';
import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: SimpleRoutes.of(context),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const route = "/HomePage";
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final router = SimpleRouter.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => router.push(const PageA()),
                    child: const Text("push")),
                TextButton(
                    onPressed: () => router.to(const PageA()),
                    child: const Text("to")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => router.pushNamed(PageA.route),
                    child: const Text("pushNamed")),
                TextButton(
                    onPressed: () => router.toNamed(PageA.route),
                    child: const Text("toNamed")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => router.pushReplacement(const PageB()),
                    child: const Text("pushReplacement")),
                TextButton(
                    onPressed: () => router.off(const PageB()),
                    child: const Text("off")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => router.pushReplacementNamed(PageB.route),
                    child: const Text("pushReplacementNamed")),
                TextButton(
                    onPressed: () => router.offNamed(PageB.route),
                    child: const Text("offNamed")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () async {
                      router.push(const PageC());
                      await Future.delayed(const Duration(seconds: 1));
                      router.pushAndRemoveUntil(const PageD());
                    },
                    child: const Text("pushAndRemoveUntil")),
                TextButton(
                    onPressed: () async {
                      router.to(const PageC());
                      await Future.delayed(const Duration(seconds: 1));
                      router.offAll(const PageD());
                    },
                    child: const Text("offAll")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () async {
                      router.pushNamed(PageC.route);
                      await Future.delayed(const Duration(seconds: 1));
                      router.pushNamedAndRemoveUntil(PageD.route);
                    },
                    child: const Text("pushNamedAndRemoveUntil")),
                TextButton(
                    onPressed: () async {
                      router.toNamed(PageC.route);
                      await Future.delayed(const Duration(seconds: 1));
                      router.offAllNamed(PageD.route);
                    },
                    child: const Text("offAllNamed")),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TextButton(
            //         onPressed: () async {
            //           router.push(const PageA());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.push(const PageB());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.push(const PageC());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.push(const PageD());
            //           router.popUntil((route) => route.settings.name == HomePage.route);
            //         },
            //         child: const Text("popUntil")),
            //     TextButton(
            //         onPressed: () async {
            //           router.to(const PageA());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.to(const PageB());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.to(const PageC());
            //           await Future.delayed(const Duration(milliseconds: 500));
            //           router.to(const PageD());
            //           router.until((route) => route.settings.name == HomePage.route);
            //         },
            //         child: const Text("until")),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => router.pop(), child: const Text("pop")),
                TextButton(
                    onPressed: () => router.back(), child: const Text("back")),
              ],
            ),
            TextButton(
                onPressed: () async {
                  router.push(const PageA());
                  await Future.delayed(const Duration(milliseconds: 500));
                  router.push(const PageB());
                  await Future.delayed(const Duration(milliseconds: 500));
                  router.push(const PageC());
                  await Future.delayed(const Duration(milliseconds: 500));
                  router.push(const PageD());
                  await Future.delayed(const Duration(milliseconds: 500));
                  router.close(4);
                },
                child: const Text("close(4)")),
          ],
        )),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  static const route = "/PageA";
  const PageA({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(route),
      ),
      body: const Center(child: Text(route)),
    );
  }
}

class PageB extends StatelessWidget {
  static const route = "/PageB";
  const PageB({super.key});
  @override
  Widget build(BuildContext context) {
    final router = SimpleRouter.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(route),
        ),
        body: Center(
            child: TextButton(
                onPressed: () => router.offAll(const HomePage()),
                child: const Text("offAll Home"))),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  static const route = "/PageC";
  const PageC({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(route),
        ),
        body: const Center(child: Text(route)),
      ),
    );
  }
}

class PageD extends StatelessWidget {
  static const route = "/PageD";
  const PageD({super.key});
  @override
  Widget build(BuildContext context) {
    final router = SimpleRouter.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(route),
        ),
        body: Center(
            child: TextButton(
                onPressed: () => router.offAll(const HomePage()),
                child: const Text("offAll Home"))),
      ),
    );
  }
}
