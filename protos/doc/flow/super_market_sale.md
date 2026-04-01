# 🛒 Tables Utilisées par Scénario - Supermarché

## 📊 Vue d'Ensemble

| Scénario | Fréquence | Complexité | Tables Principales | Impact Inventaire |
|----------|-----------|------------|-------------------|-------------------|
| **Scénario 1** - Vente normale | **90-95%** | ⭐ Simple | CashReceipt | ✅ Immédiat |
| **Scénario 2** - Pas de monnaie | **2-5%** | ⭐⭐ Moyen | Invoice + GiftVoucher | ✅ Immédiat |
| **Scénario 3** - Client entreprise | **3-5%** | ⭐⭐⭐ Complexe | Invoice + Payment | ✅ Immédiat |

---

## SCÉNARIO 1️⃣ : Vente Normale au Comptoir (RECOMMANDÉ)

### 🎯 Cas d'Usage
- Client anonyme qui paie comptant
- Paiement exact ou avec monnaie disponible
- Transaction rapide (< 2 minutes)

### 📋 Tables Impliquées

#### **Table Principale : CashReceipt**
```
Enregistrement complet de la transaction en UN document
```

| Champ | Valeur Exemple | Description |
|-------|----------------|-------------|
| `receipt_id` | "CASH-2025-0001" | Identifiant unique |
| `cashier_user_id` | "USR-CAISSE-01" | Quel caissier |
| `customer` | `null` | Client anonyme |
| `warehouse_id` | "WH-SUPERMARKET-01" | Point de vente |
| `items[]` | `[{product: "PRD-PAIN", qty: 2, price: 500}]` | Produits achetés |
| `subtotal` | 2000 | Avant taxes |
| `tax_amount` | 400 | TVA 20% |
| `total_amount` | 2400 | Montant final |
| `amount_paid` | 2400 | Ce que le client donne |
| `change_given` | 0 | Monnaie rendue |
| `payment_method` | `[PAYMENT_METHOD_CASH]` | Cash/Carte/Mobile |
| `transaction_time` | 2025-09-29T14:30:00Z | Horodatage |

#### **Tables Automatiques (créées en arrière-plan)**

