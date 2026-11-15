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
package org.allbinary.logic.visual.dhtml.html.head.meta;


class HtmlMetaAttributeDataFactory {
    private static final instance : HtmlMetaAttributeDataFactory = new HtmlMetaAttributeDataFactory();
    public static function getInstance() : HtmlMetaAttributeDataFactory {
        return HtmlMetaAttributeDataFactory.instance;
    }

    public function new() {
    }

    public var NAME : HtmlMetaAttributeData = new HtmlMetaAttributeData(0, "HTMLMETA_ATTRIBUTE_NAME");
    public var HTTP_EQUIV : HtmlMetaAttributeData = new HtmlMetaAttributeData(1, "HTMLMETA_ATTRIBUTE_HTTPEQUIV");
    public var CONTENT : HtmlMetaAttributeData = new HtmlMetaAttributeData(2, "HTMLMETA_ATTRIBUTE_CONTENT");
}

