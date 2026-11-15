/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.communication.sql.connection.pool;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class SqlConnectionPool {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : SqlConnectionPool = new SqlConnectionPool();
    public static function getInstance() : SqlConnectionPool {
        return SqlConnectionPool.instance;
    }

    public final stdUtil : StdUtil = StdUtil.getInstance();
    private var connectionHashMap : HashMap = null;
    private final FIRST_NEW_CONNECTION_CREATED : String = "First New Connection Created: ";
    private final FIRST : String = "First ";
    private final NEW_CONNECTION_FOR : String = "New Connection For ";
    private final CREATED : String = " Created";
    private final NUMBER_OF_SQL_CONNECTIONS_FOR : String = "Number Of Sql Connections for: ";
    private final NUMBER_OF_SQL_CONNECTION_VECTORS : String = "Number Of Sql Connection Vectors: ";
    private final IS : String = " is ";
    private final CONNECTION_ALLREADY_CLOSED : String = "Connection AllReady Closed";
    private final METHOD_GET : String = "get()";
    private final METHOD_ADD : String = "add()";
    public function new() {
    }

    // throws SQLException
    // synchronized
    public function get(url : String) : Connection {
        if (this.connectionHashMap == null) {
            this.connectionHashMap = this.stdUtil.createHashMap();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
                this.logUtil.putF(this.FIRST_NEW_CONNECTION_CREATED + url, this, METHOD_GET);
            }
            return DriverManager.getConnection(url);
        } else {
            var connectionVector : BasicArrayList = (cast this.connectionHashMap.get(url) : BasicArrayList);
            if (connectionVector == null) {
                connectionVector = new BasicArrayListD();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(this.FIRST);
                    stringBuffer.append(this.NEW_CONNECTION_FOR);
                    stringBuffer.append(url);
                    stringBuffer.append(this.CREATED);
                    this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET);
                }
                return DriverManager.getConnection(url);
            } else if (connectionVector.size() == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
                    this.logUtil.putF(new StringMaker().append(this.NEW_CONNECTION_FOR).append(url).append(this.CREATED).toString(), this, METHOD_GET);
                }
                return DriverManager.getConnection(url);
            } else {
                var stringBuffer : StringMaker = new StringMaker();
                var size : Int = connectionVector.size();
                for (i in 0...size) {
                    var sqlConnection : Connection = (cast connectionVector.get(i) : Connection);
                    if (!sqlConnection.isClosed()) {
                        connectionVector.remove(sqlConnection);
                        this.connectionHashMap.put(url, connectionVector);
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
                            stringBuffer.delete(0, stringBuffer.length());
                            stringBuffer.append(this.NUMBER_OF_SQL_CONNECTIONS_FOR);
                            stringBuffer.append(url);
                            stringBuffer.append(this.IS);
                            stringBuffer.appendint(connectionVector.size());
                            this.logUtil.putF(NUMBER_OF_SQL_CONNECTION_VECTORS + this.connectionHashMap.size(), this, this.METHOD_GET);
                            this.logUtil.putF(stringBuffer.toString(), this, METHOD_GET);
                        }
                        return (cast sqlConnection : Connection);
                    }
                }
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.NEW_CONNECTION_FOR);
            stringBuffer.append(url);
            stringBuffer.append(this.CREATED);
            this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET);
        }
        return DriverManager.getConnection(url);
    }

    // throws SQLException
    // synchronized
    public function add(url : String, sqlConnection : Connection) : Void {
        if (!sqlConnection.isClosed()) {
            var connectionVector : BasicArrayList = null;
            if (this.connectionHashMap == null) {
                this.connectionHashMap = this.stdUtil.createHashMap();
                connectionVector = new BasicArrayListD();
                connectionVector.add(sqlConnection);
            } else {
                connectionVector = (cast this.connectionHashMap.get(url) : BasicArrayList);
                if (connectionVector == null) {
                    connectionVector = new BasicArrayListD();
                }
                connectionVector.add(sqlConnection);
                this.connectionHashMap.put(url, connectionVector);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append(this.NUMBER_OF_SQL_CONNECTIONS_FOR);
                stringBuffer.append(url);
                stringBuffer.append(this.IS);
                stringBuffer.appendint(connectionVector.size());
                this.logUtil.putF(this.NUMBER_OF_SQL_CONNECTION_VECTORS + this.connectionHashMap.size(), this, this.METHOD_ADD);
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_ADD);
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL)) {
            this.logUtil.putF(this.CONNECTION_ALLREADY_CLOSED, this, METHOD_ADD);
        }
    }

}

