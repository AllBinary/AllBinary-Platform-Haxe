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

import org.allbinary.business.user.commerce.inventory.item.BasicItem;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class NewValidationView extends DownloadableInventoryItemView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface, StringUtil.getInstance().EMPTY_STRING);
        this.itemInterface = (cast new BasicItem() : ItemInterface);
        this.downloadableItem = new DownloadableItem(this.itemInterface.getId());
    }

    public function isValid() : Null<Bool> {
        try {
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
        return "Error Creating New Downloadable Item";
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

