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
package org.allbinary.logic.control.search;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.AbContext;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class SearchRequest extends AbContext {
    private var xslFile : String;
    private var pageName : String;
    private var contentType : String;
    private var searchParams : SearchParams;
    private var storeFront : StoreFrontInterface;
    public function new(storeFront : StoreFrontInterface, searchParams : SearchParams, xslFile : String, contentType : String, propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext);
        this.storeFront = storeFront;
        this.searchParams = searchParams;
        this.xslFile = xslFile;
        this.pageName = this.pageName;
        this.contentType = contentType;
    }

    public function setStoreFront(storeFront : StoreFrontInterface) : Void {
        this.storeFront = storeFront;
    }

    public function setParams(searchParams : SearchParams) : Void {
        this.searchParams = searchParams;
    }

    public function setXslFile(value : String) : Void {
        this.xslFile = value;
    }

    public function setFileBaseName(value : String) : Void {
        this.pageName = value;
    }

    public function setContentType(value : String) : Void {
        this.contentType = value;
    }

    public function getStoreFront() : StoreFrontInterface {
        return this.storeFront;
    }

    public function getParams() : SearchParams {
        return this.searchParams;
    }

    public function getXslFile() : String {
        return this.xslFile;
    }

    public function getFileBaseName() : String {
        return this.pageName;
    }

    public function getContentType() : String {
        return this.contentType;
    }

    // throws Exception
    public function getFileBaseNameNode(document : Document) : Node {
        return ModDomHelper.createNameValueNodes(document, SearchData.FILENAME, this.getFileBaseName());
    }

}

