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
package views.admin.inventory;

//import java.util.HashMap;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DeleteFileValidationView extends InventoryItemView implements ValidationComponentInterface {
    private var id : String = null;
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
    }

    public function isValid() : Null<Bool> {
        try {
            if (this.id == null || !StringValidationUtil.getInstance().isNumber(this.id)) {
                return false;
            }
            this.itemInterface = InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.id);
            if (this.itemInterface == null) {
                return false;
            }
            return true;
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.id == null || !StringValidationUtil.getInstance().isNumber(this.id)) {
                stringBuffer.append("Id is not valid.<br />");
            }
            if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.id) == null) {
                stringBuffer.append("Item does not exist.<br />");
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            return "Unkown Validation Error.<br />";
        }
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

