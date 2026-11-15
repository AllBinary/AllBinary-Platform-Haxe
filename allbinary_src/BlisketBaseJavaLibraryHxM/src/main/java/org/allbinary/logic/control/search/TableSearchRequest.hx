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

import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class TableSearchRequest {
    private var xslFile : String;
    private var pageName : String;
    private var contentType : String;
    private var keywords : String;
    private var searchParams : SearchParams;
    public function new(keywords : String, searchParams : SearchParams, xslFile : String, contentType : String) {
        this.keywords = keywords;
        this.searchParams = searchParams;
        this.xslFile = xslFile;
        this.pageName = this.pageName;
        this.contentType = contentType;
    }

    public function setKeywords(value : String) : Void {
        this.keywords = value;
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

    public function getKeywords() : String {
        return this.keywords;
    }

    public function getParams() : SearchParams {
        return this.searchParams;
    }

    // throws Exception
    public function getXslFile() : String {
        var path : String = URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH + this.xslFile;
        return path;
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

