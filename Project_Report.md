<div align="center">

**PROJECT REPORT**

**ON**

**“Smart Expense Tracker”**

**MASTER OF COMPUTER APPLICATION (M.C.A)**

**2025-2026**

<br><br><br>

**Project Guide:**

**Dr. Ananatha Murthy**
Nitte (Deemed to be University), NMAM Institute of Technology (NMAMIT),
Department of Master of Computer Applications,
Nitte, Karkala, India

<br><br>

**Submitted By:**

**Jescil Jimmy NN25MCA053**
Nitte (Deemed to be University), NMAM Institute of Technology (NMAMIT),
Department of Master of Computer Applications,
Nitte, Karkala, India

</div>

<div style="page-break-after: always;"></div>

**Abstract**

Maintaining personal financial hygiene requires consistent tracking and timely insights, both of which are difficult to achieve using traditional manual ledgers or complex spreadsheet software. This project presents the Smart Expense Tracker, a cross-platform mobile application that simulates a digital financial assistant. It captures daily income and expenses, categorizes transactions, and produces a real-time financial readiness report via an interactive dashboard. The platform provides a dynamic logging interface, automated net balance calculations, and graphical analytics through pie charts and summary cards. The application is built using the Flutter framework and Dart programming language, utilizing a Provider-based architecture for reactive state management. The user interface follows a modern glassmorphic and Material Design 3 system, ensuring accessibility and fluid interactions without requiring external API dependencies for its core offline operations. The evaluation engine is rule-based and transparent, keeping results immediate and making the system easy to extend with local persistent storage or cloud synchronization in the future.

**Keywords:** expense tracking, Flutter, Dart, state management, financial analytics, cross-platform mobile application.

---

### 1. Introduction

**1.1 Background**
Personal financial management typically consists of tracking daily expenditures, planning budgets, and analyzing monthly savings. Most students and young professionals attempt to prepare budgets by reading bank statements or logging numbers into static spreadsheets. Skills that actually ensure financial stability, such as categorizing daily micro-transactions (e.g., Food, Travel, Utilities) and actively monitoring a live net balance, are rarely practiced consistently. Modern mobile frameworks now ship with advanced reactive state management, fluid animation engines, and graphical rendering APIs, which makes it possible to build a visually-driven personal finance environment without relying on external web services.

**1.2 Problem Statement**
Individuals trying to manage their personal finances lack a single, intuitive environment where they can (a) quickly log income and expenses on the go, (b) receive objective feedback on their spending distribution through automated visual charts, and (c) securely keep their financial data grouped by specific categories. Many practice resources and existing apps focus on only one of these aspects, for example, simple list-making without analytics, or overly complex accounting software that deters daily use.

**1.3 Objectives**
• To simulate a comprehensive financial tracking environment with selectable transaction types (Income/Expense) and live data capture.
• To measure and aggregate financial metrics (Total Income, Total Expense, Net Balance) instantaneously upon entry.
• To evaluate categorical spending and generate dynamic visual representations (Pie/Donut charts) of the user's financial habits.
• To compile all records into a streamlined dashboard report with actionable insights and a searchable transaction history.

**1.4 Scope of the Project**
The system is designed for individual personal finance management on a locally hosted mobile environment (Android/iOS). It covers essential financial domains: income logging, expense logging, categorical grouping, chronological sorting, and graphical distribution. Multi-user accounts, bank-level authentication, and automated SMS parsing are outside the current scope and are listed under future enhancements.

---

### 2. System Analysis

**2.1 Gaps in Existing Practice Methods**
Self-tracking from physical notebooks gives no automatic feedback on category totals or net balances. Desktop-based spreadsheets are useful but depend on the availability of a computer and are hard to update on demand during a transaction (e.g., at a store). Existing heavy financial applications often require paid subscriptions or force users to link their bank accounts, raising privacy concerns. These gaps motivate a platform that combines rapid data entry, a secure local working area for data processing, and automatic visual feedback.

**2.2 Proposed System**
The Smart Expense Tracker is a mobile-based studio. The user configures a transaction session by entering a title, amount, category, and date. The user answers by typing into a modern form interface. On submission, the Provider backend scores/aggregates the entry and returns structured feedback to the dashboard. At the end of the session, a final visual report is updated live, stored in the application state, and all completed transactions appear in a history list view.

