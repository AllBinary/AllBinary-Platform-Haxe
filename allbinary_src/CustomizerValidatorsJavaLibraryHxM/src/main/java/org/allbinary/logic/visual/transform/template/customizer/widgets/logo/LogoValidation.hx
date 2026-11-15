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
package org.allbinary.logic.visual.transform.template.customizer.widgets.logo;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.HttpRequestUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.io.file.FileData;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.apache.commons.fileupload.FileItem;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class LogoValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var logoFileItem : FileItem = null;
    private var logoAbPath : AbPath;
    private var logoFile : String;
    private var isFile : Bool;
    public function new() {
        super();
        this.isFile = false;
        this.logoAbPath = null;
        this.logoFile = null;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        super();
        this.isFile = false;
        this.logoAbPath = new AbPath(DomSearchHelper.getNode(LogoData.getInstance().IMAGEPATH, node.getChildNodes()).getNodeValue(), StringUtil.getInstance().EMPTY_STRING);
        this.logoFile = DomSearchHelper.getNode(LogoData.getInstance().IMAGEFILENAME, node.getChildNodes()).getNodeValue();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
        this.isFile = true;
        this.getFormData(hashMap);
    }

    // throws Exception
    public function getFormData(hashMap : HashMap) : Void {
        this.logoFileItem = (cast hashMap.get(LogoData.getInstance().IMAGE) : FileItem);
        this.logoAbPath = new AbPath((cast hashMap.get(LogoData.getInstance().IMAGEPATH) : String), StringUtil.getInstance().EMPTY_STRING);
        if (this.logoFileItem != null) {
            this.logoFile = HttpRequestUtil.getInstance().generateFileName(this.logoFileItem.getName());
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("HashMap: ");
            stringBuffer.append(hashMap.toString());
            stringBuffer.append("\nLogoFileName: ");
            stringBuffer.append(this.logoFile);
            this.logUtil.putF(stringBuffer.toString(), this, "getFormData()");
        }
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            var fileData : FileData = FileData.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("LogoValidation", this, this.commonStrings.IS_VALID);
            }
            if (!StringValidationUtil.getInstance().isValidRequired(this.logoAbPath.toString(), 0, 512)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("logoPath is invalid: " + this.logoAbPath.toString(), this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            if (!StringValidationUtil.getInstance().isValidRequired(this.logoFile, fileData.MINLEN, fileData.MAXLEN)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("logoFile is invalid: " + this.logoFile, this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            if (this.isFile) {
                if (this.logoFileItem == null) {
                    return false;
                }
                if (this.logoFileItem.getSize() > fileData.MAXIMAGEFILESIZE || this.logoFileItem.getSize() < fileData.MINIMAGEFILESIZE) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        this.logUtil.putF("Image File Is Not The Right Size. " + fileData.MINIMAGEFILESIZE + "< > " + fileData.MAXIMAGEFILESIZE, this, this.commonStrings.IS_VALID);
                    }
                    return false;
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Logo Validation: " + valid, this, this.commonStrings.IS_VALID);
            }
            return valid;
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
            stringBuffer.append("Logo is not valid.");
            return stringBuffer.toString();
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

    public function toHashMap() : HashMap {
        final stringUtil : StringUtil = StringUtil.getInstance();
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(LogoData.getInstance().IMAGE, stringUtil.EMPTY_STRING);
        if (this.logoFile != null) {
            hashMap.put(LogoData.getInstance().IMAGEPATH, this.logoAbPath.toString());
            hashMap.put(LogoData.getInstance().IMAGEFILENAME, this.logoFile);
        } else {
            hashMap.put(LogoData.getInstance().IMAGEPATH, null);
            hashMap.put(LogoData.getInstance().IMAGEFILENAME, this.logoFile);
        }
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        return ModDomHelper.createNameValueNodes(document, LogoData.getInstance().NAME, hashMap);
    }

    // throws Exception
    public function processLogoFile() : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Processing logoFile: ");
            stringBuffer.append(this.logoAbPath.toString());
            stringBuffer.append(this.logoFile);
            this.logUtil.putF(stringBuffer.toString(), this, "processLogoFile()");
        }
        new LogoImageFileUtil(this.logoAbPath, this.logoFile).saveFiles(this.logoFileItem);
    }

}

