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
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil;
import org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileData;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonLabels;
import org.apache.commons.fileupload.FileItem;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class AddFileValidationView extends InventoryItemView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private static final ADDPRODUCT : String = "Add Product";
    private static final NEXTSTEP : String = CommonLabels.getInstance().NEXT + " Step";
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var command : String = (cast this.getRequestHashMap().get(GLOBALS2.ADMINCOMMAND) : String);
            if (StringValidationUtil.getInstance().isEmpty(command) || (Reflect.compare(command, AddFileValidationView.ADDPRODUCT) != 0 && Reflect.compare(command, NEXTSTEP) != 0)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Invalid AdminCommand: ");
                    stringBuffer.append(command);
                    stringBuffer.append(" must be: ");
                    stringBuffer.append(AddFileValidationView.ADDPRODUCT);
                    stringBuffer.append(" or ");
                    stringBuffer.append(AddFileValidationView.NEXTSTEP);
                    this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var basicItemValidation : BasicItemValidation = new BasicItemValidation(this.itemInterface);
            if (basicItemValidation.isValid() == false) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF(basicItemValidation.validationInfo(), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
            this.itemInterface.setCategory(storeFrontInterface.getCategoryPath() + this.itemInterface.getCategory());
            var fullCategory : String = Std.string(new StringMaker().append(URLGLOBALS.getWebappPath()).append(storeFrontInterface.getCurrentHostNamePath()).append(this.itemInterface.getCategory()));
            var categoryFile : AbFile = AbFile.createAbFile(fullCategory);
            if (!categoryFile.isDirectory()) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Category Does Not Exist: " + fullCategory, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.itemInterface.getId()) != null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Item Already Exists", this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var imageFileItemObject : Any = this.getRequestHashMap().get(basicItemData.IMAGE);
            if (HttpFileUploadUtil.getInstance().isValid(imageFileItemObject)) {
                var fileItem : FileItem = (cast imageFileItemObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                HttpFileUploadUtil.log(fileItem);
                if (this.isValid(fileName, size) == false) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
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

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            var command : String = (cast this.getRequestHashMap().get(GLOBALS2.ADMINCOMMAND) : String);
            if (StringValidationUtil.getInstance().isEmpty(command) || (Reflect.compare(command, AddFileValidationView.ADDPRODUCT) != 0 && Reflect.compare(command, NEXTSTEP) != 0)) {
                return StringUtil.getInstance().EMPTY_STRING;
            }
            var basicItemValidation : BasicItemValidation = new BasicItemValidation(this.itemInterface);
            if (basicItemValidation.isValid() == false) {
                stringBuffer.append(basicItemValidation.validationInfo());
                stringBuffer.append("<br/>");
            }
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
            var fullCategory : String = Std.string(new StringMaker().append(URLGLOBALS.getWebappPath()).append(storeFrontInterface.getCurrentHostNamePath()).append(this.itemInterface.getCategory()));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Category: " + fullCategory, this, "validationInfo()");
            }
            var categoryFile : AbFile = AbFile.createAbFile(fullCategory);
            if (!categoryFile.isDirectory()) {
                stringBuffer.append("Category ");
                stringBuffer.append(this.itemInterface.getCategory());
                stringBuffer.append(" does not exist.<br />");
            }
            try {
                if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.itemInterface.getId()) != null) {
                    stringBuffer.append("Id is already in use. Refresh the page for a valid id.<br/>");
                }
            } catch (e : MoneyException) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Existing Item With MoneyException", this, "validationInfo()");
                }
            }
            var anyType : Any = this.getRequestHashMap().get(basicItemData.IMAGE);
            if (HttpFileUploadUtil.getInstance().isValid(anyType)) {
                var fileItem : FileItem = (cast anyType : FileItem);
                var fileName : String = fileItem.getName();
                var fileItemFieldName : String = fileItem.getFieldName();
                var size : haxe.Int64 = fileItem.getSize();
                this.validationInfo(stringBuffer, fileName, fileItemFieldName, size);
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    // throws Exception
    private function isValid(fileName : String, size : haxe.Int64) : Null<Bool> {
        final fileData : FileData = FileData.getInstance();
        if (size > fileData.MINIMAGEFILESIZE) {
            if (size < fileData.MAXIMAGEFILESIZE) {
                if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                    return false;
                } else {
                    final pathData : AbPathData = AbPathData.getInstance();
                    final extension : String = pathData.getExtension(fileName);
                    final uploadMedia : UploadMediaSingleton = UploadMediaSingleton.getInstance();
                    if (!uploadMedia.isWriterSupported(extension) && !uploadMedia.isReaderSupported(extension)) {
                        return false;
                    }
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    final stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("File Size To Large: ");
                    stringBuffer.appendlong(size);
                    stringBuffer.append(">");
                    stringBuffer.appendint(Std.int(fileData.MAXIMAGEFILESIZE));
                    this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            this.processImageFiles();
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("File Size To Small: ");
                stringBuffer.appendlong(size);
                stringBuffer.append(">");
                stringBuffer.appendint(Std.int(fileData.MINIMAGEFILESIZE));
                this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
            }
            return false;
        }
        return true;
    }

    private function validationInfo(stringBuffer : StringMaker, fileName : String, fileItemFieldName : String, size : haxe.Int64) : Void {
        final fileData : FileData = FileData.getInstance();
        if (size > fileData.MINIMAGEFILESIZE) {
            if (Reflect.compare(fileItemFieldName, basicItemData.IMAGE) == 0) {
                if (size < fileData.MAXIMAGEFILESIZE) {
                    if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                        stringBuffer.append("FileName must be >");
                        stringBuffer.appendint(Std.int(fileData.MINLEN));
                        stringBuffer.append(" and <");
                        stringBuffer.appendint(Std.int(fileData.MAXLEN));
                        stringBuffer.append("<br/>");
                    } else {
                        final pathData : AbPathData = AbPathData.getInstance();
                        var extension : String = pathData.getExtension(fileName);
                        final uploadMedia : UploadMediaSingleton = UploadMediaSingleton.getInstance();
                        if (!uploadMedia.isWriterSupported(extension) && !uploadMedia.isReaderSupported(extension)) {
                            stringBuffer.append("Image type: ");
                            stringBuffer.append(extension);
                            stringBuffer.append(" not supported.<br />");
                        }
                    }
                } else {
                    stringBuffer.append("Image File Is To Large. ");
                    stringBuffer.appendint(Std.int(fileData.MINIMAGEFILESIZE));
                    stringBuffer.append(" < > ");
                    stringBuffer.appendint(Std.int(fileData.MAXIMAGEFILESIZE));
                    stringBuffer.append("<br/>");
                }
            }
        } else {
            stringBuffer.append("Image File Is To Small. ");
            stringBuffer.appendint(Std.int(fileData.MINIMAGEFILESIZE));
            stringBuffer.append(" < > ");
            stringBuffer.appendint(Std.int(fileData.MAXIMAGEFILESIZE));
            stringBuffer.append("<br/>");
        }
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

