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
package org.allbinary.logic.visual.transform.info;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.AbContext;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;
import org.w3c.dom.Document;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;

//Hack class should not exist
class TransformInfoBasic extends AbContext implements TransformInfoHttpInterface {
    private var storeFrontInterface : StoreFrontInterface;
    public function new(storeFrontInterface : StoreFrontInterface, propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext);
        this.storeFrontInterface = storeFrontInterface;
    }

    public function getStoreName() : String {
        return this.storeFrontInterface.getName();
    }

    public function log() : String {
        return commonStrings.NOT_IMPLEMENTED;
    }

    public function override_(hashMap : HashMap) : Void {
    }

    public function getName() : String {
        return null;
    }

    public function getObjectFile() : String {
        return null;
    }

    public function getObject() : Any {
        return null;
    }

    public function getObjectConfigInterface() : TransformInfoObjectConfigInterface {
        return null;
    }

    public function setObjectConfigInterface(transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface) : Void {
    }

    public function getTemplateFilePath() : AbPath {
        return null;
    }

    public function getTemplateFile() : String {
        return null;
    }

    public function getTemplate() : String {
        return null;
    }

    public function getDataFilePath() : AbPath {
        return null;
    }

    public function getDataFile() : String {
        return null;
    }

    // throws Exception
    public function getDataDocument() : Document {
        throw new haxe.Exception(commonStrings.NOT_IMPLEMENTED);
    }

    public function setName(value : String) : Void {
    }

    public function setStoreName(value : String) : Void {
    }

    public function setObjectFile(value : String) : Void {
    }

    public function setObject(anyType : Any) : Void {
    }

    public function setObjectConfigFile(value : String) : Void {
    }

    public function setTemplateFile(value : String) : Void {
    }

    public function setTemplate(value : String) : Void {
    }

    public function setDataFile(value : String) : Void {
    }

    public function setData(value : String) : Void {
    }

    public function setChild() : Void {
    }

    public function isChild() : Bool {
        return true;
    }

    public function getImportUriPath() : String {
        return null;
    }

    public function setImportUriPath(importUriPath : String) : Void {
    }

    // throws Exception
    public function getKey() : Any {
        return null;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        return null;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        return null;
    }

    public override function getWeblisketSession() : WeblisketSessionInterface {
        return super.getWeblisketSession();
    }

    public override function getPageContext() : PageContext {
        return super.getPageContext();
    }

    public override function getPropertiesHashMap() : HashMap {
        return super.getPropertiesHashMap();
    }

}

