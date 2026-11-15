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
import org.allbinary.business.user.commerce.inventory.item.option.XmlOptionItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.options.XmlOptionItemsEntityFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class XmlOptionItemsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private var request : HttpServletRequest;
    private var id : String = null;
    private var xmlFileStatus : String = null;
    private var optionXmlFile : String = null;
    private var timeEntered : String = null;
    private var lastModified : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.getFormData();
    }

    public function getFormData() : Void {
        this.id = this.request.getParameter(basicItemData.ID);
        this.xmlFileStatus = this.request.getParameter(XmlOptionItemData.XML_FILE_STATUS);
        this.optionXmlFile = this.request.getParameter(XmlOptionItemData.OPTION_XML_FILE);
        this.timeEntered = this.request.getParameter(EntryData.getInstance().TIMECREATED);
        this.lastModified = this.request.getParameter(EntryData.getInstance().LASTMODIFIED);
    }

    private function getHashMap() : HashMap {
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(basicItemData.ID, this.id);
        values.put(XmlOptionItemData.XML_FILE_STATUS, this.xmlFileStatus);
        values.put(XmlOptionItemData.OPTION_XML_FILE, this.optionXmlFile);
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
            values.add(this.xmlFileStatus);
            values.add(this.optionXmlFile);
            values.add(time);
            values.add(time);
            XmlOptionItemsEntityFactory.getInstance().getXmlOptionItemsEntityInstance().insert(values);
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
            XmlOptionItemsEntityFactory.getInstance().getXmlOptionItemsEntityInstance().delete(this.id);
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
            var success : String = "Update Successful";
            var values : HashMap = this.getHashMap();
            XmlOptionItemsEntityFactory.getInstance().getXmlOptionItemsEntityInstance().update(values);
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

