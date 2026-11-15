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
package org.allbinary.data.tree.dom;

import org.allbinary.business.error.ErrorData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicErrorNodeUtil {
    public function new() {
    }

    // throws Exception
    public static function get(document : Document, errorText : String) : Node {
        try {
            var node : Node = document.createElement(ErrorData.getInstance().NAME);
            node.appendChild(ModDomHelper.createNameValueNodes(document, ErrorData.getInstance().TEXT, errorText));
            return node;
        } catch (e : haxe.Exception) {
            throw new jre.lang.JavaException("Error Node Creation Failure");
        }
    }

}

