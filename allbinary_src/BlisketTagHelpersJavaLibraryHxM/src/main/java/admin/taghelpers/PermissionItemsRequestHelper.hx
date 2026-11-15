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
package admin.taghelpers;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.permission.PermissionItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.permissions.PermissionItemsEntityFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class PermissionItemsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private var request : HttpServletRequest;
    private var id : String = null;
    private var enabled : String = null;
    private var number : String = null;
    private var who : String = null;
    private var what : String = null;
    private var type : String = null;
    private var remoteAddr : String = null;
    private var startTime : String = null;
    private var endTime : String = null;
    private var price : String = null;
    private var timeEntered : String = null;
    private var lastModified : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.getFormData();
    }

    public function getFormData() : Void {
        this.id = this.request.getParameter(basicItemData.ID);
        this.number = this.request.getParameter(basicItemData.NUMBER);
        this.enabled = this.request.getParameter(EntryData.getInstance().ENABLE);
        this.who = this.request.getParameter(PermissionItemData.WHO);
        this.what = this.request.getParameter(PermissionItemData.WHAT);
        this.type = this.request.getParameter(PermissionItemData.TYPE);
        this.remoteAddr = this.request.getParameter(PermissionItemData.REMOTE_ADDR);
        this.startTime = this.request.getParameter(PermissionItemData.START_TIME);
        this.endTime = this.request.getParameter(PermissionItemData.END_TIME);
        this.price = this.request.getParameter(basicItemData.PRICE);
        this.timeEntered = this.request.getParameter(EntryData.getInstance().TIMECREATED);
        this.lastModified = this.request.getParameter(EntryData.getInstance().LASTMODIFIED);
    }

    private function getHashMap() : HashMap {
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(basicItemData.ID, this.id);
        values.put(basicItemData.NUMBER, this.number);
        values.put(EntryData.getInstance().ENABLE, this.enabled);
        values.put(PermissionItemData.WHO, this.who);
        values.put(PermissionItemData.WHAT, this.what);
        values.put(PermissionItemData.TYPE, this.type);
        values.put(PermissionItemData.REMOTE_ADDR, this.remoteAddr);
        values.put(PermissionItemData.START_TIME, this.startTime);
        values.put(PermissionItemData.END_TIME, this.endTime);
        values.put(basicItemData.PRICE, this.price);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function insert() : String {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            var values : BasicArrayList = new BasicArrayListD();
            values.add(this.id);
            values.add(this.number);
            values.add(this.enabled);
            values.add(this.who);
            values.add(this.what);
            values.add(this.type);
            values.add(this.remoteAddr);
            values.add(this.startTime);
            values.add(this.endTime);
            values.add(this.price);
            values.add(time);
            values.add(time);
            PermissionItemsEntityFactory.getInstance().getPermissionItemsEntityInstance().insert(values);
            var success : String = "Successfully inserted " + this.id + " into items table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to insert " + this.id + " into items table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "inserts()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            PermissionItemsEntityFactory.getInstance().getPermissionItemsEntityInstance().delete(this.id);
            var success : String = "Successfully deleted";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "delete()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to delete";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            var success : String = "Update Pricing Successful";
            var values : HashMap = this.getHashMap();
            PermissionItemsEntityFactory.getInstance().getPermissionItemsEntityInstance().update(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(Std.string(new StringMaker().append(this.id).append(CommonSeps.getInstance().SPACE).append(success)), this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update: " + this.id;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

}

