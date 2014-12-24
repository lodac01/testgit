package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author khaitong
 */
public class Transaction implements Serializable {

    public static final Map<String, String> transactionDescription = new HashMap<String, String>();

    static {
        transactionDescription.put("OPA", "Open New Account");
        transactionDescription.put("CSD", "Cash Deposit");
        transactionDescription.put("CSW", "Cash Withdraw");
        transactionDescription.put("UAC", "Update Account");
    }

    public enum TransactionCode {

        OPA, CSD, CSW, UAC
    };
    private long transactionId;
    private TransactionCode transactionCode;
    private Date transactionDateTime;
    private double amount;

    public long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(long transactionId) {
        this.transactionId = transactionId;
    }

    public TransactionCode getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(TransactionCode transactionCode) {
        this.transactionCode = transactionCode;
    }

    public Date getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(Date transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTransactionDescription() {
        return transactionDescription.get(transactionCode.name());
    }

    public static List<Transaction> getTransaction(long acid) throws ClassNotFoundException {
        List<Transaction> transactions = new ArrayList<Transaction>();
        try {
            Connection conn = connectDb.con();
            Transaction t = null;
            String sqlCmd = "SELECT * FROM  transactions WHERE account_id = ? order by transaction_id desc";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setLong(1, acid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                t = new Transaction();
                orm(rs, t);
                transactions.add(t);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return transactions;
    }

    private static void orm(ResultSet rs, Transaction t) throws SQLException {
        t.setAmount(rs.getDouble("amount"));
        t.setTransactionDateTime(rs.getDate("transaction_date"));
        t.setTransactionId(rs.getLong("transaction_id"));
        t.setTransactionCode(TransactionCode.valueOf(rs.getString("transaction_code")));
    }

    public boolean writeTransaction(long acid) throws ClassNotFoundException {
        int x = 0;
        try {
            Connection conn = connectDb.con();
            Transaction t = null;
            String sqlCmd = "INSERT INTO transactions (account_id, transaction_code, transaction_date, amount) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setLong(1, acid);
            pstm.setString(2, this.transactionCode.name());
            pstm.setDate(3, new java.sql.Date(this.transactionDateTime.getTime()));
            pstm.setDouble(4, amount);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return x>0;
    }

}
