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
package views.admin.inventory.download;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class EditValidationView extends DownloadableInventoryItemView implements ValidationComponentInterface {
    private var downloadItemId : String = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface, StringUtil.getInstance().EMPTY_STRING);
        this.getFormData();
    }

    // throws Exception
    public function getFormData() : Void {
        var hashMap : HashMap = new RequestParams(request).toHashMap();
        if (hashMap == null) {
            throw new haxe.Exception("No Request Params Found");
        }
        this.id = (cast hashMap.get(basicItemData.ID) : String);
        this.downloadItemId = (cast hashMap.get(DownloadItemData.ID) : String);
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        if (id == null || !StringValidationUtil.getInstance().isNumber(this.id)) {
            return false;
        }
        this.itemInterface = InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.id);
        if (this.itemInterface == null) {
            return false;
        }
        var downloadable : Int = Std.parseInt(this.itemInterface.getDownloads());
        if (downloadable != 0) {
            var downloadItemsEntity : DownloadItemsEntity = DownloadItemsEntityFactory.getInstance().getDownloadItemsEntityInstance();
            var vector : BasicArrayList = downloadItemsEntity.getForItem(this.id, this.downloadItemId);
            if (vector.size() != 1) {
                return false;
            }
            this.downloadableItem = (cast vector.get(0) : DownloadableItem);
        } else {
            return false;
        }
        return true;
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws MoneyException
    public function validationInfo() : String {
        var stringBuffer : StringMaker = new StringMaker();
        if (this.id == null || !StringValidationUtil.getInstance().isNumber(this.id)) {
            stringBuffer.append("Id is not valid.<br />");
        }
        if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.id) == null) {
            stringBuffer.append("Item does not exist.<br />");
        }
        var downloadable : Int = Std.parseInt(this.itemInterface.getDownloads());
        if (downloadable != 0) {
            if (this.downloadableItem == null) {
                stringBuffer.append("DownloadableItem does not exist for item.<br />");
            }
        } else {
            stringBuffer.append("Item should not have DownloadableItem.<br />");
        }
        return stringBuffer.toString();
    }

}

