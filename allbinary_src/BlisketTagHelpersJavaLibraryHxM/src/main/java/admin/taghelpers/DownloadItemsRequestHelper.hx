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
import admin.tags.AbTagData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;
import tags.HelperTag;
import views.admin.inventory.download.DownloadableInventoryItemView;

class DownloadItemsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final downloadableItem : DownloadableItem;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        var inventoryTag : HelperTag = (cast hashMap.get(AbTagData.PARENT) : HelperTag);
        var inventoryItemViewParentTagHelper : InventoryItemViewParentTagHelper = InventoryItemViewParentTagHelper.getInstance();
        var downloadableInventoryItemView : DownloadableInventoryItemView = inventoryItemViewParentTagHelper.getDownloadableInventoryItemView(inventoryTag);
        this.downloadableItem = downloadableInventoryItemView.getDownloadableItem();
    }

    public function insert() : String {
        try {
            var vector : BasicArrayList = this.downloadableItem.toVector();
            DownloadItemsEntityFactory.getInstance().getDownloadItemsEntityInstance().insert(vector);
            var success : String = "Successfully inserted " + this.downloadableItem.getId() + " into downloaditems table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to insert " + this.downloadableItem.getId() + " into downloaditems table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "inserts()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            DownloadItemsEntityFactory.getInstance().getDownloadItemsEntityInstance().delete(this.downloadableItem.getId());
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
            var values : HashMap = this.downloadableItem.toHashMap();
            DownloadItemsEntityFactory.getInstance().getDownloadItemsEntityInstance().update(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(this.downloadableItem.getId() + CommonSeps.getInstance().SPACE + success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update: " + this.downloadableItem.getId();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

}

