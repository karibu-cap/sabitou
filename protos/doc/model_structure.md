## Model Structure

### **1. Core Entities**
- **Company** : Your company, suppliers, customers
- **User** : Users with different roles (admin, salesperson, accountant, etc.)
- **Warehouse** : Warehouses and points of sale
- **Product** : Products with SKU, price, units
- **InventoryLevel** : Current inventory levels by warehouse

### **2. Preparatory Documents**
- **PurchaseOrder** : Supplier purchase order
- **SalesOrder** : Customer sales order
- **Quotation** : Quote/Proforma

### **3. Logistic Documents** (Physical movements)
- **DeliveryNote** : Delivery note (decreases inventory)
- **ReceivingNote** : Receiving note (increases inventory)
- **TransferNote** : Transfer note (inter-warehouse transfer)
- **ReturnNote** : Return note (customer to you or you to supplier)

### **4. Accountable Documents**
- **Invoice** : Invoice (sale or purchase)
- **CreditNote** : Credit note
- **DebitNote** : Debit note

### **5. Payment Documents**
- **Payment** : Standard payment
- **CashReceipt** : Cash receipt (accountable sale)
- **GiftVoucher** : Gift voucher

### **6. Inventory Adjustments**
- **StockAdjustment** : Inventory correction
- **StockCount** : Complete inventory count

### **7. Audit**
- **InventoryTransaction** : Inventory transaction journal

