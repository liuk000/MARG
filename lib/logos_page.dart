import 'package:flutter/material.dart';
import 'languages.dart';

class LogosPage extends StatefulWidget {
  const LogosPage({super.key});

  @override
  State<LogosPage> createState() => _LogosPageState();
}

class _LogosPageState extends State<LogosPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToLanguages() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LanguagePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeIn,
          child: GestureDetector(
            onTap: _navigateToLanguages,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  // Title
                  Text(
                    'Con il contributo di',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // EU flag + NextGenerationEU side by side
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/images/loghi/eu.png',
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Image.asset(
                          'assets/images/loghi/next.png',
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Ministero della Cultura
                  Image.asset(
                    'assets/images/loghi/Ministero_della_Cultura.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                  // Comune di Cascia
                  Image.asset(
                    'assets/images/loghi/Cascia-Stemma.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Comune di Cascia',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(flex: 2),
                  // Tap to continue hint
                  Text(
                    'Tocca per continuare',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
