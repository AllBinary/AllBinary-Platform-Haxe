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
package org.allbinary.data.tables.user.address;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.data.tables.TableDataFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class StreetAddressesEntity extends AbSqlBean implements StreetAddressesEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var userName : String;
    public function new() {
        super(new UserDbInitInfo());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userName : String) {
        super(new UserDbInitInfo());
        this.userName = userName;
    }

    public function remove(index : Null<Int>) : Void {
        try {
            var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
            whereHashMap.put(UserData.USERNAME, this.userName);
            whereHashMap.put(StreetAddressData.ID, (cast Std.string(index) : String));
            super.deleteWhere(whereHashMap);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "remove");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "remove", e);
            }
        }
    }

    public function add(address : StreetAddress) : Void {
        this.add(address, TableDataFactory.getInstance().INTEGER_MAX_VALUE_STRING);
    }

    private function add(address : StreetAddress, index : String) : Void {
        try {
            var values : BasicArrayList = new BasicArrayListD();
            values.add(index);
            values.add(this.userName);
            values.add(StringUtil.getInstance().EMPTY_STRING);
            values.add(address.getName());
            values.add(address.getStreet());
            values.add(address.getCity());
            values.add(address.getState());
            values.add(address.getCode());
            values.add(address.getCountry());
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            values.add(time);
            super.insert(values);
            this.setDefault(getLastId());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "add");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "add", e);
            }
        }
    }

    public function update(address : StreetAddress) : Void {
        try {
            var addressHashMap : HashMap = address.toHashMap();
            var whereKeyValuePairs : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyValuePairs.put(StreetAddressData.ID, address.getId());
            whereKeyValuePairs.put(UserData.USERNAME, this.userName);
            super.updateWhere(whereKeyValuePairs, addressHashMap);
            this.setDefault(address.getId());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "update");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "add", e);
            }
        }
    }

    public function getLastId() : String {
        return super.getLargestIntegerInColumnWhere(StreetAddressData.ID, UserData.USERNAME, userName);
    }

    public function get() : BasicArrayList {
        try {
            var streetAddressVector : BasicArrayList = new BasicArrayListD();
            var keyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            keyAndValue.put(UserData.USERNAME, this.userName);
            var addressList : BasicArrayList = super.getRows(keyAndValue);
            final size : Int = addressList.size();
            for (index in 0...size) {
                var addressHashMap : HashMap = (cast addressList.get(index) : HashMap);
                var streetAddress : StreetAddress = new StreetAddress(addressHashMap);
                if (streetAddress != null) {
                    streetAddressVector.add(streetAddress);
                }
            }
            return streetAddressVector;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    public function get(index : Null<Int>) : StreetAddress {
        try {
            var keyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            keyAndValue.put(UserData.USERNAME, this.userName);
            keyAndValue.put(StreetAddressData.ID, Std.string(index));
            var addressHashMap : HashMap = super.getRow(keyAndValue);
            if (addressHashMap != null) {
                return new StreetAddress(addressHashMap);
            } else {
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    public function getDefault() : StreetAddress {
        try {
            var addressHashMap : HashMap = StdUtil.getInstance().createHashMap();
            var updateKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            updateKeyAndValue.put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT);
            updateKeyAndValue.put(UserData.USERNAME, this.userName);
            addressHashMap = super.getRow(updateKeyAndValue);
            if (addressHashMap != null) {
                var streetAddress : StreetAddress = new StreetAddress(addressHashMap);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.commonStrings.SUCCESS, this, "getDefault");
                }
                return streetAddress;
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF("No Default Address Found", this, "getDefault");
                }
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "getDefault", e);
            }
            return null;
        }
    }

    public function setDefault(value : String) : Void {
        try {
            var updateKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            var whereKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyAndValue.put(UserData.USERNAME, this.userName);
            var streetAddress : StreetAddress = this.getDefault();
            if (streetAddress != null) {
                updateKeyAndValue.put(StreetAddressData.DEFAULT, StringUtil.getInstance().EMPTY_STRING);
                whereKeyAndValue.put(StreetAddressData.ID, streetAddress.getId());
                super.updateWhere(whereKeyAndValue, updateKeyAndValue);
            }
            whereKeyAndValue.put(StreetAddressData.ID, value);
            updateKeyAndValue.put(StreetAddressData.DEFAULT, StreetAddressData.DEFAULT);
            super.updateWhere(whereKeyAndValue, updateKeyAndValue);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "setDefault");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "setShippingAddress", e);
            }
        }
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(this.getTableName()).append(this.sqlStrings.START).append(StreetAddressData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL).append(UserData.USERNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(StreetAddressData.DEFAULT).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(StreetAddressData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(StreetAddressData.STREET).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(StreetAddressData.CITY).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(StreetAddressData.STATE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(StreetAddressData.CODE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(StreetAddressData.COUNTRY).append(this.sqlTypeStrings.MAX_CHAR_COLUMN).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(StreetAddressData.ID).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function drop() : String {
        return super.dropTable();
    }

    public override function dropTable() : String {
        return super.dropTable();
    }

}

