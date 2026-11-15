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

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.installer.Portion;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.select.HtmlSelect;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;

class StoreFrontsHelper extends BasicTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.portion = new Portion(hashMap);
    }

    public function drop() : String {
        try {
            var success : String = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().dropTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, this.commonStrings.DROP);
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop storefronts table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    public function create() : String {
        try {
            var success : String = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().createTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "create()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create new storefronts table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    public function restore() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().restoreTable(StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance(), this.portion);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "restore()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to restore backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "restore()", e);
            }
            return error;
        }
    }

    public function backup() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().backupTable(StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "backup()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to make backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "backup()", e);
            }
            return error;
        }
    }

    private final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
    private static final CLASS : String = "class";
    private static final TEXT : String = "text";
    public function generateSelect() : String {
        try {
            var success : String = CommonSeps.getInstance().SPACE;
            var storeNamesVector : BasicArrayList = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().getStoreFrontNames();
            var storeSelect : HtmlSelect = new HtmlSelect(StringUtil.getInstance().EMPTY_STRING, this.commonPhoneStrings.ONE, StoreFrontData.getInstance().SELECTSTORENAME, StringUtil.getInstance().EMPTY_STRING);
            storeSelect.addAttribute(StoreFrontsHelper.CLASS, StoreFrontsHelper.TEXT);
            final size : Int = storeNamesVector.size();
            for (index in 0...size) {
                var storeName : String = (cast storeNamesVector.get(index) : String);
                storeSelect.addOption(storeName);
            }
            success += storeSelect;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "generateSelect()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to generate storefronts select";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "generateSelect()", e);
            }
            return error;
        }
    }

}