**2.3 Functional Requirements**

| ID | Requirement |
| :--- | :--- |
| FR1 | **Configure a transaction:** input title, amount, select type (Income/Expense), category, and date. |
| FR2 | **Dynamic Dashboard:** Start a session that immediately reflects Total Income, Total Expense, and Net Balance. |
| FR3 | **Graphical Rendering:** Capture financial data and render it into a categorical Pie Chart automatically. |
| FR4 | **Transaction History:** Provide a scrollable, chronologically sorted list of all past transactions. |
| FR5 | **Deletion & Modification:** Allow users to delete erroneous entries, prompting an automatic recalculation of the dashboard. |

**2.4 Non-Functional Requirements**
• **Usability:** a single-page style dashboard interface with a consistent green and yellow design system, mobile-friendly forms, and intuitive numeric keyboards.
• **Performance:** all data is held in memory using Provider, so UI updates and mathematical aggregations are near-instant on a standard smartphone.
• **Portability:** the project builds with the Flutter SDK and compiles to native ARM code, running on any modern Android or iOS device.
• **Maintainability:** models, state providers, screens, and widgets are separated into distinct directories, and each service has one responsibility.
• **Reproducibility:** financial calculation is deterministic for a given input, which makes results mathematically accurate and testable.

**2.5 Software and Hardware Requirements**

| Item | Requirement |
| :--- | :--- |
| Operating system | Windows, macOS (for development); Android 6.0+ / iOS 11+ (for deployment) |
| Runtime | Flutter SDK (v3.0 or higher), Dart SDK |
| Build tool | Gradle (Android), CMake, Android NDK |
| Environment | Android Studio, Visual Studio Code, or any Dart-compatible IDE |
| Hardware | Minimum 4 GB RAM (8 GB recommended for development), Mobile Device/Emulator for testing |

---

### 3. Technology Stack

| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| Language | Dart | Application logic and object-oriented implementation |
| Framework | Flutter SDK | Cross-platform UI toolkit, widget composition, rendering |
| State Management | Provider (v6.x) | Reactive state management, dependency injection |
| Data Formatting | Intl | Date formatting (e.g., parsing timestamps to human-readable strings) |
| Frontend | Material Design 3 | Mobile-optimized layout, routing, and glassmorphic aesthetics |
| Styling | Flutter ThemeData | Custom Green and Yellow aesthetic via `ColorScheme` tokens |
| Visual Analytics | fl_chart | Rendering dynamic pie charts and data waveforms |
| Testing | Flutter Test | Widget and unit testing environment |
| Version control | Git and GitHub | Source management |

The project is organized into multiple Dart source files separating models, providers, screens, and widgets. The application runs natively on the device utilizing the Impeller/Skia rendering engine, so no separate web server is needed.

---

### 4. System Design

**4.1 Architecture**
The application follows a Model-View-ViewModel (MVVM) inspired architecture utilizing the Provider pattern. The mobile operating system hosts the application. It communicates internally through reactive listeners. On the UI side, Consumer widgets handle display updates and delegate all business logic to the Provider services. Providers read and write to an in-memory transactional store.

| Layer | Components | Responsibility |
| :--- | :--- | :--- |
| Presentation | `main.dart`, `home_screen.dart`, `add_transaction_screen.dart` | Rendering, user interaction, form validation, and navigation |
| Controller / Provider | `TransactionProvider` | Action mapping, listening to events, mathematical calculations |
| Service / Widgets | `transaction_chart.dart`, `summary_cards.dart` | Business rules, graphical scoring, and specialized rendering |
| Data | `transaction.dart` (Model), Concurrent in-memory list | Active sessions, UUID generation, data schemas |

**4.2 Module Description**
• **Dashboard Studio (`home_screen.dart`):** the live session screen with the aggregated summary cards, visual chart HUD, and chronologically sorted transaction list.
• **Transaction Setup (`add_transaction_screen.dart`):** collects the transaction configuration (amount, title, category, date) using validated form keys.
• **Evaluation Engine (`TransactionProvider`):** scores/aggregates each numerical input, maps expenses to their specific categories, and calculates the net balance.
• **Graphical Analytics (`transaction_chart.dart`):** geometry-based analysis that maps category totals into distinct PieChart segments.

