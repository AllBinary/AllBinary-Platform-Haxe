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
package org.allbinary.business.user.commerce.inventory.item;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicItemValidation extends Validation {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final MAXWEIGHT : Int = 14;
    private final MAXPRICE : Int = 14;
    private var itemInterface : ItemInterface;
    public function new(itemInterface : ItemInterface) {
        super();
        this.itemInterface = itemInterface;
    }

    public function isValid() : Null<Bool> {
        try {
            if (this.itemInterface.getId() == null || this.itemInterface.getId().length() < 1 || this.itemInterface.getId().length() > AbSqlData.MAXNUM) {
                return false;
            }
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (this.itemInterface.getId() != null && !stringValidationUtil.isNumber(this.itemInterface.getId())) {
                return false;
            }
            if (this.itemInterface.getNumber() == null || this.itemInterface.getNumber().length() < 1 || this.itemInterface.getNumber().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getNumber() != null && !stringValidationUtil.isNumber(this.itemInterface.getNumber())) {
                return false;
            }
            if (this.itemInterface.getInBaskets() == null || this.itemInterface.getInBaskets().length() < 1 || this.itemInterface.getInBaskets().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getInBaskets() != null && !stringValidationUtil.isNumber(this.itemInterface.getInBaskets())) {
                return false;
            }
            if (this.itemInterface.getWeight() == null || this.itemInterface.getWeight().length() < 1 || this.itemInterface.getWeight().length() > this.MAXWEIGHT) {
                return false;
            }
            if (this.itemInterface.getWeight() != null && !stringValidationUtil.isNumber(this.itemInterface.getWeight())) {
                return false;
            }
            if (this.itemInterface.getEnabled() == null || this.itemInterface.getEnabled().length() < 1 || this.itemInterface.getEnabled().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getNewOrUsed() == null || this.itemInterface.getNewOrUsed().length() < 1 || this.itemInterface.getNewOrUsed().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getSummary() == null || this.itemInterface.getSummary().length() < 1 || this.itemInterface.getSummary().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getDescription() == null || this.itemInterface.getDescription().length() < 1 || this.itemInterface.getDescription().length() > AbSqlData.MAXBLOB) {
                return false;
            }
            if (this.itemInterface.getKeywords() == null || this.itemInterface.getKeywords().length() < 1 || this.itemInterface.getKeywords().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getCategory() == null || this.itemInterface.getCategory().length() < 1 || this.itemInterface.getCategory().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getType() == null || this.itemInterface.getType().length() < 1 || this.itemInterface.getType().length() > AbSqlData.MAXSTRING) {
                return false;
            }
            if (this.itemInterface.getPrice() == null || !this.itemInterface.getPrice().isValid()) {
                return false;
            }
            if (this.itemInterface.getCustoms() == null || this.itemInterface.getCustoms().length() < 1 || this.itemInterface.getCustoms().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getDownloads() == null || this.itemInterface.getDownloads().length() < 1 || this.itemInterface.getDownloads().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getGroups() == null || this.itemInterface.getGroups().length() < 1 || this.itemInterface.getGroups().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getOptions() == null || this.itemInterface.getOptions().length() < 1 || this.itemInterface.getOptions().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getPermissions() == null || this.itemInterface.getPermissions().length() < 1 || this.itemInterface.getPermissions().length() > AbSqlData.MAXNUM) {
                return false;
            }
            if (this.itemInterface.getSpecials() == null || this.itemInterface.getSpecials().length() < 1 || this.itemInterface.getSpecials().length() > AbSqlData.MAXNUM) {
                return false;
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
            if (this.itemInterface.getId() == null || this.itemInterface.getId().length() < 1 || this.itemInterface.getId().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Id is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (this.itemInterface.getId() != null && !stringValidationUtil.isNumber(this.itemInterface.getId())) {
                stringBuffer.append("Id is invalid. Must be > 0.<br />");
            }
            if (this.itemInterface.getNumber() == null || this.itemInterface.getNumber().length() < 1 || this.itemInterface.getNumber().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Number of items is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getNumber() != null && !stringValidationUtil.isNumber(this.itemInterface.getNumber())) {
                stringBuffer.append("Number of items value is not a valid number.<br />");
            }
            if (this.itemInterface.getInBaskets() == null || this.itemInterface.getInBaskets().length() < 1 || this.itemInterface.getInBaskets().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Number in baskets is invalid. Must be < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getInBaskets() != null && !stringValidationUtil.isNumber(this.itemInterface.getInBaskets())) {
                stringBuffer.append("In Baskets value is not a valid number.<br />");
            }
            if (this.itemInterface.getWeight() == null || this.itemInterface.getWeight().length() < 1 || this.itemInterface.getWeight().length() > this.MAXWEIGHT) {
                stringBuffer.append("Weight value is invalid. Must be < " + this.MAXWEIGHT + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getWeight() != null && !stringValidationUtil.isNumber(this.itemInterface.getWeight())) {
                stringBuffer.append("Weight value is not a valid number.<br />");
            }
            if (this.itemInterface.getEnabled() == null || this.itemInterface.getEnabled().length() < 1 || this.itemInterface.getEnabled().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("For Sale value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getNewOrUsed() == null || this.itemInterface.getNewOrUsed().length() < 1 || this.itemInterface.getNewOrUsed().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("New Or Used value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getSummary() == null || this.itemInterface.getSummary().length() < 1 || this.itemInterface.getSummary().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Summary value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getDescription() == null || this.itemInterface.getDescription().length() < 1 || this.itemInterface.getDescription().length() > AbSqlData.MAXBLOB) {
                stringBuffer.append("Description value is invalid. Must be < " + AbSqlData.MAXBLOB + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getKeywords() == null || this.itemInterface.getKeywords().length() < 1 || this.itemInterface.getKeywords().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Keywords value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getCategory() == null || this.itemInterface.getCategory().length() < 1 || this.itemInterface.getCategory().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Category value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getType() == null || this.itemInterface.getType().length() < 1 || this.itemInterface.getType().length() > AbSqlData.MAXSTRING) {
                stringBuffer.append("Type value is invalid. Must be < " + AbSqlData.MAXSTRING + " and > 0 characters long.<br />");
            }
            if (this.itemInterface.getPrice() == null || !this.itemInterface.getPrice().isValid()) {
                stringBuffer.append("Price value is invalid. Must be < " + this.MAXPRICE + " and > 0 in length.<br />");
            }
            if (this.itemInterface.getCustoms() == null || this.itemInterface.getCustoms().length() < 1 || this.itemInterface.getCustoms().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Custom items value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getDownloads() == null || this.itemInterface.getDownloads().length() < 1 || this.itemInterface.getDownloads().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Downloadable item value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getGroups() == null || this.itemInterface.getGroups().length() < 1 || this.itemInterface.getGroups().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Group item value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getOptions() == null || this.itemInterface.getOptions().length() < 1 || this.itemInterface.getOptions().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Option item value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getPermissions() == null || this.itemInterface.getPermissions().length() < 1 || this.itemInterface.getPermissions().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Permission item value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
            }
            if (this.itemInterface.getSpecials() == null || this.itemInterface.getSpecials().length() < 1 || this.itemInterface.getSpecials().length() > AbSqlData.MAXNUM) {
                stringBuffer.append("Special item value is invalid. Must be number < " + AbSqlData.MAXNUM + " and > 0 digits.<br />");
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

