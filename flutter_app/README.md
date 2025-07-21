# sabitou_clients

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Design System

We use [Atomic Design](https://bradfrost.com/blog/post/atomic-web-design/) methodology to build a scalable and maintainable design system that works seamlessly across mobile, web, and desktop platforms. Here's why:

### Atomic Design Benefits

1. **Consistency Across Platforms**
   - Atoms (basic components) remain consistent across all platforms
   - Shared design language ensures uniform user experience
   - Easier maintenance of brand identity

2. **Scalability**
   - Components are built from smallest (atoms) to largest (templates)
   - Easy to create new features by combining existing components
   - Reduces development time and technical debt

3. **Reusability**
   - Components are platform-agnostic
   - Same building blocks work for mobile, web, and desktop
   - Reduces duplicate code and maintenance effort

4. **Structure**

Our atomic design hierarchy:
   - Atoms: buttons, inputs, icons, colors
   - Molecules: form groups, cards, navigation items
   - Organisms: forms, headers, product lists
   - Templates: page layouts, screen structures
   - Pages: specific instances of templates

5. **Development Workflow**
   - Component-first development approach
   - Easy to test and update common and individual elements across the system
   - Consistent user experience across different sections
   - Faster development of new features using existing components
   - Simplified collaboration between design and development 



### How to Break Down Design

Breaking down complex screens into atomic components is crucial for maintainable and scalable applications. Let's examine how to decompose a Store Sales Dashboard using atomic design principles:

1. **Example: Sales Dashboard Breakdown**
   
   Consider a complex sales dashboard with multiple features:
   - Navigation drawer
   - Sales summary cards
   - Product performance charts
   - Inventory alerts
   - Recent transactions list

2. **Component Breakdown**

   **Atoms:**
   - Typography (headings, body text)
   - Colors (primary, secondary, alert colors)
   - Icons (sales, inventory, menu icons)
   - Basic inputs (search field, date picker)
   
   **Molecules:**
   - Sales metric card (combines icon, value, and label)
   - Chart legend item (combines color indicator and label)
   - Transaction row (combines product image, name, and price)
   
   **Organisms:**
   - Navigation drawer (combines logo, menu items, and user profile)
   - Sales chart section (combines chart, legend, and time filters)
   - Transaction list (combines header, search, and transaction rows)
   
   **Templates:**
   - Dashboard layout (defines grid structure and component placement)
   - Responsive container (handles layout adaptation)
   
   **Pages:**
   - Complete sales dashboard (implements template with specific data)

3. **Representation & Matching**
   - Atoms (at `lib/widgets/atoms`): with a suffix **WAtom**, it represent abstract widgets (buttons, text fields, icons)
   - Molecules (at `lib/widgets/features`): with a suffix **WFeat**, it represent  sandbox features (login form, search bar with filters)
   - Organisms (at `lib/widgets/views`): with a suffix **WView**, it represent connected features (complete navigation drawer, product grid with filters)
   - Template (at `lib/widgets/layouts`): with a suffix **WLay**, it represent layout blueprints (how organisms are positioned and aligned)
   - Page (ast `lib/router/routes/**`): concrete implementations with real data and business logic

