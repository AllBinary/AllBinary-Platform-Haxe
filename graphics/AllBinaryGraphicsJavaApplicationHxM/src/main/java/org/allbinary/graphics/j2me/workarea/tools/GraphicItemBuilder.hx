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
package org.allbinary.graphics.j2me.workarea.tools;

import org.w3c.dom.Node;

class GraphicItemBuilder {
    public function new() {
    }

    // throws Exception
    public static function getInstance(node : Node) : GraphicItemInterface {
        var graphicItemName : String = node.getNodeName();
        if (Reflect.compare(graphicItemName, PointsDomUtil.getInstance().LINES) == 0) {
            return new LinesGraphicItem(node);
        } else {
            throw new haxe.Exception("Graphic Item Does Not Exist: " + graphicItemName);
        }
    }

}

