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

import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemValidation;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.apache.commons.fileupload.FileItem;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UpdateFileValidationView extends InventoryItemView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final UPDATEPRODUCT : String = CommonStrings.getInstance().UPDATE;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var command : String = (cast this.getRequestHashMap().get(GLOBALS2.ADMINCOMMAND) : String);
            if (command == null || Reflect.compare(command, UpdateFileValidationView.UPDATEPRODUCT) != 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Invalid AdminCommand=" + command, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            if (new BasicItemValidation(this.itemInterface).isValid() == false) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("BasicItem is not valid", this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(storeFrontInterface.getCurrentHostNamePath());
            stringBuffer.append(this.itemInterface.getCategory());
            var fullCategory : String = Std.string(stringBuffer);
            var categoryFile : AbFile = AbFile.createAbFile(fullCategory);
            if (!categoryFile.isDirectory()) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Category Does Not Exist: " + fullCategory, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var inventoryEntity : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
            if (inventoryEntity.getItem(this.itemInterface.getId()) == null) {
                return false;
            }
            var anyType : Any = this.getRequestHashMap().get(basicItemData.IMAGE);
            if (HttpFileUploadUtil.getInstance().isValid(anyType)) {
                var fileItem : FileItem = (cast anyType : FileItem);
                var size : haxe.Int64 = fileItem.getSize();
                var fileName : String = fileItem.getName();
                HttpFileUploadUtil.log(fileItem);
                if (this.isValid(fileName, size) == false) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.put("Exception in validation", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function validationInfo() : String {
        var stringBuffer : StringMaker = new StringMaker();
        var command : String = (cast this.getRequestHashMap().get(GLOBALS2.ADMINCOMMAND) : String);
        if (command == null || Reflect.compare(command, UpdateFileValidationView.UPDATEPRODUCT) != 0) {
            return CommonSeps.getInstance().SPACE;
        }
        stringBuffer.append(new BasicItemValidation(this.itemInterface).validationInfo());
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
        var fullCategory : String = (cast URLGLOBALS.getWebappPath() : String) + storeFrontInterface.getCurrentHostNamePath() + this.itemInterface.getCategory();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Category: " + fullCategory, this, "validationInfo()");
        }
        try {
            if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.itemInterface.getId()) == null) {
                stringBuffer.append("Item does not exist.<br>");
            }
        } catch (e : MoneyException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Existing Item With MoneyException", this, "validationInfo()");
            }
        }
        var anyType : Any = this.getRequestHashMap().get(basicItemData.IMAGE);
        if (HttpFileUploadUtil.getInstance().isValid(anyType)) {
            var fileItem : FileItem = (cast anyType : FileItem);
            var size : haxe.Int64 = fileItem.getSize();
            var fileName : String = fileItem.getName();
            var fileItemFieldName : String = fileItem.getFieldName();
            this.validationInfo(stringBuffer, fileName, fileItemFieldName, size);
        }
        return Std.string(stringBuffer);
    }

    // throws Exception
    private function isValid(fileName : String, size : haxe.Int64) : Null<Bool> {
        var fileData : FileData = FileData.getInstance();
        if (size > fileData.MINIMAGEFILESIZE) {
            if (size < fileData.MAXIMAGEFILESIZE) {
                if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                    return false;
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("File Size To Large: ");
                    stringBuffer.appendlong(size);
                    stringBuffer.append(">");
                    stringBuffer.appendint(Std.int(fileData.MAXIMAGEFILESIZE));
                    this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            this.processImageFiles();
        }
        return true;
    }

    private function validationInfo(stringBuffer : StringMaker, fileName : String, fileItemFieldName : String, size : haxe.Int64) : Void {
        var fileData : FileData = FileData.getInstance();
        if (size > fileData.MINIMAGEFILESIZE) {
            if (Reflect.compare(fileItemFieldName, basicItemData.IMAGE) == 0) {
                if (size < fileData.MAXIMAGEFILESIZE) {
                    if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                        stringBuffer.append("FileName must be >");
                        stringBuffer.appendint(Std.int(fileData.MINLEN));
                        stringBuffer.append("and <");
                        stringBuffer.appendint(Std.int(fileData.MAXLEN));
                        stringBuffer.append("<br />");
                    }
                } else {
                    stringBuffer.append("Image File Is Not The Right Size. ");
                    stringBuffer.appendint(Std.int(fileData.MINIMAGEFILESIZE));
                    stringBuffer.append("< > ");
                    stringBuffer.appendint(Std.int(fileData.MAXIMAGEFILESIZE));
                    stringBuffer.append("<br />");
                }
            }
        }
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

