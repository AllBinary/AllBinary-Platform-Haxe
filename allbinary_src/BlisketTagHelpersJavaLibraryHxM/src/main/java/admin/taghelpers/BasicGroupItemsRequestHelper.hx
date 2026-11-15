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
import org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.groups.BasicGroupItemsEntityFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class BasicGroupItemsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private var request : HttpServletRequest;
    private var id : String = null;
    private var itemOne : String = null;
    private var itemTwo : String = null;
    private var itemThree : String = null;
    private var itemFour : String = null;
    private var itemFive : String = null;
    private var itemSix : String = null;
    private var itemSeven : String = null;
    private var itemEight : String = null;
    private var itemNine : String = null;
    private var itemTen : String = null;
    private var timeEntered : String = null;
    private var lastModified : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.getFormData();
    }

    public function getFormData() : Void {
        this.id = this.request.getParameter(basicItemData.ID);
        this.itemOne = this.request.getParameter(BasicGroupItemData.ITEM_ONE);
        this.itemTwo = this.request.getParameter(BasicGroupItemData.ITEM_TWO);
        this.itemThree = this.request.getParameter(BasicGroupItemData.ITEM_THREE);
        this.itemFour = this.request.getParameter(BasicGroupItemData.ITEM_FOUR);
        this.itemFive = this.request.getParameter(BasicGroupItemData.ITEM_FIVE);
        this.itemSix = this.request.getParameter(BasicGroupItemData.ITEM_SIX);
        this.itemSeven = this.request.getParameter(BasicGroupItemData.ITEM_SEVEN);
        this.itemEight = this.request.getParameter(BasicGroupItemData.ITEM_EIGHT);
        this.itemNine = this.request.getParameter(BasicGroupItemData.ITEM_NINE);
        this.itemTen = this.request.getParameter(BasicGroupItemData.ITEM_TEN);
        this.timeEntered = this.request.getParameter(EntryData.getInstance().TIMECREATED);
        this.lastModified = this.request.getParameter(EntryData.getInstance().LASTMODIFIED);
    }

    private function getHashMap() : HashMap {
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(basicItemData.ID, id);
        values.put(BasicGroupItemData.ITEM_ONE, this.itemOne);
        values.put(BasicGroupItemData.ITEM_TWO, this.itemTwo);
        values.put(BasicGroupItemData.ITEM_THREE, this.itemThree);
        values.put(BasicGroupItemData.ITEM_FOUR, this.itemFour);
        values.put(BasicGroupItemData.ITEM_FIVE, this.itemFive);
        values.put(BasicGroupItemData.ITEM_SIX, this.itemSix);
        values.put(BasicGroupItemData.ITEM_SEVEN, this.itemSeven);
        values.put(BasicGroupItemData.ITEM_EIGHT, this.itemEight);
        values.put(BasicGroupItemData.ITEM_NINE, this.itemNine);
        values.put(BasicGroupItemData.ITEM_TEN, this.itemTen);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function insert() : String {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var time : String = calendar.getTimeInMillis().toString();
            var values : BasicArrayList = new BasicArrayListD();
            values.add(this.id);
            values.add(this.itemOne);
            values.add(this.itemTwo);
            values.add(this.itemThree);
            values.add(this.itemFour);
            values.add(this.itemFive);
            values.add(this.itemSix);
            values.add(this.itemSeven);
            values.add(this.itemEight);
            values.add(this.itemNine);
            values.add(this.itemTen);
            values.add(time);
            values.add(time);
            BasicGroupItemsEntityFactory.getInstance().getBasicGroupItemsEntityInstance().insert(values);
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
            BasicGroupItemsEntityFactory.getInstance().getBasicGroupItemsEntityInstance().delete(this.id);
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
            BasicGroupItemsEntityFactory.getInstance().getBasicGroupItemsEntityInstance().update(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(new StringMaker().append(this.id).append(CommonSeps.getInstance().SPACE).append(success).toString(), this, "update()");
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

