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
package views.generic.inventory;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;

class InventoryColumnUtil {
    private static final instance : InventoryColumnUtil = new InventoryColumnUtil();
    public static function getInstance() : InventoryColumnUtil {
        return InventoryColumnUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public function getColumnWhereLike(inventoryEntity : InventoryEntity, category : String, column : String) : BasicArrayList {
        this.logUtil.putF("Start Category: " + category, this, "getKeywords");
        var keywords : BasicArrayList = new BasicArrayListD();
        var vectorOfHashMaps : BasicArrayList = inventoryEntity.getAllRows();
        var size : Int = vectorOfHashMaps.size();
        for (index in 0...size) {
            var hashMap : HashMap = (cast vectorOfHashMaps.get(index) : HashMap);
            var categoryName : String = (cast hashMap.get(basicItemData.CATEGORY) : String);
            if (!StringValidationUtil.getInstance().isEmpty(categoryName) && StringTools.startsWith(categoryName, category)) {
                keywords.add(hashMap.get(column));
            }
        }
        return keywords;
    }

    public function new() {
    }
}