**InventoryTransaction** (Journal d'audit)
```
Pour chaque produit dans le CashReceipt
```
| Champ | Valeur |
|-------|--------|
| `transaction_type` | `TXN_TYPE_SALE` |
| `quantity_change` | `-2` (Pain sort du stock) |
| `related_document_type` | "CashReceipt" |
| `related_document_id` | "CASH-2025-0001" |

**InventoryLevel** (Mise à jour du stock)
```
quantity_available -= 2
```

### ✅ Avantages
- ✨ **UN SEUL document** (pas de complexité)
- ⚡ **Rapide** en caisse
- 📝 **Simple** pour le caissier
- 🔍 **Traçable** (audit complet)

---

## SCÉNARIO 2️⃣ : Caissier N'a Pas de Monnaie

### 🎯 Cas d'Usage
- Client paie 15000 XAF pour un achat de 12000 XAF
- Caisse n'a pas 3000 XAF de monnaie
- Émission d'un bon d'achat pour le surplus

### 📋 Tables Impliquées

#### **Étape 1 : Première Transaction**

**Table 1 : Invoice** (Facture de vente)
```
Document comptable principal
```
| Champ | Valeur Exemple |
|-------|----------------|
| `invoice_id` | "INV-2025-001" |
| `invoice_type` | `INVOICE_TYPE_SALES` |
| `issuer_id` | "CMP-SUPERMARKET" |
| `recipient_id` | `null` ou ID client si connu |
| `items[]` | `[{product: "PRD-RIZ", qty: 2, price: 5000}]` |
| `total_amount` | 12000 |
| `status` | `INVOICE_STATUS_PAID` |
| `issue_date` | 2025-09-29 |

**Table 2 : Payment** (Enregistrement du paiement)
```
Capture le surplus
```
| Champ | Valeur Exemple |
|-------|----------------|
| `payment_id` | "PAY-2025-001" |
| `payer_id` | Client ID |
| `payee_id` | "CMP-SUPERMARKET" |
| `amount` | 15000 ⚠️ (plus que la facture) |
| `related_invoice_id` | "INV-2025-001" |
| `payment_method` | `PAYMENT_METHOD_CASH` |
| `status` | `PAYMENT_STATUS_COMPLETED` |
| `notes` | "Surplus 3000 XAF converti en bon" |

**Table 3 : GiftVoucher** (Bon d'achat créé) 🎟️
```
Représente le crédit magasin
```
| Champ | Valeur Exemple | Description |
|-------|----------------|-------------|
| `voucher_id` | "GV-2025-001" | ID interne |
| `voucher_code` | "BON-2025-0001" | **Code imprimé sur le ticket** |
| `initial_value` | 3000 | Surplus = 15000 - 12000 |
| `remaining_value` | 3000 | Pas encore utilisé |
| `currency` | "XAF" | |
| `issued_to_customer` | `null` | Transférable |
| `issued_by_user_id` | "USR-CAISSE-01" | Qui a créé |
| `status` | `VOUCHER_STATUS_ACTIVE` | Utilisable |
| `issued_at` | 2025-09-29T14:30:00Z | |
| `valid_until` | 2026-09-29 | 1 an de validité |

**Tables Automatiques :**
- `InventoryTransaction` (audit)
- `InventoryLevel` (stock mis à jour)

---

#### **Étape 2 : Client Revient Utiliser le Bon**

**Table 1 : CashReceipt** (Nouvel achat)
```
Transaction normale avec paiement mixte
```
| Champ | Valeur Exemple |
|-------|----------------|
| `receipt_id` | "CASH-2025-0003" |
| `items[]` | `[{product: "PRD-HUILE", qty: 1, price: 4000}]` |
| `total_amount` | 4800 |
| `amount_paid` | 4800 |
| `payment_method` | `PAYMENT_METHOD_CASH` |
| `notes` | "Payé: Bon 3000 XAF + Cash 1800 XAF" |

**Table 2 : VoucherTransaction** (Utilisation du bon)
```
Lie le bon à la transaction
```
| Champ | Valeur Exemple |
|-------|----------------|
| `transaction_id` | "VT-001" |
| `voucher_id` | "GV-2025-001" |
| `related_receipt_id` | "CASH-2025-0003" |
| `amount_used` | 3000 |
| `remaining_after` | 0 (épuisé) |
| `used_at` | 2025-10-05T10:15:00Z |
| `used_by_user_id` | "USR-CAISSE-02" |

**Table 3 : GiftVoucher** (Mise à jour)
```
État du bon après utilisation
```
| Champ | Valeur Mise à Jour |
|-------|-------------------|
| `remaining_value` | 0 (était 3000) |
| `status` | `VOUCHER_STATUS_FULLY_USED` |

**Tables Automatiques :**
- `InventoryTransaction` (nouveau mouvement)
- `InventoryLevel` (stock mis à jour)

### ⚠️ Cas Spéciaux

#### Si le bon a plus de valeur que l'achat :
```
Achat: 2500 XAF
Bon: 3000 XAF
→ Reste 500 XAF sur le bon
```
| Champ | Valeur |
|-------|--------|
| `amount_used` | 2500 |
| `remaining_after` | 500 |
| `voucher.remaining_value` | 500 |
| `voucher.status` | `VOUCHER_STATUS_PARTIALLY_USED` |

---

## SCÉNARIO 3️⃣ : Client Entreprise avec Compte

### 🎯 Cas d'Usage
- Client a un compte professionnel
- Paiement différé (crédit 30 jours)
- Facture officielle requise

### 📋 Tables Impliquées

#### **Étape 1 : Vente (Jour J)**

**Table 1 : Invoice** (Facture officielle)
```
Document comptable et légal
```
| Champ | Valeur Exemple |
|-------|----------------|
| `invoice_id` | "INV-2025-002" |
| `invoice_type` | `INVOICE_TYPE_SALES` |
| `issuer_id` | "CMP-SUPERMARKET" |
| `recipient_id` | "CMP-CLIENT-ENT-001" ⚠️ Client identifié |
| `items[]` | `[{product: "PRD-XXX", qty: 100, ...}]` |
| `subtotal` | 416667 |
| `tax_amount` | 83333 (TVA 20%) |
| `total_amount` | 500000 |
| `status` | `INVOICE_STATUS_UNPAID` ⚠️ |
| `issue_date` | 2025-09-29 |
| `due_date` | 2025-10-29 (30 jours) |
| `payment_terms` | "Net 30" |

**Table 2 (Optionnel) : DeliveryNote**
```
Si livraison nécessaire
```
| Champ | Valeur |
|-------|--------|
| `dn_id` | "DN-2025-001" |
| `related_sales_order_id` | `null` (vente directe) |
| `from_warehouse_id` | "WH-SUPERMARKET-01" |
| `to_company_id` | "CMP-CLIENT-ENT-001" |
| `to_address` | Adresse livraison |
| `status` | `DN_STATUS_DELIVERED` |

**Tables Automatiques :**
- `InventoryTransaction` (stock sort immédiatement)
- `InventoryLevel` (diminue même si pas payé)

---

#### **Étape 2 : Paiement (Jour J+15)**

**Table : Payment** (Client règle la facture)
```
Paiement reçu
```
| Champ | Valeur Exemple |
|-------|----------------|
| `payment_id` | "PAY-2025-003" |
| `payer_id` | "CMP-CLIENT-ENT-001" |
| `payee_id` | "CMP-SUPERMARKET" |
| `amount` | 500000 |
| `related_invoice_id` | "INV-2025-002" |
| `payment_method` | `PAYMENT_METHOD_BANK_TRANSFER` |
| `reference_number` | "BANK-REF-12345" |
| `payment_date` | 2025-10-14 |
| `status` | `PAYMENT_STATUS_COMPLETED` |

**Table : Invoice** (Mise à jour)
```
État changé
```
| Champ | Nouvelle Valeur |
|-------|-----------------|
| `status` | `INVOICE_STATUS_PAID` ✅ |

---

## 📊 Comparaison Finale

### Nombre de Tables par Scénario

| Scénario | Tables Principales | Tables Auto | Total Actions DB |
|----------|-------------------|-------------|------------------|
| **Scénario 1** | 1 (CashReceipt) | 2 | 3 writes |
| **Scénario 2** | 4 (Invoice + Payment + GiftVoucher + VoucherTransaction) | 2 | 6 writes |
| **Scénario 3** | 2 (Invoice + Payment) | 2 | 4 writes |

### Temps de Traitement Estimé

| Scénario | Temps Caisse | Impression |
|----------|--------------|------------|
| **Scénario 1** | 30-60 sec | 1 ticket |
| **Scénario 2** | 60-90 sec | 2 documents (facture + bon) |
| **Scénario 3** | 45-75 sec | 1 facture officielle |

---

## 🎯 Recommandations Finales

### Pour un Supermarché Moderne :

1. **Privilégier Scénario 1** (CashReceipt) pour :
   - ✅ Tous les clients anonymes
   - ✅ Paiements comptants
   - ✅ Rapidité en caisse

2. **Utiliser Scénario 2** (Bon d'achat) quand :
   - ⚠️ Manque de monnaie en caisse
   - 💡 Programme de fidélité (bons cadeaux)
   - 🎁 Cartes cadeaux vendues

3. **Réserver Scénario 3** (Invoice) pour :
   - 🏢 Clients entreprises identifiés
   - 📄 Facturation officielle requise
   - 💳 Paiements différés

### Performance Système :
- **Cache** : Garder les GiftVouchers actifs en mémoire
- **Index** : Sur `voucher_code` pour scan rapide
- **Validation** : Vérifier validité voucher en temps réel
- **Audit** : Tous les mouvements tracés dans InventoryTransaction

---

## 💡 Exemple Réel

```
Supermarché "TechMart Yaoundé" - Journée type :

📊 1000 transactions/jour
├─ 950 (95%) → CashReceipt (Scénario 1)
├─ 30 (3%)   → Invoice + GiftVoucher (Scénario 2)
└─ 20 (2%)   → Invoice entreprise (Scénario 3)

🎟️ 30 bons d'achat créés
├─ 25 utilisés dans les 7 jours
├─ 3 utilisés après 1 mois
└─ 2 expirés non utilisés

💰 Paiements :
├─ Cash: 70%
├─ Mobile Money (Orange/MTN): 20%
├─ Carte bancaire: 8%
└─ Bon d'achat: 2%
```
