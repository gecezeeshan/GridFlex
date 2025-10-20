# ASP.NET WebForms — Insert Row in Nested GridView **without full page postback**

This sample reproduces the ASPSnippets scenario: a **parent GridView (Customers)** with a **nested child GridView (Orders)**.
You can insert a new **Order** from the **child GridView footer** using an **async postback** (UpdatePanel) — no full page refresh.

> Keyword to include in your bid: **asp.netexperthere**

---

## ✅ What’s included
- **Default.aspx / Default.aspx.cs** — WebForms page with parent + nested GridViews.
- **Per-row UpdatePanel** around each child GridView for **partial (AJAX) postback** on insert.
- **SQL** script to create DB, tables, and seed data.
- **Web.config** with a single connection string `DefaultConnection`.
- **App_Code/Db.cs** — tiny ADO.NET helper.

---

## 🧩 Database Setup (SQL Server)
1. Open SQL Server Management Studio.
2. Run: `SQL/create_db.sql`
3. Confirm the database **AspGridDemo** is created with tables **Customers** and **Orders**.

If you prefer a different DB name or instance, just update the connection string in `Web.config`.

---

## ▶️ Run locally (IIS Express / Visual Studio)
1. Open **Visual Studio** (Windows, .NET Framework, WebForms workload).
2. `File → Open → Web Site...` and select this folder.
3. Ensure **Default.aspx** is the start page (right-click → Set as Start Page).
4. Update `Web.config` → `DefaultConnection` for your SQL Server instance if needed.
5. Press **F5**.  
   - Expand a **customer row** to see the nested **Orders** GridView.
   - Use the **footer row** to add a new order and click **Add** — it inserts and rebinds **without full page refresh**.

---

## 🔧 Notes
- This uses **UpdatePanel** for an **async postback** at the row level. The entire page does **not** post back; only the panel does.
- Target framework: any **.NET Framework 4.x** that your Visual Studio supports.
- Pure **ADO.NET** for clarity — no EF dependency.
- If you need a **pure jQuery AJAX WebMethod** version, I can provide that too.

---

## 📦 Ready for GitHub
You can commit this folder as-is to a new GitHub repo:
```bash
git init
git add .
git commit -m "ASP.NET WebForms nested GridView insert with async postback"
```

---

## 📄 Bid Snippet
**asp.netexperthere** — I reproduced the ASPSnippets example 1:1 with a sample SQL DB.  
GridView → SQL Server binding, nested child grid, and insert from footer **without full page refresh**.  
I can deliver in **hours** and I’m okay with your **budget (< 11 CAD)** for a 5★ review.
"# GridFlex" 
