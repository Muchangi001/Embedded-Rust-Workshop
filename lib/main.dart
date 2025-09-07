import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RustPresentationApp());
}

class RustPresentationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rust & Embedded Systems',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF2B2B2B)),
          headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFDE3C00)),
          bodyLarge: TextStyle(fontSize: 24, color: Color(0xFF2B2B2B)),
          bodyMedium: TextStyle(fontSize: 20, color: Color(0xFF4A4A4A)),
        ),
      ),
      home: PresentationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PresentationScreen extends StatefulWidget {
  @override
  _PresentationScreenState createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  PageController _pageController = PageController();
  int _currentSlide = 0;
  final int _totalSlides = 16;

  // Rust-inspired color palette
  final Color rustOrange = Color(0xFFDE3C00);
  final Color rustBrown = Color(0xFF8B4513);
  final Color lightOrange = Color(0xFFFFF4E6);
  final Color mediumOrange = Color(0xFFFFE5CC);
  final Color darkGray = Color(0xFF2B2B2B);
  final Color lightGray = Color(0xFFF5F5F5);
  final Color mediumGray = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGray,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentSlide = index;
                });
              },
              children: [
                _buildTitleSlide(),
                _buildAgendaSlide(),
                _buildWhatIsEmbeddedSlide(),
                _buildCPlusPlusProblemsSlide(),
                _buildRustIntroSlide(),
                _buildWhyRustSlide(),
                _buildRustAdvantagesSlide(),
                _buildMemorySafetySlide(),
                _buildPerformanceSlide(),
                _buildRustEcosystemSlide(),
                _buildFrontendMobileSlide(),
                _buildBackendSlide(),
                _buildGamingSlide(),
                _buildRoboticsSlide(),
                _buildWrapUpSlide(),
                _buildSetupGuideSlide(),
              ],
            ),
            // Top navigation
            _buildTopNavigation(),
            // Slide counter
            _buildSlideCounter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSlide() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double titleFontSize = constraints.maxWidth * 0.06;
        double subtitleFontSize = constraints.maxWidth * 0.028;
        
        if (constraints.maxWidth < 600) {
          titleFontSize = constraints.maxWidth * 0.08;
          subtitleFontSize = constraints.maxWidth * 0.04;
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.08,
            vertical: constraints.maxHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rust logo representation
              Container(
                width: constraints.maxWidth * 0.2,
                height: constraints.maxWidth * 0.2,
                constraints: BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [rustOrange, rustBrown],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: rustOrange.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.memory,
                    color: Colors.white,
                    size: constraints.maxWidth * 0.1,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.04),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'RUST & EMBEDDED SYSTEMS',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: darkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Embedded Rust Workshop',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: rustOrange,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.06),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: mediumOrange,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: rustOrange, width: 1),
                ),
                child: FittedBox(
                  child: Text(
                    'IEEE Circuits & Systems Society - UoN',
                    style: TextStyle(
                      color: rustBrown,
                      fontSize: constraints.maxWidth * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAgendaSlide() {
    return Center(
      child: _buildResponsiveSlideTemplate(
      title: 'AGENDA',
      children: [
        _buildBulletPoint('What are Embedded Systems?'),
        _buildBulletPoint('The C/C++ Problem'),
        _buildBulletPoint('Enter Rust'),
        _buildBulletPoint('Why Rust for Embedded?'),
        _buildBulletPoint('Rust\'s Advantages'),
        _buildBulletPoint('The Rust Ecosystem'),
        _buildBulletPoint('Beyond Embedded'),
        _buildBulletPoint('Let\'s Get Started!'),
      ],
    ));
  }

Widget _buildWhatIsEmbeddedSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'WHAT ARE EMBEDDED SYSTEMS?',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: rustOrange, width: 2),
                  ),
                  child: Text(
                    'Dedicated computers for specific tasks,\nstandalone or within larger systems!',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: rustBrown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildEmbeddedExample('Smartwatch', Icons.watch, 'ARM Cortex\nLow Power'),
                    _buildEmbeddedExample('Car ECU', Icons.directions_car, 'Multiple MCUs\nReal-time'),
                    _buildEmbeddedExample('IoT Sensor', Icons.sensors, 'ESP32\nWiFi + BLE'),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: mediumOrange,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: rustOrange, width: 1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'CHARACTERISTICS',
                        style: TextStyle(
                          color: rustBrown,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Limited memory, power, processing\nReal-time, reliable, purpose-built',
                        style: TextStyle(
                          color: darkGray,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
}

  Widget _buildCPlusPlusProblemsSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'THE C/C++ PROBLEM',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProblemCard(
                  'Memory Bugs',
                  'Segfaults, buffer overflows, memory leaks\n"It works on my machine" syndrome',
                  Color(0xFFFFE5E5),
                  Color(0xFFD32F2F),
                  Icons.bug_report,
                ),
                SizedBox(height: 15),
                _buildProblemCard(
                  'Concurrency Nightmares',
                  'Race conditions, deadlocks, data corruption\nDebugging is extremely difficult',
                  Color(0xFFFFF3E0),
                  Color(0xFFFF9800),
                  Icons.sync_problem,
                ),
                SizedBox(height: 15),
                _buildProblemCard(
                  'Runtime Surprises',
                  'Crashes in production, undefined behavior\nNo safety net - you\'re on your own!',
                  Color(0xFFFFEBEE),
                  Color(0xFFE91E63),
                  Icons.error_outline,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE5E5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFD32F2F), width: 1),
                  ),
                  child: Text(
                    'Result: Expensive bugs, security vulnerabilities,\ndelayed projects, and stressed developers!',
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: constraints.maxWidth * 0.022,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRustIntroSlide() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double titleFontSize = constraints.maxWidth * 0.06;
        double quoteFontSize = constraints.maxWidth * 0.025;
        
        if (constraints.maxWidth < 600) {
          titleFontSize = constraints.maxWidth * 0.08;
          quoteFontSize = constraints.maxWidth * 0.03;
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.08,
            vertical: constraints.maxHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'ENTER RUST',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: rustOrange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [lightOrange, mediumOrange],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: rustOrange, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: rustOrange.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.security,
                      color: rustBrown,
                      size: 40,
                    ),
                    SizedBox(height: 15),
                    Text(
                      '"A systems programming language that runs blazingly fast,\nprevents segfaults, and guarantees thread safety."',
                      style: TextStyle(
                        fontSize: quoteFontSize,
                        color: rustBrown,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Text(
                      '- Mozilla Foundation',
                      style: TextStyle(
                        fontSize: quoteFontSize * 0.8,
                        color: rustOrange,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 15,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _buildRustBadge(Icons.speed, 'Fast'),
                  _buildRustBadge(Icons.security, 'Safe'),
                  _buildRustBadge(Icons.people, 'Concurrent'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWhyRustSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'WHY RUST FOR EMBEDDED?',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 800;
            
            if (isWide) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildWhyCard(
                          Icons.security,
                          'MEMORY SAFETY',
                          'No segfaults or buffer overflows\nCatch bugs at compile time!',
                          Color(0xFFE8F5E8),
                          Color(0xFF4CAF50),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: _buildWhyCard(
                          Icons.speed,
                          'ZERO OVERHEAD',
                          'Fast as C/C++\nNo garbage collector pauses',
                          Color(0xFFE3F2FD),
                          Color(0xFF2196F3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildWhyCard(
                          Icons.people,
                          'FEARLESS CONCURRENCY',
                          'Multi-core ESP32 support\nNo data races possible!',
                          Color(0xFFF3E5F5),
                          Color(0xFF9C27B0),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: _buildWhyCard(
                          Icons.code,
                          'POWERFUL TYPE SYSTEM',
                          'Express hardware constraints\nin the type system',
                          lightOrange,
                          rustOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWhyCard(
                    Icons.security,
                    'MEMORY SAFETY',
                    'No segfaults or buffer overflows\nCatch bugs at compile time!',
                    Color(0xFFE8F5E8),
                    Color(0xFF4CAF50),
                  ),
                  SizedBox(height: 15),
                  _buildWhyCard(
                    Icons.speed,
                    'ZERO OVERHEAD',
                    'Fast as C/C++\nNo garbage collector pauses',
                    Color(0xFFE3F2FD),
                    Color(0xFF2196F3),
                  ),
                  SizedBox(height: 15),
                  _buildWhyCard(
                    Icons.people,
                    'FEARLESS CONCURRENCY',
                    'Multi-core ESP32 support\nNo data races possible!',
                    Color(0xFFF3E5F5),
                    Color(0xFF9C27B0),
                  ),
                  SizedBox(height: 15),
                  _buildWhyCard(
                    Icons.code,
                    'POWERFUL TYPE SYSTEM',
                    'Express hardware constraints\nin the type system',
                    lightOrange,
                    rustOrange,
                  ),
                ],
              );
            }
          },
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFF4CAF50), width: 2),
          ),
          child: Text(
            'Perfect for resource-constrained, safety-critical embedded systems!',
            style: TextStyle(
              color: Color(0xFF2E7D32),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildRustAdvantagesSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'RUST\'S ADVANTAGES',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 900;
            
            if (isWide) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAdvantage(Icons.lock, 'Ownership System', 'Prevents memory leaks & dangling pointers'),
                        _buildAdvantage(Icons.auto_awesome, 'Zero-Cost Abstractions', 'High-level code, low-level performance'),
                        _buildAdvantage(Icons.find_in_page, 'Pattern Matching', 'Handle all cases, no surprises'),
                        _buildAdvantage(Icons.inventory, 'Cargo Package Manager', 'Thousands of crates available'),
                        _buildAdvantage(Icons.assignment_turned_in, 'Built-in Testing', 'Unit tests, integration tests, docs tests'),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: rustOrange, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CODE EXAMPLE',
                            style: TextStyle(
                              color: rustOrange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: darkGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'fn main() {\n  let led = GpioPin::new(2);\n  led.set_high();\n  // Compiler ensures\n  // memory safety!\n}',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                color: Color(0xFF4CAF50),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAdvantage(Icons.lock, 'Ownership System', 'Prevents memory leaks & dangling pointers'),
                  _buildAdvantage(Icons.auto_awesome, 'Zero-Cost Abstractions', 'High-level code, low-level performance'),
                  _buildAdvantage(Icons.find_in_page, 'Pattern Matching', 'Handle all cases, no surprises'),
                  _buildAdvantage(Icons.inventory, 'Cargo Package Manager', 'Thousands of crates available'),
                  _buildAdvantage(Icons.assignment_turned_in, 'Built-in Testing', 'Unit tests, integration tests, docs tests'),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildMemorySafetySlide() {
    return _buildResponsiveSlideTemplate(
      title: 'MEMORY SAFETY IN ACTION',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 800;
            
            Widget cppExample = Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFFD32F2F), width: 2),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, color: Color(0xFFD32F2F), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'C/C++ WAY',
                        style: TextStyle(
                          color: Color(0xFFD32F2F),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: darkGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'int* ptr = malloc(sizeof(int));\n*ptr = 42;\nfree(ptr);\n*ptr = 24; // Use after free!\n// Segfault at runtime',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFFFF5252),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Runtime crash!',
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );

            Widget rustExample = Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF4CAF50), width: 2),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'RUST WAY',
                        style: TextStyle(
                          color: Color(0xFF4CAF50),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: darkGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'let data = Box::new(42);\n// data automatically freed\n// when it goes out of scope\n\n// Compiler prevents use-after-free!',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFF4CAF50),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Compile-time safety!',
                    style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isWide)
                  Row(
                    children: [
                      Expanded(child: cppExample),
                      SizedBox(width: 20),
                      Expanded(child: rustExample),
                    ],
                  )
                else
                  Column(
                    children: [
                      cppExample,
                      SizedBox(height: 20),
                      rustExample,
                    ],
                  ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: lightOrange,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: rustOrange, width: 1),
                  ),
                  child: Text(
                    'Result: Zero-cost memory safety without a garbage collector!',
                    style: TextStyle(
                      color: rustBrown,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildPerformanceSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'PERFORMANCE COMPARISON',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildPerformanceBar('C/C++', 1.0, Color(0xFF2196F3), Icons.speed),
                    _buildPerformanceBar('Rust', 0.98, rustOrange, Icons.rocket_launch),
                    _buildPerformanceBar('Go', 0.6, Color(0xFF00BCD4), Icons.trending_up),
                    _buildPerformanceBar('Python', 0.1, Color(0xFFFFEB3B), Icons.trending_down),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [lightOrange, mediumOrange],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: rustOrange, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'RUST PERFORMANCE BENEFITS',
                        style: TextStyle(
                          color: rustBrown,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildPerfBenefit(Icons.auto_awesome, 'Zero-cost\nAbstractions'),
                          _buildPerfBenefit(Icons.block, 'No Garbage\nCollector'),
                          _buildPerfBenefit(Icons.av_timer, 'Predictable\nPerformance'),
                          _buildPerfBenefit(Icons.memory, 'Manual Memory\nControl'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRustEcosystemSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'THE RUST ECOSYSTEM',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rust isn\'t just for embedded - it\'s everywhere!',
                  style: TextStyle(
                    color: rustOrange,
                    fontSize: constraints.maxWidth * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    _buildEcosystemCard('Robotics', 'ROS2, ESP HAL, Embassy', rustOrange, Icons.smart_toy),
                    _buildEcosystemCard('Web Backend', 'Axum, Warp, Actix', Color(0xFF4CAF50), Icons.cloud),
                    _buildEcosystemCard('Game Development', 'Bevy Engine', Color(0xFF9C27B0), Icons.sports_esports),
                    _buildEcosystemCard('Desktop Apps', 'Tauri, Egui', Color(0xFF2196F3), Icons.desktop_windows),
                    _buildEcosystemCard('Mobile Apps', 'Tauri Mobile', Color(0xFF3F51B5), Icons.phone_android),
                    _buildEcosystemCard('Frontend', 'Leptos, Yew', Color(0xFFF44336), Icons.web),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: lightGray,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: rustOrange, width: 2),
                  ),
                  child: Text(
                    'Learn once, use everywhere!\nOne language for your entire tech stack!',
                    style: TextStyle(
                      color: darkGray,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildBackendSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'RUST FOR BACKEND',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 900;
            
            Widget featuresList = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeature(Icons.speed, 'BLAZING FAST APIs', 'Handle millions of requests per second'),
                _buildFeature(Icons.security, 'TYPE-SAFE', 'Prevent runtime errors in production'),
                _buildFeature(Icons.memory, 'LOW MEMORY USAGE', 'Perfect for cloud deployment'),
                _buildFeature(Icons.sync, 'ASYNC/AWAIT', 'Handle thousands of concurrent connections'),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F5E8),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF4CAF50), width: 1),
                  ),
                  child: Text(
                    'Companies using Rust:\nDropbox, Discord, Cloudflare, Meta',
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );

            Widget codeExample = Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: rustOrange, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AXUM EXAMPLE',
                    style: TextStyle(
                      color: rustOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: darkGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'use axum::{\n  routing::get,\n  Router\n};\n\n#[tokio::main]\nasync fn main() {\n  let app = Router::new()\n    .route("/", get(hello));\n}',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFF4CAF50),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (isWide) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 2, child: featuresList),
                  SizedBox(width: 20),
                  Expanded(flex: 1, child: codeExample),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  featuresList,
                  SizedBox(height: 20),
                  codeExample,
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildGamingSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'RUST FOR GAMING',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 800;
            
            Widget bevyCard = Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF9C27B0), width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_esports,
                    color: Color(0xFF9C27B0),
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'BEVY ENGINE',
                    style: TextStyle(
                      color: Color(0xFF9C27B0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Data-driven game engine\nbuilt in Rust',
                    style: TextStyle(
                      color: Color(0xFF7B1FA2),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );

            Widget featuresList = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGamingFeature(Icons.speed, 'HIGH PERFORMANCE', 'No garbage collection pauses\nConsistent frame rates'),
                _buildGamingFeature(Icons.security, 'MEMORY SAFETY', 'No crashes from memory bugs\nStable gameplay'),
                _buildGamingFeature(Icons.people, 'PARALLEL PROCESSING', 'Multi-core game loops\nBetter CPU utilization'),
                _buildGamingFeature(Icons.architecture, 'MODULAR DESIGN', 'Entity Component System\nClean, maintainable code'),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3E5F5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF9C27B0), width: 1),
                  ),
                  child: Text(
                    'Perfect for indie games, simulations,\nand even AAA game tools!',
                    style: TextStyle(
                      color: Color(0xFF7B1FA2),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );

            if (isWide) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: bevyCard),
                  SizedBox(width: 20),
                  Expanded(flex: 2, child: featuresList),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bevyCard,
                  SizedBox(height: 20),
                  featuresList,
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildFrontendMobileSlide() {
    return _buildResponsiveSlideTemplate(
      title: 'FRONTEND & MOBILE',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 800;
            
            Widget leptosCard = _buildTechCard(
              'LEPTOS',
              'Frontend Web Framework',
              'Full-stack Rust web apps\nReactive UI components\nServer-side rendering',
              Color(0xFFF44336),
              Icons.web,
            );

            Widget tauriCard = _buildTechCard(
              'TAURI',
              'Desktop & Mobile Apps',
              'Cross-platform native apps\nWeb frontend + Rust backend\niOS, Android, Windows, macOS',
              Color(0xFF2196F3),
              Icons.phone_iphone,
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isWide)
                  Row(
                    children: [
                      Expanded(child: leptosCard),
                      SizedBox(width: 15),
                      Expanded(child: tauriCard),
                    ],
                  )
                else
                  Column(
                    children: [
                      leptosCard,
                      SizedBox(height: 15),
                      tauriCard,
                    ],
                  ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFF2196F3), width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WHY RUST FOR FRONTEND?',
                        style: TextStyle(
                          color: Color(0xFF1976D2),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildFrontendBenefit(Icons.speed, 'Fast compilation\nto WebAssembly'),
                          _buildFrontendBenefit(Icons.security, 'Type safety\nin the browser'),
                          _buildFrontendBenefit(Icons.share, 'Share code between\nfrontend & backend'),
                          _buildFrontendBenefit(Icons.storage, 'Small bundle\nsizes'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRoboticsSlide() {
  return _buildResponsiveSlideTemplate(
    title: 'RUST FOR ROBOTICS',
    children: [
      LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 800;
          
          Widget roboticsCard = Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [lightOrange, mediumOrange],
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: rustOrange, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.smart_toy,
                  color: rustOrange,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'EMBEDDED ROBOTICS',
                  style: TextStyle(
                    color: rustBrown,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );

          Widget featuresList = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoboticsFeature(Icons.memory, 'ESP-HAL', 'Hardware abstraction layer\nfor ESP32 microcontrollers'),
              _buildRoboticsFeature(Icons.timer, 'EMBASSY FRAMEWORK', 'Async embedded runtime\nfor real-time control'),
              _buildRoboticsFeature(Icons.link, 'ROS2 INTEGRATION', 'Native Rust ROS2 nodes\nHigh-performance robotics'),
              _buildRoboticsFeature(Icons.schedule, 'REAL-TIME GUARANTEES', 'Deterministic timing\nNo garbage collection pauses'),
              _buildRoboticsFeature(Icons.health_and_safety, 'SAFETY CRITICAL', 'Memory safety for\nautonomous systems'),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: rustOrange, width: 1),
                ),
                child: Text(
                  'Perfect for drones, autonomous vehicles,\nindustrial automation, and more!',
                  style: TextStyle(
                    color: rustBrown,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );

          if (isWide) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: roboticsCard),
                SizedBox(width: 20),
                Expanded(flex: 2, child: featuresList),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roboticsCard,
                SizedBox(height: 20),
                featuresList,
              ],
            );
          }
        },
      ),
    ],
  );
}

  Widget _buildWrapUpSlide() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double titleFontSize = constraints.maxWidth * 0.06;
        
        if (constraints.maxWidth < 600) {
          titleFontSize = constraints.maxWidth * 0.08;
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.08,
            vertical: constraints.maxHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'LET\'S GET STARTED!',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: rustOrange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE8F5E8), Color(0xFFC8E6C9)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF4CAF50), width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'NEXT STEPS',
                      style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontSize: constraints.maxWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildNextStep(Icons.download, '1.', 'Install Rust & ESP32 toolchain'),
                    _buildNextStep(Icons.developer_board, '2.', 'Get an ESP32 development board'),
                    _buildNextStep(Icons.group, '3.', 'Join our Discord/WhatsApp group'),
                    _buildNextStep(Icons.lightbulb, '4.', 'Start thinking about your project!'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: rustOrange,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: rustOrange.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Text(
                  'Welcome to the Rust Revolution!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper methods for building slide components
  Widget _buildResponsiveSlideTemplate({required String title, required List<Widget> children}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double titleFontSize = constraints.maxWidth * 0.045;
        
        if (constraints.maxWidth < 600) {
          titleFontSize = constraints.maxWidth * 0.06;
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.08,
            vertical: constraints.maxHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: rustOrange,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: rustOrange),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmbeddedExample(String title, IconData icon, String specs) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 140,
      decoration: BoxDecoration(
        color: lightOrange,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: rustOrange, width: 2),
      ),
      child: Column(
        children: [
          Icon(icon, color: rustOrange, size: 30),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: rustBrown,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            specs,
            style: TextStyle(
              color: rustBrown.withOpacity(0.8),
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProblemCard(String title, String description, Color bgColor, Color borderColor, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: borderColor, size: 20),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: borderColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: borderColor.withOpacity(0.8),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRustBadge(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: rustOrange,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: rustOrange.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhyCard(IconData icon, String title, String description, Color bgColor, Color borderColor) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: borderColor, size: 20),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: borderColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: borderColor.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvantage(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: rustOrange, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: rustOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: darkGray,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceBar(String language, double performance, Color color, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 16),
            SizedBox(width: 5),
            Text(
              language,
              style: TextStyle(
                color: darkGray,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          width: 40,
          height: 120,
          decoration: BoxDecoration(
            color: mediumGray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 40,
              height: 120 * performance,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${(performance * 100).toInt()}%',
          style: TextStyle(
            color: darkGray,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPerfBenefit(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: rustBrown, size: 20),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: rustBrown,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEcosystemCard(String title, String subtitle, Color color, IconData icon) {
    return Container(
      width: 130,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: color.withOpacity(0.8),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xFF4CAF50), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: darkGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGamingFeature(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xFF9C27B0), size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF9C27B0),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: darkGray,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechCard(String title, String subtitle, String description, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: color.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: darkGray,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontendBenefit(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xFF1976D2), size: 20),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF1976D2),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRoboticsFeature(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: rustOrange, size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: rustOrange,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: darkGray,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStep(IconData icon, String number, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Icon(icon, color: Color(0xFF2E7D32), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF2E7D32),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button
          GestureDetector(
            onTap: _currentSlide > 0
                ? () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _currentSlide > 0 ? rustOrange : mediumGray,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: _currentSlide > 0 ? Colors.white : Colors.grey[600],
                size: 20,
              ),
            ),
          ),
          // Next button
          GestureDetector(
            onTap: _currentSlide < _totalSlides - 1
                ? () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _currentSlide < _totalSlides - 1 ? rustOrange : mediumGray,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: _currentSlide < _totalSlides - 1 ? Colors.white : Colors.grey[600],
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideCounter() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${_currentSlide + 1}/$_totalSlides',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSetupGuideSlide() {
  return _buildResponsiveSlideTemplate(
    title: 'WORKSHOP SETUP GUIDE',
    children: [
      LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // VS Code Installation
              _buildSetupStep(
                Icons.code,
                '1. Install VS Code',
                'Download from:',
                'https://code.visualstudio.com/',
                rustOrange,
                'https://code.visualstudio.com/',
              ),
              SizedBox(height: 20),
              
              // Rust Installation
              _buildSetupStep(
                Icons.download,
                '2. Install Rust (via rustup)',
                'Get it from:',
                'https://www.rust-lang.org/tools/install',
                Color(0xFF2196F3),
                'https://www.rust-lang.org/tools/install',
              ),
              SizedBox(height: 20),
              
              // Learning Resources
              Column(
                children: [
                  _buildSetupStep(
                    Icons.school,
                    '3. Learn Rust Basics',
                    'Watch: 100 Seconds of Rust',
                    'https://www.youtube.com/watch?v=5C_HPTJg5ek',
                    Color(0xFF4CAF50),
                    'https://www.youtube.com/watch?v=5C_HPTJg5ek',
                  ),
                  SizedBox(height: 8),
                  _buildSetupStep(
                    Icons.video_library,
                    '',
                    'Watch: Rust Installation Walkthrough',
                    'https://www.youtube.com/watch?v=bc18e5nnChE',
                    Color(0xFF4CAF50),
                    'https://www.youtube.com/watch?v=bc18e5nnChE',
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              // Workshop Preparation
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: rustOrange, width: 2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.checklist, color: rustOrange),
                        SizedBox(width: 8),
                        Text(
                          'WORKSHOP PREPARATION',
                          style: TextStyle(
                            color: rustOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    _buildPreparationItem('VS Code installed and working'),
                    _buildPreparationItem('Rust verified with rustc --version'),
                    _buildPreparationItem('Rust Analyzer extension installed'),
                    _buildPreparationItem('Bring laptop charger!'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              // Ready message
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF4CAF50), width: 2),
                ),
                child: Text(
                  '✅ Once complete, you\'ll be ready to write, compile, and run Rust on embedded boards!',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}

// Helper method for setup steps with clickable links
Widget _buildSetupStep(IconData icon, String title, String description, String urlText, Color color, String url) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: color, width: 2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        if (title.isNotEmpty) SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            color: darkGray,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not launch $url'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Text(
            urlText,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
  );
}

// Helper method for preparation items
Widget _buildPreparationItem(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.circle, size: 8, color: rustOrange),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: darkGray,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}
}