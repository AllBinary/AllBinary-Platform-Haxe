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
package org.allbinary.data.tables.user;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.user.CreateUserFactory;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.modules.User;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.business.user.role.UserRoleFactory;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class UserEntity extends AbSqlBean implements UserEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "user";
    private final COMMAND_SUCCESS_FOR_USER : String = "Command Success for user: ";
    private final PASSWORD_LABEL : String = " Password: ";
    private final EQUALS : String = "==";
    private final COMMAND_SUCCESS_BUT_LOGIN_FAILED : String = "Command Success but login failed for user: ";
    private final INVALID_PASSWORD_LABEL : String = " Password: \n\"";
    private final NOT_EQUAL : String = "\"!=\"";
    private final END_QUOTES : String = CommonSeps.getInstance().QUOTE;
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function insert(values : BasicArrayList) : Void {
        try {
            super.insert(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, INSERT, e);
            }
        }
    }

    // throws Exception
    public function getAdministrators() : BasicArrayList {
        return this.getUsersWithRole(UserRoleFactory.getInstance().ADMINISTRATOR);
    }

    // throws Exception
    public function getStoreManagers(storeFrontInterface : StoreFrontInterface) : BasicArrayList {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        var usersVector : BasicArrayList = new BasicArrayListD();
        keysAndValues.put(Std.string(UserRoleData.NAME), Std.string(UserRoleFactory.getInstance().STOREMANAGER));
        keysAndValues.put(UserData.PERMISSIONS, storeFrontInterface.getName());
        var usersHashMapVector : BasicArrayList = super.getRows(keysAndValues);
        var size : Int = usersHashMapVector.size();
        for (i in 0...size) {
            var userHashMap : HashMap = (cast usersHashMapVector.get(i) : HashMap);
            if (userHashMap != null) {
                usersVector.add(new User(userHashMap));
            }
        }
        return usersVector;
    }

    // throws Exception
    public function getCustomers() : BasicArrayList {
        return this.getUsersWithRole(UserRoleFactory.getInstance().CUSTOMER);
    }

    // throws Exception
    public function getUsersWithRole(userRole : UserRole) : BasicArrayList {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        var usersVector : BasicArrayList = new BasicArrayListD();
        keysAndValues.put(Std.string(UserRoleData.NAME), Std.string(userRole));
        var usersHashMapVector : BasicArrayList = super.getRows(keysAndValues);
        final size : Int = usersHashMapVector.size();
        for (index in 0...size) {
            var userHashMap : HashMap = (cast usersHashMapVector.get(index) : HashMap);
            if (userHashMap != null) {
                usersVector.add(new User(userHashMap));
            }
        }
        return usersVector;
    }

    // throws Exception
    public function getUsers(storeFrontInterface : StoreFrontInterface) : BasicArrayList {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        var usersVector : BasicArrayList = new BasicArrayListD();
        keysAndValues.put(StoreFrontData.getInstance().NAME, storeFrontInterface.getName());
        var usersHashMapVector : BasicArrayList = super.getRows(keysAndValues);
        final size : Int = usersHashMapVector.size();
        for (index in 0...size) {
            var userHashMap : HashMap = (cast usersHashMapVector.get(index) : HashMap);
            if (userHashMap != null) {
                usersVector.add(new User(userHashMap));
            }
        }
        return usersVector;
    }

    // throws Exception
    public function getUser(userName : String) : UserInterface {
        var row : HashMap = StdUtil.getInstance().createHashMap();
        row.put(UserData.USERNAME, userName);
        var userHashMap : HashMap = super.getRow(row);
        if (userHashMap != null) {
            return CreateUserFactory.getInstance(userHashMap);
        } else {
            return null;
        }
    }

    public function deleteWhere(key : String, value : String) : Void {
        try {
            super.deleteWhere(key, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "deleteWhere");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "deleteWhere", e);
            }
        }
    }

    public function login(userName : String, password : String) : String {
        try {
            var isUserNameAndPasswordCorrect : Int = 0;
            var result : String = super.getField(UserData.USERNAME, userName, UserData.PASSWORD);
            var encryption : String = super.getField(UserData.USERNAME, userName, EntryData.getInstance().ENCRYPTION);
            if (encryption != null && Reflect.compare(encryption, this.stringUtil.EMPTY_STRING) != 0) {
                isUserNameAndPasswordCorrect = Reflect.compare(result, new SuperCrypt(Std.int(encryption)).encrypt(password));
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF("Command Success but login failed for user: " + userName + " because user did not exist", this, "login");
                }
                return GLOBALS2.LOGINFAILED;
            }
            if (isUserNameAndPasswordCorrect == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(this.COMMAND_SUCCESS_FOR_USER);
                    stringBuffer.append(userName);
                    stringBuffer.append(this.PASSWORD_LABEL);
                    stringBuffer.append(password);
                    stringBuffer.append(this.EQUALS);
                    stringBuffer.append(result);
                    this.logUtil.putF(Std.string(stringBuffer), this, "login");
                }
                return GLOBALS2.LOGINSUCCESS;
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(this.COMMAND_SUCCESS_BUT_LOGIN_FAILED);
                    stringBuffer.append(userName);
                    stringBuffer.append(this.INVALID_PASSWORD_LABEL);
                    stringBuffer.append(new SuperCrypt(Std.int(encryption)).encrypt(password));
                    stringBuffer.append(this.NOT_EQUAL);
                    stringBuffer.append(result);
                    stringBuffer.append(this.END_QUOTES);
                    this.logUtil.putF(Std.string(stringBuffer), this, "login");
                }
                return GLOBALS2.LOGINFAILED;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "login", e);
            }
            return "Error";
        }
    }

    public function update(userName : String, updatedValues : HashMap) : Void {
        super.updateWhere(UserData.USERNAME, userName, updatedValues);
    }

    public function dropTables() : String {
        return super.dropTable();
    }

    public function createTableStatement() : String {
        final entryData : EntryData = EntryData.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(UserData.USERNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(UserData.PREFIXNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.FIRSTNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.LASTNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.MIDDLENAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.SUFFIXNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.COMPANY).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.POSITIONATCOMPANY).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.MAINEMAIL).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(UserData.SECONDARYEMAIL).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.HOMEPHONE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.CELLPHONE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.WORKPHONE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.OTHERCONTACT).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.ELECTRONICDEVICE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.FAX).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(Std.string(UserRoleData.NAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(UserData.CONFIGURATION).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(UserData.PERMISSIONS).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(entryData.ENCRYPTION).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(UserData.SECRET).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(UserData.PASSWORD).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(entryData.ENABLE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(entryData.TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(entryData.LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(UserData.USERNAME).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public override function dropTable() : String {
        return super.dropTable();
    }

}