**4.3 Domain Model**

| Class | Key attributes |
| :--- | :--- |
| `TransactionModel` | `id` (UUID), `title`, `amount`, `type` (Income/Expense), `category`, `date`, `notes` |
| `TransactionProvider` | `_transactions` (List), `totalIncome`, `totalExpense`, `netBalance`, `expenseCategoryBreakdown` |

**4.4 Core Methods & State Design**
*(Since this application operates entirely on-device, internal Provider methods replace traditional REST API endpoints).*

| Method Type | Function Name | Description |
| :--- | :--- | :--- |
| GET (Getter) | `get transactions` | List all transactions sorted by date descending |
| POST (Action) | `addTransaction(tx)` | Create a new transaction session and append it to the list |
| PUT (Action) | `updateTransaction(tx)` | Modify an existing transaction matching the UUID |
| DELETE (Action)| `deleteTransaction(id)` | Remove a transaction from the active session via UUID |
| GET (Computed) | `get expenseCategoryBreakdown`| Returns a Map of strings to doubles for chart rendering |

**4.5 Application Workflow**
1. The candidate opens the application and views the Dashboard Studio.
2. To log data, they press the Floating Action Button, navigating to the setup form.
3. The user answers by typing the Title, Amount, and selecting Income/Expense via segmented buttons.
4. On submit, the client sends the data object to the `TransactionProvider`. The provider scores the input and adds it to the list.
5. `notifyListeners()` is called, immediately updating the HUD (Summary Cards and Chart).
6. Steps 2 to 5 repeat for each entry. 
7. The user can tap the delete icon on any history item to remove it, triggering an instant recalculation of the final report.

---

### 5. Implementation

**5.1 Application Structure**
The application class (`SmartExpenseTrackerApp`) bootstraps Flutter, and the root widget receives its services through `ChangeNotifierProvider` injection. `TransactionProvider` keeps active data in a synchronized list. Saving a report for a session replaces any earlier visual state. The `MaterialApp` enforces the global theme (Green/Yellow) and serves the static frontend with no-cache requirements so changes appear immediately during development (Hot Reload).

**5.2 Transaction Evaluation Engine**
`TransactionProvider` scores every submitted entry. It counts the numerical values, checks which of the categories the amount belongs to, and applies the following mathematical rules:

| Metric | Rule |
| :--- | :--- |
| Total Income | Sum of all `amount` where `type == TransactionType.income`. |
| Total Expense | Sum of all `amount` where `type == TransactionType.expense`. |
| Net Balance | `Total Income` minus `Total Expense`. Can be negative if expenses exceed income. |
| Category Breakdown | Loops through expenses. `breakdown[category] = (existing ?? 0.0) + amount`. |

When a session is finalized, the engine averages the per-category scores and derives the axes for the `fl_chart` geometry, assigning specific color hexes (e.g., Amber, Light Green, Deep Green) to distinct categories dynamically.

**5.3 Form Validation Analyser**
The `FormState` compares the text input against strict validation rules. If an empty title is supplied, an error string is generated. The numeric amount field is parsed using `double.tryParse()`; characters and symbols are rejected, preventing null-pointer exceptions in the evaluation engine.

**5.4 Visual Analytics Frontend**
The frontend is a Material 3 single-page application. A small observable state module (`Consumer<TransactionProvider>`) holds the active session metrics. The main components are:
• **SummaryCards:** Three elevated surfaces displaying dynamic strings formatted to 2 decimal places.
• **TransactionChart:** Draws the expense distribution as a live mathematical waveform (Pie Chart) using Canvas API equivalents.
• **TransactionListView:** A recycling `ListView.builder` that efficiently renders only the UI components currently visible on the screen, maintaining high frames-per-second (FPS).

---

### 6. Testing

The repository utilizes Flutter's internal debug context. The functional scenarios below are derived from the implemented rules and state the behavior the system is expected to show. They are executed manually through the UI or via device emulators.

