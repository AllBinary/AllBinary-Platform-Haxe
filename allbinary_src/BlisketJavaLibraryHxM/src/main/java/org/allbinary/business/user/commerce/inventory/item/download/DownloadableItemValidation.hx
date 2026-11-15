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
package org.allbinary.business.user.commerce.inventory.item.download;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DownloadableItemValidation extends Validation {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var downloadableItem : DownloadableItem;
    public function new(downloadableItem : DownloadableItem) {
        super();
        this.downloadableItem = downloadableItem;
    }

    public function isValid() : Null<Bool> {
        try {
            if (this.downloadableItem.getId() == null || this.downloadableItem.getId().length() < 1 || this.downloadableItem.getId().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.downloadableItem.getId() != null && !StringValidationUtil.getInstance().isNumber(this.downloadableItem.getId())) {
                return false;
            }
            if (this.downloadableItem.getSystem() == null || this.downloadableItem.getSystem().length() < 1 || this.downloadableItem.getSystem().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.downloadableItem.getPlatform() == null || this.downloadableItem.getPlatform().length() < 1 || this.downloadableItem.getPlatform().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.downloadableItem.getSpecialName() == null || this.downloadableItem.getSpecialName().length() < 0 || this.downloadableItem.getSpecialName().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.downloadableItem.getVersion() == null || this.downloadableItem.getVersion().length() < 1 || this.downloadableItem.getVersion().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.downloadableItem.getChanges() == null || this.downloadableItem.getChanges().length() < 1 || this.downloadableItem.getChanges().length() > AbSqlData.MAXBLOB) {
                return false;
            }
            if (this.downloadableItem.getSize() == null) {
                return false;
            } else {
                var size : String = Std.string(this.downloadableItem.getSize());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    return false;
                }
            }
            if (this.downloadableItem.getValidTime() == null) {
                return false;
            } else {
                var size : String = Std.string(this.downloadableItem.getValidTime());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    return false;
                }
            }
            if (this.downloadableItem.getRetries() == null) {
                return false;
            } else {
                var size : String = Std.string(this.downloadableItem.getRetries());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.downloadableItem.getId() == null || this.downloadableItem.getId().length() < 1 || this.downloadableItem.getId().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Id is invalid. Must be number < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXNUM));
                stringBuffer.append(" and > 0 digits.<br/>");
            }
            if (this.downloadableItem.getId() != null && !StringValidationUtil.getInstance().isNumber(this.downloadableItem.getId())) {
                stringBuffer.append("Id is invalid. Must be > 0.<br/>");
            }
            if (this.downloadableItem.getSystem() == null || this.downloadableItem.getSystem().length() < 1 || this.downloadableItem.getSystem().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("System value is invalid. Must be < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXSTRING));
                stringBuffer.append(" and > 0 characters long.<br/>");
            }
            if (this.downloadableItem.getPlatform() == null || this.downloadableItem.getPlatform().length() < 1 || this.downloadableItem.getPlatform().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Platform value is invalid. Must be < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXSTRING));
                stringBuffer.append(" and > 0 characters long.<br/>");
            }
            if (this.downloadableItem.getSpecialName() == null || this.downloadableItem.getSpecialName().length() < 0 || this.downloadableItem.getSpecialName().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Special Name value is invalid. Must be < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXSTRING));
                stringBuffer.append(" and > 0 characters long.<br/>");
            }
            if (this.downloadableItem.getVersion() == null || this.downloadableItem.getVersion().length() < 1 || this.downloadableItem.getVersion().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Version value is invalid. Must be < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXSTRING));
                stringBuffer.append(" and > 0 characters long.<br/>");
            }
            if (this.downloadableItem.getChanges() == null || this.downloadableItem.getChanges().length() < 0 || this.downloadableItem.getChanges().length() > AbSqlData.MAXBLOB) {
                stringBuffer.append("Changes value is invalid. Must be < ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXBLOB));
                stringBuffer.append(" and >= 0 characters long.<br/>");
            }
            if (this.downloadableItem.getSize() == null) {
                stringBuffer.append("File Size is null");
            } else {
                var size : String = Std.string(this.downloadableItem.getSize());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    stringBuffer.append("File Size is invalid. Must be number < ");
                    stringBuffer.appendint(Std.int(AbSqlData.MAXNUM));
                    stringBuffer.append(" and > 0 digits.<br/>");
                }
            }
            if (this.downloadableItem.getValidTime() == null) {
                stringBuffer.append("Valid Time is null");
            } else {
                var size : String = Std.string(this.downloadableItem.getValidTime());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    stringBuffer.append("Valid Time is invalid. Must be number < ");
                    stringBuffer.appendint(Std.int(AbSqlData.MAXNUM));
                    stringBuffer.append(" and > 0 digits.<br/>");
                }
            }
            if (this.downloadableItem.getRetries() == null) {
                stringBuffer.append("Retries is null");
            } else {
                var size : String = Std.string(this.downloadableItem.getRetries());
                if (size.length < 1 || size.length > AbSqlData.MAXNUM) {
                    stringBuffer.append("Retries is invalid. Must be number < ");
                    stringBuffer.appendint(Std.int(AbSqlData.MAXNUM));
                    stringBuffer.append(" and > 0 digits.<br/>");
                }
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

