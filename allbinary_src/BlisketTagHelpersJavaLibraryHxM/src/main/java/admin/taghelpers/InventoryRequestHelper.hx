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
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import tags.HelperTag;
import views.admin.inventory.InventoryItemView;

class InventoryRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final itemInterface : ItemInterface;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        var inventoryTag : HelperTag = (cast propertiesHashMap.get(AbTagData.PARENT) : HelperTag);
        var itemView : InventoryItemView = InventoryItemViewParentTagHelper.getInstance().getInventoryItemView(inventoryTag);
        this.itemInterface = itemView.getItemInterface();
    }

    // throws Exception
    public function insert() : String {
        try {
            var dataMappingInterface : TableMappingInterface = (cast this.getItemInterface() : TableMappingInterface);
            var values : BasicArrayList = dataMappingInterface.toVector();
            InventoryEntityFactory.getInstance().getInventoryEntityInstance().insert(values);
            var success : String = "Successfully Added Product";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add item to Inventory";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            var dataMappingInterface : TableMappingInterface = (cast this.getItemInterface() : TableMappingInterface);
            var id : String = (cast dataMappingInterface.getKey() : String);
            InventoryEntityFactory.getInstance().getInventoryEntityInstance().deleteWhere(basicItemData.ID, id);
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Successfully Removed the item with ");
            stringBuffer.append(basicItemData.ID);
            stringBuffer.append("=");
            stringBuffer.append(id);
            stringBuffer.append(" from to the Inventory table");
            var success : String = Std.string(stringBuffer);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, tagStrings.DO_START_TAG);
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to remove item with from Inventory";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, tagStrings.DO_START_TAG, e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            this.delete();
            this.insert();
            var success : String = "Item Successfully Updated";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Update Item";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

    public function getItemInterface() : ItemInterface {
        return this.itemInterface;
    }

}

