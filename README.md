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

# Core File & Media Manager (SabitouFileManager)

**Role**: Senior Flutter & Infrastructure Architect & UI/UX Specialist.
**Task**: Build a generic internal library named `SabitouFileManager` to handle all file types (Images, PDFs, Documents) across different modules (Product, Bill, Store, User) in an offline-first environment.

## 1. Core Architecture

- **Generic File Handler**: The library must handle different file categories using an `enum FileCategory { product, bill, store, avatar, document }`.
- **Storage Strategy**:
  - **Database**: Store only the **Remote Path/URL** (String) in PowerSync/SQLite.
  - **Local Filesystem**: Use a structured directory tree: `app_docs/{category}/{file_id}.ext`.
- udpate the docker file to integrate minio
- **MinIO Integration**: Use S3-compatible logic to sync local files with the MinIO instance hosted on Coolify.

## 2. Advanced Features

### A. Intelligent Compression Engine

Before any upload, the library must automatically process the file based on its type:

- **Images (JPEG/PNG)**: Downscale to max 1024px, compress to 70% quality, and strip metadata.
- **Documents (PDF)**: Verify file size limits and optimize if possible.
- **Grayscale Option**: Ability to convert images to grayscale for documents (Bills/Invoices) to save bandwidth.

## 3. Advanced UI/UX Suite (The "Plug-and-Play" Interface)

The library must provide a high-level UI entry point so developers don't have to rebuild pickers:

- **`SabitouFilePicker.show()`**: A universal Widget that handles:
  - **Selection Source**: Camera, Gallery, or Local Device File Picker.
  - **Multi-Selection**: Parameter `allowMultiple` (bool).
  - **Validation**: Enforce `allowedExtensions` (e.g., only PDF for Bills, only JPG for Products).
- **Live Preview Grid**: A widget that displays thumbnails of selected files with a "Delete" (X) button before confirming the upload.
- **Progress Feedback**: Integrated loading states (linear progress bar) during compression and upload.

## 4. Intelligent Processing Engine

- **Compression Service**:
  - Auto-detect file type.
  - Images: Resize to max 1024px, 70% JPEG quality.
  - Grayscale Toggle: Option to convert images to B&W for document scans.
- **Naming Convention**: Generate unique, collision-proof filenames (e.g., `uuid_timestamp.ext`).

### B. The Sync & Cache Manager

- **Reactive Cache**: A widget or helper that:
  1. Checks if `{file_path}` exists locally.
  2. If yes, returns the `File` object immediately.
  3. If no, downloads it from MinIO in the background, saves it, and then updates the UI.
- **Upload Queue**: A persistent background queue that retries uploads of offline-captured files (e.g., a photo of a new product taken without signal).

## 3. Library API Design

The library should expose a simple, unified API:

- `Future<String> prepareAndUpload(File file, FileCategory category)`: Compresses the file, saves it locally, queues the upload, and returns the path to be saved in the DB.
- `Widget SabitouFilePreview(String remotePath, FileCategory category)`: A generic widget that displays an image (with caching) or an icon for PDFs.
- `Future<File> getFile(String remotePath)`: Returns the local File object, downloading it if necessary.

## 4. Technical Constraints

- **Low Bandwidth Optimized**: Must use a "Connection Heartbeat" before starting large uploads.
- **Dependency Stack**: `flutter_image_compress`, `path_provider`, `dio` (for robust downloads), `cached_network_image`.
- **Offline-First**: All metadata (paths) must be ready in the DB immediately, even if the "Binary" (the actual file) is still pending upload/download.

## 5. API Usage Example (Developer Experience)

The goal is to trigger the whole flow with minimal code:

```dart
// Example: Adding images to a product
SabitouFilePicker.show(
  context: context,
  category: FileCategory.product,
  allowMultiple: true,
  limit: 2,
  onComplete: (List<String> remotePaths) {
    // Update your PowerSync Product model with the new paths
    productRepository.updateImages(productId, remotePaths);
  },
);
```

## 6. Expected Output

1. The `SabitouFileManager` singleton class.
2. The `CompressionService` logic for JPEG/PDF optimization.
3. UploadQueue: Background sync manager for offline scenarios.
4. FilePreviewWidget: A reusable widget to display any file (Public/Private) by its path.
5. Examples of usage for:
   - Uploading a product image.
   - Downloading and viewing a Bill PDF.
   - Capturing a Store front photo offline.
6. SabitouFilePicker: The generic UI Widget
