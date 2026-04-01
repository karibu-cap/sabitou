# sabitou-clients

clients of the inventory management project.

# Prompt: Advanced Document Engine with Dynamic Templating (SabitouDocEngine)

**Role**: Senior Flutter Architect.
**Task**: Build a reusable Flutter library named `SabitouDocEngine` that handles PDF generation, previewing, downloading, and printing across different data collections (CashReceipt, Bill, PurchaseOrder, etc.) using a **pluggable templating system**.
how is work. one business can have multiple store but all the other collection are link to the store. the user after create some document can (print, preview, download) a document of (purchase order, bill, payment, receivin note, cash receiving, voucher) the cash receiving, voucher are particular because the are direcly print when the cassier valide the user order.

## 1. Core Architecture: The "Template Registry"

The library must separate document management logic from the visual design (templates).

- **Abstract Template Class**: Define a `DocumentTemplate<T>` abstract class.
- **Registry**: The engine must maintain a `Map<Type, DocumentTemplate>` acting as a **Default Template Registry**.
- **Template Selection**: Methods like `preview`, `print`, and `download` must accept an optional `overrideTemplate` parameter. If provided, use it; otherwise, fallback to the default registered template for that data type.

## 2. Requirements by Document Type

The engine must automatically handle different paper formats based on the template:

- **POS Receipts (e.g., CashReceipt)**: Default to `PdfPageFormat.roll80` (thermal printer).
- **Accounting Docs (e.g., Bill, PurchaseOrder)**: Default to `PdfPageFormat.a4` (standard office printer).

## 3. Technical Implementation Details

### A. The Template Interface

```dart
abstract class DocumentTemplate<T> {
  // Generates the PDF bytes.
  // Supports both Vector (pdf widgets) and Capture (RepaintBoundary) logic.
  Future<Uint8List> build(T data, {PdfPageFormat format});

  // The suggested format for this template (e.g., roll80 for receipts)
  PdfPageFormat get defaultFormat;
}

B. The Engine Manager (Sabitou`DocEngine`)
* `registerDefaultTemplate<T>(DocumentTemplate<T> template)`: Maps a data collection type to a default design.
* `preview<T>(BuildContext context, T data, {DocumentTemplate<T>? overrideTemplate})`: Shows the PDF preview.
* `print<T>(T data, {DocumentTemplate<T>? overrideTemplate})`: Sends the doc to the printer.
* `download<T>(T data, {DocumentTemplate<T>? overrideTemplate})`: Saves the doc to the device.
4. Key Features
* Data-Driven Layouts: Templates must access all fields from the provided data (e.g., if `owed_to_customer > 0` on a `CashReceipt`, show the "Change/Voucher" section).
* Branding: Templates should accept a `CompanyProfile` object (Logo, Address, Tax ID) for consistent branding.
* Offline-First: All generation must happen locally on the device.
5. Expected Output
1. The full code for the Sabitou`DocEngine` and `DocumentTemplate` classes.
2. An example of a `DefaultCashReceiptTemplate` using `PdfPageFormat.roll80`.
3. An example of a `DefaultPurchaseOrderTemplate` using `PdfPageFormat.a4`.
4. A code snippet showing how to call `DocEngine.preview(context, myReceipt)` and how to override it with a `CustomCustomerTemplate()`.


you can redesign the implementation as you convecance. before implementa, if you have any question for clarifciation let me know.  or you can start step by step it's only when the first step end and i confirm with `next step ` that you can continue.
```
