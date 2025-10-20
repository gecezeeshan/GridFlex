using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected global::System.Web.UI.WebControls.GridView gvCustomers;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCustomers();
        }
    }

    private void BindCustomers()
    {
        var sql = "SELECT Id, Name FROM Customers ORDER BY Id";
        gvCustomers.DataSource = Db.Query(sql);
        gvCustomers.DataBind();
    }

    protected void gvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var drv = (DataRowView)e.Row.DataItem;
            int customerId = Convert.ToInt32(drv["Id"]);

            var gvOrders = (GridView)e.Row.FindControl("gvOrders");
            BindOrdersGrid(gvOrders, customerId);
        }
    }

    private void BindOrdersGrid(GridView gvOrders, int customerId)
    {
        var sql = "SELECT Id, Product, Quantity FROM Orders WHERE CustomerId=@cid ORDER BY Id";
        var dt = Db.Query(sql, new SqlParameter("@cid", customerId));
        gvOrders.DataSource = dt;
        gvOrders.DataBind();
    }

    protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddOrder")
        {
            // Get the row naming container (the child grid) and its parent controls
            var gvOrders = (GridView)sender;
            var container = (Control)gvOrders.NamingContainer;
            var hf = (HiddenField)container.FindControl("hfCustomerId");
            int customerId = int.Parse(hf.Value);

            // Footer controls
            var footer = gvOrders.FooterRow;
            var txtProduct = (TextBox)footer.FindControl("txtProduct");
            var txtQuantity = (TextBox)footer.FindControl("txtQuantity");

            if (string.IsNullOrWhiteSpace(txtProduct.Text)) return;
            if (!int.TryParse(txtQuantity.Text, out int qty) || qty <= 0) qty = 1;

            // Insert
            string insert = "INSERT INTO Orders(CustomerId, Product, Quantity) VALUES (@cid, @p, @q)";
            Db.Execute(insert,
                new SqlParameter("@cid", customerId),
                new SqlParameter("@p", txtProduct.Text.Trim()),
                new SqlParameter("@q", qty));

            // Rebind just this child grid (inside the UpdatePanel)
            BindOrdersGrid(gvOrders, customerId);
        }
    }
}
