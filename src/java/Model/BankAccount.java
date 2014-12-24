/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Exception.bankException;
import Model.Transaction;
import Model.connectDb;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author INT105
 */
public class BankAccount implements Serializable {

    private long accountId;
    private String accountName;
    private double balance;
    private List<Transaction> transactions = null;
    public String password;

    public BankAccount() {
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }

    public List<Transaction> getAllTransactions() throws ClassNotFoundException {
        return Transaction.getTransaction(accountId);

    }

    public void setTransactions(List<Transaction> transactions) {
        this.transactions = transactions;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public double getBalance() {
        return balance;
    }

    private void setBalance(double amount) {
        this.balance = amount;
    }

    public void deposit(double amount) throws bankException {
        if (amount > 0) {
            setBalance(this.balance + amount);
            Transaction t = new Transaction();
            t.setAmount(amount);
            t.setTransactionCode(Transaction.TransactionCode.CSD);
            t.setTransactionDateTime(new Date(System.currentTimeMillis()));
            addTransaction(t);
        } else {
            throw new bankException("Deposit zero/negative amount");
        }
    }

    public void withdraw(double amount) throws bankException {
        if (this.balance - amount < 0) {
            throw new bankException("Not enough balance (balance=" + balance
                    + "), amount=" + amount + ")");
        } else if (amount > 0) {
            setBalance(this.balance - amount);
            Transaction t = new Transaction();
            t.setAmount(amount);
            t.setTransactionCode(Transaction.TransactionCode.CSW);
            t.setTransactionDateTime(new Date(System.currentTimeMillis()));
            addTransaction(t);
        } else {
            throw new bankException("Withdraw zero/negative amount");
        }
    }

    public BankAccount findById() throws ClassNotFoundException {
        return findById(this.accountId);
    }

    public static BankAccount findById(long id) throws ClassNotFoundException {
        BankAccount ba = null;
        try {
            Connection conn = connectDb.con();
            String sqlCmd = "SELECT * FROM  app.BankAccount WHERE ACCOUNT_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setLong(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                ba = new BankAccount();
                orm(rs, ba);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return ba;
    }

    public static List<BankAccount> findByName(String name) throws ClassNotFoundException {
        BankAccount ba = null;
        List<BankAccount> accounts = new ArrayList<BankAccount>();
        try {
            Connection conn = connectDb.con();
            String sqlCmd = "SELECT * FROM  bankaccount WHERE account_name like ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, name + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ba = new BankAccount();
                orm(rs, ba);
                accounts.add(ba);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return accounts;
    }

    private static void orm(ResultSet rs, BankAccount ba) throws SQLException, ClassNotFoundException {
        ba.setAccountId(rs.getLong("account_id"));
        ba.setAccountName(rs.getString("account_name"));
        ba.setBalance(rs.getDouble("balance"));
        ba.setPassword(rs.getString("password"));
        ba.setTransactions(Transaction.getTransaction(ba.getAccountId()));
    }

    public void update() throws SQLException, ClassNotFoundException {
        update(false);
    }

    public void update(boolean isNew) throws SQLException, ClassNotFoundException {
        Connection conn = connectDb.con();

        String sqlCmd = null;

        if (isNew) {
            sqlCmd = "INSERT INTO bankaccount (account_name, balance, account_id,password) VALUES (?, ?, ?,?)";
            Transaction t = new Transaction();
            t.setAmount(0);
            t.setTransactionCode(Transaction.TransactionCode.OPA);
            t.setTransactionDateTime(new Date(System.currentTimeMillis()));
            addTransaction(0, t);
        } else {
            sqlCmd = "UPDATE bankaccount SET account_name=?, balance=? WHERE account_id =?  and password = ?";
        }
        PreparedStatement pstm = conn.prepareStatement(sqlCmd);
        pstm.setString(1, this.accountName);
        pstm.setDouble(2, this.balance);
        pstm.setLong(3, this.accountId);
        pstm.setString(4, this.password);
        

        int row = pstm.executeUpdate();
        conn.close();
        if (getTransactions() != null) {
            for (Transaction t : getTransactions()) {
                if (t.getTransactionId() == 0) {
                    t.writeTransaction(accountId);
                }
            }
            transactions.clear();
        }

    }

    private void addTransaction(Transaction t) {
        if (transactions == null) {
            transactions = new ArrayList<Transaction>();
        }
        transactions.add(t);
    }

    private void addTransaction(int x, Transaction t) {
        if (transactions == null) {
            transactions = new ArrayList<Transaction>();
        }
        transactions.add(x, t);
    }

    public static long genId() throws SQLException, ClassNotFoundException {
        BankAccount bkk = new BankAccount();
        Connection conn = connectDb.con();
        String sql = "SELECT  MAX(account_id) From  bankaccount";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        bkk.setAccountId(rs.getLong(1));
        return bkk.getAccountId();
    }

    public void newPass() {
        try {
            Connection conn = connectDb.con();
            String sqlCmd = "UPDATE bankaccount SET  password = ? WHERE account_id =?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.password);
            pstm.setLong(2, this.accountId);
            pstm.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BankAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BankAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