| No. | Scenario | Expected result |
| :--- | :--- | :--- |
| 1 | Start the application with no transactions | Dashboard loads with "$0.00" defaults and a "No expenses to show" placeholder |
| 2 | Submit a new Income of $5000 | Net Balance updates to $5000, Income card updates, List displays green arrow |
| 3 | Submit an Expense of $150 (Category: Food) | Net Balance drops to $4850, Expense card shows $150, Pie chart renders a 100% segment for Food |
| 4 | Submit an Expense of $150 (Category: Travel) | Pie chart dynamically splits into two equal 50% segments |
| 5 | Submit empty form data | Form validation halts submission, red error text appears under TextFields |
| 6 | Delete the Income transaction | Income drops to $0, Balance drops to -$300 (Negative) |

---

### 7. Results and Discussion

**7.1 Worked Calculation Example**
Consider a user who inputs a Salary (Income) of $2000. The technical score for Total Income becomes 2000. They add an expense for Rent ($800) and Food ($200). The `expenseCategoryBreakdown` maps: `{"Rent": 800.0, "Food": 200.0}`.
The Total Expense evaluates to $1000. The Overall Score (Net Balance) is calculated as $2000 - $1000 = $1000. 
The graphical engine processes the map and allocates 80% (800/1000) of the pie chart radius to Rent, and 20% to Food.

**7.2 Objectives versus Outcomes**

| Objective | Outcome |
| :--- | :--- |
| Realistic transaction simulation | Income/Expense toggles, intuitive forms, date pickers implemented |
| Delivery metrics | Live Net Balance, Income, and Expense counters update instantly |
| Graphical evaluation | Per-category scores plotted perfectly on a dynamic Canvas Pie Chart |
| Integrated workspace | Forms, charts, and historical lists combined in one seamless application |

**7.3 Discussion**
The main strength of the Provider-based design is transparency and speed: every state change can be traced directly to a specific user action, results are reproducible, no external service or internet connection is needed, and the platform works entirely offline. The trade-off is that in-memory storage clears upon a full application restart, making this version an excellent practice aid and prototype rather than a permanent ledger.

---

### 8. Limitations

• **In-memory storage:** sessions and reports are lost when the mobile application is completely killed by the OS, as there is currently no local database integration.
• **Rule-based categorization:** categorization relies on a predefined list of keywords (Food, Travel, etc.). It does not automatically infer categories from arbitrary text.
• **No user profiles:** there is no user account system or authentication, meaning data cannot be synced across multiple devices.
• **Simulated security:** the application operates safely in a local sandbox, but lacks biometric locks (Fingerprint/FaceID) to protect sensitive financial data from physical device intruders.

---

### 9. Future Enhancements

1. **Persistent storage:** move sessions and reports to a relational local database such as SQLite using `sqflite` or NoSQL via `Hive`, so progress can be tracked over years.
2. **LLM-based receipt scanning:** replace or complement manual entry with an AI model (via camera APIs) that parses physical receipts and automatically judges the amount and category.
3. **Authentication and profiles:** add Firebase Authentication with login, per-user history, and cloud synchronization.
4. **Export capabilities:** add PDF or CSV generation to allow users to export their financial reports for tax purposes.
5. **Real-time budget alerts:** use background workers and push notifications to alert the user when they have exceeded a predefined monthly limit in a specific category.

---

### 10. Conclusion

This project delivers a working financial mock-up platform that brings rapid data interaction, dynamic graphical calculations, and structured feedback into one mobile application. The layered Provider architecture, the explicit mathematical formulas, and the modular Dart frontend make the system easy to understand, run, and extend. While the present evaluation is strictly locally scoped and storage is simplified, the design isolates these parts behind services, so they can be seamlessly upgraded to SQLite persistence and cloud synchronization without redesigning the core application. The project demonstrates practical use of state management, mobile UI design tokens, graphical Canvas APIs, and single-page application concepts.

---

**References**
1. Flutter Framework Documentation, Google. *flutter.dev/docs*
2. Dart Programming Language Specification. *dart.dev/guides*
3. Provider Package Documentation. *pub.dev/packages/provider*
4. FL Chart Interactive Graphics Library. *pub.dev/packages/fl_chart*
5. Material Design 3 Guidelines, Google. *m3.material.io*
6. E. Gamma, R. Helm, R. Johnson, J. Vlissides, *Design Patterns: Elements of Reusable Object-Oriented Software*, Addison-Wesley, 1994.
7. Project source code structure and localized repository configuration.
