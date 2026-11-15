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
import org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.options.BasicOptionItemsEntityFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class BasicOptionItemsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private var request : HttpServletRequest;
    private var id : String = null;
    private var optionOneTitle : String = null;
    private var defaultOptionItem : String = null;
    private var defaultOptionValue : String = null;
    private var optionItem : BasicArrayList = null;
    private var optionValue : BasicArrayList = null;
    private var timeEntered : String = null;
    private var lastModified : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.getFormData();
    }

    public function getFormData() : Void {
        this.optionItem = new BasicArrayListD();
        this.optionValue = new BasicArrayListD();
        this.id = this.request.getParameter(basicItemData.ID);
        this.optionOneTitle = this.request.getParameter(BasicOptionItemData.OPTION_ONE_TITLE);
        this.defaultOptionItem = this.request.getParameter(BasicOptionItemData.DEFAULT_OPTION_ITEM);
        this.defaultOptionValue = this.request.getParameter(BasicOptionItemData.DEFAULT_OPTION_VALUE);
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_ONE_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_ONE_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_TWO_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_TWO_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_THREE_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_THREE_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_FOUR_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_FOUR_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_FIVE_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_FIVE_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_SIX_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_SIX_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE));
        this.optionItem.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_NINE_ITEM));
        this.optionValue.add(this.request.getParameter(BasicOptionItemData.OPTION_ONE_NINE_VALUE));
        this.timeEntered = this.request.getParameter(EntryData.getInstance().TIMECREATED);
        this.lastModified = this.request.getParameter(EntryData.getInstance().LASTMODIFIED);
    }

    private function getHashMap() : HashMap {
        final values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(basicItemData.ID, id);
        values.put(BasicOptionItemData.OPTION_ONE_ONE_ITEM, this.optionItem.get(0));
        values.put(BasicOptionItemData.OPTION_ONE_ONE_VALUE, this.optionValue.get(0));
        values.put(BasicOptionItemData.OPTION_ONE_TWO_ITEM, this.optionItem.get(1));
        values.put(BasicOptionItemData.OPTION_ONE_TWO_VALUE, this.optionValue.get(1));
        values.put(BasicOptionItemData.OPTION_ONE_THREE_ITEM, this.optionItem.get(2));
        values.put(BasicOptionItemData.OPTION_ONE_THREE_VALUE, this.optionValue.get(2));
        values.put(BasicOptionItemData.OPTION_ONE_FOUR_ITEM, this.optionItem.get(3));
        values.put(BasicOptionItemData.OPTION_ONE_FOUR_VALUE, this.optionValue.get(3));
        values.put(BasicOptionItemData.OPTION_ONE_FIVE_ITEM, this.optionItem.get(4));
        values.put(BasicOptionItemData.OPTION_ONE_FIVE_VALUE, this.optionValue.get(4));
        values.put(BasicOptionItemData.OPTION_ONE_SIX_ITEM, this.optionItem.get(5));
        values.put(BasicOptionItemData.OPTION_ONE_SIX_VALUE, this.optionValue.get(5));
        values.put(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM, this.optionItem.get(6));
        values.put(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE, this.optionValue.get(6));
        values.put(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM, this.optionItem.get(7));
        values.put(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE, this.optionValue.get(7));
        values.put(BasicOptionItemData.OPTION_ONE_NINE_ITEM, this.optionItem.get(8));
        values.put(BasicOptionItemData.OPTION_ONE_NINE_VALUE, this.optionValue.get(8));
        final calendar : Calendar = Calendar.getInstance();
        final time : String = Std.string(calendar.getTimeInMillis());
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function insert() : String {
        try {
            final calendar : Calendar = Calendar.getInstance();
            final time : String = Std.string(calendar.getTimeInMillis());
            final values : BasicArrayList = new BasicArrayListD();
            values.add(this.id);
            final size : Int = this.optionValue.size();
            for (index in 0...size) {
                values.add(this.optionValue.get(index));
                values.add(this.optionItem.get(index));
            }
            values.add(time);
            values.add(time);
            BasicOptionItemsEntityFactory.getInstance().getBasicOptionItemsEntityInstance().insert(values);
            final success : String = "Successfully inserted " + this.id + " into items table";
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
            BasicOptionItemsEntityFactory.getInstance().getBasicOptionItemsEntityInstance().delete(this.id);
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
            BasicOptionItemsEntityFactory.getInstance().getBasicOptionItemsEntityInstance().update(values);
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

