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

import org.allbinary.logic.communication.http.request.RequestMapInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.TransformInterface;
import taghelpers.ValidationViewHelper;
import tags.HelperTag;
import views.admin.inventory.InventoryItemView;
import views.admin.inventory.download.DownloadableInventoryItemView;

class InventoryItemViewParentTagHelper {
    private static final instance : InventoryItemViewParentTagHelper = new InventoryItemViewParentTagHelper();
    public static function getInstance() : InventoryItemViewParentTagHelper {
        return InventoryItemViewParentTagHelper.instance;
    }

    // throws Exception
    public function getInventoryItemView(inventoryTag : HelperTag) : InventoryItemView {
        if (inventoryTag != null) {
            this.checkForValidationViewHelper(inventoryTag.getHelper());
            var validationViewHelper : ValidationViewHelper = (cast inventoryTag.getHelper() : ValidationViewHelper);
            var viewObject : TransformInterface = validationViewHelper.getViewObject();
            if (viewObject.getTypeId() != InventoryItemView.TYPE_ID) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Must have ");
                stringBuffer.append("InventoryItemView and not: ");
                stringBuffer.append(Type.getClassName(Type.getClass(inventoryTag.getHelper())));
                throw new haxe.Exception(Std.string(stringBuffer));
            }
            return (cast viewObject : InventoryItemView);
        } else {
            throw new haxe.Exception("Must have parent tag.");
        }
    }

    // throws Exception
    public function getDownloadableInventoryItemView(inventoryTag : HelperTag) : DownloadableInventoryItemView {
        if (inventoryTag != null) {
            this.checkForValidationViewHelper(inventoryTag.getHelper());
            var validationViewHelper : ValidationViewHelper = (cast inventoryTag.getHelper() : ValidationViewHelper);
            var viewObject : TransformInterface = validationViewHelper.getViewObject();
            if (viewObject.getTypeId() != DownloadableInventoryItemView.TYPE_ID) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Must have ");
                stringBuffer.append("DownloadableInventoryItemView and not: ");
                stringBuffer.append(Type.getClassName(Type.getClass(inventoryTag.getHelper())));
                throw new haxe.Exception(Std.string(stringBuffer));
            }
            return (cast viewObject : DownloadableInventoryItemView);
        } else {
            throw new haxe.Exception("Must have parent tag.");
        }
    }

    // throws Exception
    public function getRequestMapInterface(inventoryTag : HelperTag) : RequestMapInterface {
        if (inventoryTag != null) {
            this.checkForValidationViewHelper(inventoryTag.getHelper());
            var validationViewHelper : ValidationViewHelper = (cast inventoryTag.getHelper() : ValidationViewHelper);
            var viewObject : TransformInterface = validationViewHelper.getViewObject();
            if (viewObject.getTypeId() != InventoryItemView.TYPE_ID && viewObject.getTypeId() != DownloadableInventoryItemView.TYPE_ID) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Must have ");
                stringBuffer.append("specific TYPE_ID and not: ");
                stringBuffer.append(Type.getClassName(Type.getClass(inventoryTag.getHelper())));
                throw new haxe.Exception(Std.string(stringBuffer));
            }
            return (cast viewObject : RequestMapInterface);
        } else {
            throw new haxe.Exception("Must have parent tag.");
        }
    }

    // throws Exception
    public function checkForValidationViewHelper(helperObject : Any) : Void {
        if (!(Std.isOfType(helperObject, ValidationViewHelper))) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Must have ");
            stringBuffer.append("ValidationViewHelper");
            stringBuffer.append("and not: ");
            stringBuffer.append(Type.getClassName(Type.getClass(helperObject)));
            throw new haxe.Exception(Std.string(stringBuffer));
        }
    }

    public function new() {
    }
}

