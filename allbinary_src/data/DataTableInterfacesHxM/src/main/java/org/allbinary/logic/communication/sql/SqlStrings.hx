// Generated Code Do Not Modify
package org.allbinary.logic.communication.sql;

import org.allbinary.string.CommonSeps;

class SqlStrings {
    private static final instance : SqlStrings = new SqlStrings();
    public static function getInstance() : SqlStrings {
        return SqlStrings.instance;
    }

    public final CREATE_DATABASE : String = "CREATE DATABASE ";
    public final DROP_TABLE : String = "DROP TABLE ";
    public final CREATE_TABLE : String = "CREATE TABLE ";
    public final START : String = " (";
    public final SELECT : String = "SELECT ";
    public final FROM : String = " FROM ";
    public final SELECT_ALL : String = "SELECT *";
    public final WHERE : String = " WHERE ";
    public final AND : String = " AND ";
    public final UPDATE : String = "UPDATE ";
    public final SET : String = " SET ";
    public final SELECT_ALL_FROM : String;
    public final DELETE : String = "DELETE";
    public final LIKE_QUOTE : String = " LIKE \"";
    public final INSERT_INTO : String = "INSERT INTO ";
    public final VALUES : String = " VALUES ('";
    public final ORDER_BY : String = "ORDER BY";
    public final COUNT : String = "COUNT(";
    public final ASC : String = "ASC";
    public final DESC : String = "DESC";
    public final PRIMARY_KEY : String = "PRIMARY KEY(";
    public final END : String = ") )";
    public final EQUAL_QUOTE : String = " = \"";
    public final CLOSE_QUOTE : String = CommonSeps.getInstance().QUOTE;
    public final EQUAL_QUOTE_NO_SPACE : String = "=\"";
    public final ESCAPE : String = "\\";
    public final DOUBLE_ESCAPE : String = "\\\\";
    public final MORE_THAN_QUOTE : String = " > \"";
    public final LESS_THAN_QUOTE : String = " < \"";
    public final SINGLE_QUOTE_COMMA_SEP : String = "','";
    public final ID : String = "ID";
    public final SQL_STATEMENT_LABEL : String = "SQL Statement: ";
    public final COLUMN_VALUE : String = "\nColumn Value: ";
    public final CREATE_RETURN : String = " Created Successfully";
    public final FIELD_VALUE : String = "\nField Value: ";
    public function new() {
        this.SELECT_ALL_FROM = this.SELECT_ALL + this.FROM;
    }
}

