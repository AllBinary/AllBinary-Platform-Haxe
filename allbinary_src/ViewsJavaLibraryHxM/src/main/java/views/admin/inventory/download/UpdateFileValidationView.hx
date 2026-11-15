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
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemValidation;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemValidation;
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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;
import org.apache.commons.fileupload.FileItem;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UpdateFileValidationView extends DownloadableInventoryItemView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var command : String = (cast this.getRequestHashMap().get(GLOBALS2.ADMINCOMMAND) : String);
            if (StringValidationUtil.getInstance().isEmpty(command) || Reflect.compare(command, this.commonStrings.UPDATE) != 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Invalid AdminCommand=" + command, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            try {
                var inventoryEntity : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
                this.itemInterface = inventoryEntity.getItem(this.id);
            } catch (e : MoneyException) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.put("Existing Item With MoneyException", this, this.commonStrings.IS_VALID, e);
                }
            }
            if (this.itemInterface == null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Item Does Not Exist", this, this.commonStrings.IS_VALID);
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
            var fullCategory : String = new StringMaker().append(URLGLOBALS.getWebappPath()).append(storeFrontInterface.getCurrentHostNamePath()).append(this.itemInterface.getCategory()).toString();
            var categoryFile : AbFile = AbFile.createAbFile(fullCategory);
            if (!categoryFile.isDirectory()) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Category Does Not Exist: " + fullCategory, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            var downloadableFileObject : Any = this.getRequestHashMap().get(DownloadItemData.FILE);
            if (HttpFileUploadUtil.getInstance().isValid(downloadableFileObject)) {
                var fileItem : FileItem = (cast downloadableFileObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                HttpFileUploadUtil.log(fileItem);
                if (this.isValid(fileName, size) == false) {
                    return false;
                } else {
                    this.processFile(fileItem);
                    this.getRequestHashMap().put(DownloadItemData.SIZE, Std.string(size));
                }
            } else {
                this.getRequestHashMap().remove(DownloadItemData.FILE);
            }
            var licenseFileObject : Any = this.getRequestHashMap().get(DownloadItemData.LICENSE_FILE);
            if (HttpFileUploadUtil.getInstance().isValid(licenseFileObject)) {
                var fileItem : FileItem = (cast licenseFileObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                HttpFileUploadUtil.log(fileItem);
                if (this.isValid(fileName, size) == false) {
                } else {
                    this.processFile(fileItem);
                }
            } else {
                this.getRequestHashMap().remove(DownloadItemData.LICENSE_FILE);
            }
            var extraFilesObject : Any = this.getRequestHashMap().get(DownloadItemData.EXTRA_FILES);
            if (HttpFileUploadUtil.getInstance().isValid(extraFilesObject)) {
                var fileItem : FileItem = (cast extraFilesObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                HttpFileUploadUtil.log(fileItem);
                if (this.isValid(fileName, size) == false) {
                } else {
                    this.processFile(fileItem);
                    this.unzip(fileItem);
                }
            } else {
                this.getRequestHashMap().remove(DownloadItemData.EXTRA_FILES);
            }
            var hashMap : HashMap = this.getRequestHashMap();
            hashMap.put(basicItemData.ID, this.itemInterface.getId());
            var licenseObject : Any = hashMap.get(DownloadItemData.LICENSE_FILE);
            if (licenseObject != null) {
                hashMap.put(DownloadItemData.LICENSE_FILE, ((cast licenseObject : FileItem)).getName());
            } else {
                hashMap.put(DownloadItemData.LICENSE_FILE, StringUtil.getInstance().EMPTY_STRING);
            }
            var fileObject : Any = hashMap.get(DownloadItemData.FILE);
            if (fileObject != null) {
                hashMap.put(DownloadItemData.FILE, ((cast fileObject : FileItem)).getName());
            } else {
                hashMap.put(DownloadItemData.FILE, StringUtil.getInstance().EMPTY_STRING);
            }
            this.downloadableItem = new DownloadableItem(hashMap);
            var downloadableItemValidation : DownloadableItemValidation = new DownloadableItemValidation(this.downloadableItem);
            if (downloadableItemValidation.isValid() == false) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("DownloadableItem is not valid", this, this.commonStrings.IS_VALID);
                }
                return false;
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
            if (StringValidationUtil.getInstance().isEmpty(command) || Reflect.compare(command, this.commonStrings.UPDATE) != 0) {
                return StringUtil.getInstance().EMPTY_STRING;
            }
            if (this.itemInterface == null) {
                final ITEM_NOT_FOUND : String = "Item Does Not Exist";
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF(ITEM_NOT_FOUND, this, "validationInfo()");
                }
                return ITEM_NOT_FOUND;
            }
            var basicItemValidation : BasicItemValidation = new BasicItemValidation(this.itemInterface);
            if (basicItemValidation.isValid() == false) {
                stringBuffer.append(basicItemValidation.validationInfo());
                stringBuffer.append("<br/>");
            }
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
            var fullCategory : String = new StringMaker().append(URLGLOBALS.getWebappPath()).append(storeFrontInterface.getCurrentHostNamePath()).append(this.itemInterface.getCategory()).toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Category: " + fullCategory, this, "validationInfo()");
            }
            var categoryFile : AbFile = AbFile.createAbFile(fullCategory);
            if (!categoryFile.isDirectory()) {
                stringBuffer.append("Category ");
                stringBuffer.append(this.itemInterface.getCategory());
                stringBuffer.append(" does not exist.");
                stringBuffer.append("<br />");
            }
            var downloadableFileObject : Any = this.getRequestHashMap().get(DownloadItemData.FILE);
            if (HttpFileUploadUtil.getInstance().isValid(downloadableFileObject)) {
                var fileItem : FileItem = (cast downloadableFileObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                this.validationInfo(stringBuffer, fileName, size);
            } else {
                stringBuffer.append("Download File Missing");
                stringBuffer.append("<br/>");
            }
            var licenseFileObject : Any = this.getRequestHashMap().get(DownloadItemData.LICENSE_FILE);
            if (HttpFileUploadUtil.getInstance().isValid(licenseFileObject)) {
                var fileItem : FileItem = (cast licenseFileObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                this.validationInfo(stringBuffer, fileName, size);
            } else {
            }
            var extraFilesObject : Any = this.getRequestHashMap().get(DownloadItemData.EXTRA_FILES);
            if (HttpFileUploadUtil.getInstance().isValid(extraFilesObject)) {
                var fileItem : FileItem = (cast extraFilesObject : FileItem);
                var fileName : String = fileItem.getName();
                var size : haxe.Int64 = fileItem.getSize();
                this.validationInfo(stringBuffer, fileName, size);
            } else {
            }
            if (this.downloadableItem != null) {
                var downloadableItemValidation : DownloadableItemValidation = new DownloadableItemValidation(this.downloadableItem);
                if (downloadableItemValidation.isValid() == false) {
                    final log : String = downloadableItemValidation.validationInfo();
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        this.logUtil.putF(log, this, this.commonStrings.IS_VALID);
                    }
                    stringBuffer.append(log);
                    stringBuffer.append("<br/>");
                }
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    // throws Exception
    private function isValid(fileName : String, size : haxe.Int64) : Null<Bool> {
        var fileData : FileData = FileData.getInstance();
        if (size > fileData.MINDOWNLOADABLEFILESIZE) {
            if (size < fileData.MAXDOWNLOADABLEFILESIZE) {
                if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("File name is not valid: ");
                        stringBuffer.append(fileName);
                        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
                    }
                    return false;
                } else {
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("File Size To Large: ");
                    stringBuffer.appendlong(size);
                    stringBuffer.append(">");
                    stringBuffer.appendint(Std.int(fileData.MAXDOWNLOADABLEFILESIZE));
                    this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("File Size To Small: ");
                stringBuffer.appendlong(size);
                stringBuffer.append(">");
                stringBuffer.appendint(Std.int(fileData.MINDOWNLOADABLEFILESIZE));
                this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
            }
            return false;
        }
        return true;
    }

    private function validationInfo(stringBuffer : StringMaker, fileName : String, size : haxe.Int64) : Void {
        var fileData : FileData = FileData.getInstance();
        if (size > fileData.MINDOWNLOADABLEFILESIZE) {
            if (size < fileData.MAXDOWNLOADABLEFILESIZE) {
                if (!StringValidationUtil.getInstance().isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN)) {
                    stringBuffer.append("File Name must be more than ");
                    stringBuffer.appendint(Std.int(fileData.MINLEN));
                    stringBuffer.append(" and less than ");
                    stringBuffer.appendint(Std.int(fileData.MAXLEN));
                    stringBuffer.append(" characters in length: ");
                    stringBuffer.append(fileName);
                    stringBuffer.append("<br/>");
                } else {
                }
            } else {
                stringBuffer.append("File Is Not The Right Size. ");
                stringBuffer.appendint(Std.int(fileData.MINDOWNLOADABLEFILESIZE));
                stringBuffer.append("< >");
                stringBuffer.appendint(Std.int(fileData.MAXDOWNLOADABLEFILESIZE));
                stringBuffer.append("<br/>");
            }
        }
    }

}

