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
package org.allbinary.data.tree.dom.document;

import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;

class DocumentToNode {
    private static final XMLROOT : String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
    private static final XMLROOTSTART : String = "<?xml";
    private static final XMLROOTEND : String = "?>";
    private static final XMLJSPROOTSTART : String = "<jsp:root";
    private static final XMLEND : String = ">";
    private static final XMLJSPROOTENDSTART : String = "</jsp:root";
    public function new() {
    }

    // throws Exception
    public static function convertDocumentToNodeString(documentString : String) : String {
        documentString = DocumentToNode.remove(documentString, DocumentToNode.XMLJSPROOTSTART, DocumentToNode.XMLEND);
        documentString = DocumentToNode.remove(documentString, DocumentToNode.XMLJSPROOTENDSTART, DocumentToNode.XMLEND);
        var replaceXmlRoot : Replace = new Replace(XMLROOT, StringUtil.getInstance().EMPTY_STRING);
        return replaceXmlRoot.all(documentString);
    }

    public static function removeXmlDefinitionFromDocumentString(documentString : String) : String {
        return DocumentToNode.remove(documentString, XMLROOTSTART, XMLROOTEND);
    }

    public static function remove(documentString : String, start : String, end : String) : String {
        var startIndex : Int = 0;
        while (((startIndex = documentString.indexOf(start))) != -1) {
            if (startIndex >= 0) {
                var endIndex : Int = documentString.indexOf(end, startIndex);
                if (endIndex >= 0) {
                    var startString : String = documentString.substring(0, startIndex);
                    var resultString : String = documentString.substring(endIndex + 1);
                    return startString + resultString;
                }
            }
        }
        return documentString;
    }

}

