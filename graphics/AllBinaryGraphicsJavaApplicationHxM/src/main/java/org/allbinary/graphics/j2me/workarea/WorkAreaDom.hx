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
package org.allbinary.graphics.j2me.workarea;

import org.allbinary.dom.DomHelper;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class WorkAreaDom {
    public static final WORKAREA : String = "workArea";
    public static final NAME : String = "name";
    public static final FRAMES : String = "frames";
    private var name : String = null;
    private var canvasNodeList : BasicArrayList = null;
    public function new(document : Document) {
        var workAreaNodeList : NodeList = document.getElementsByTagName(this.WORKAREA);
        if (workAreaNodeList != null) {
            var numberOfworkAreas : Int = workAreaNodeList.getLength();
            if (numberOfworkAreas == 1) {
                var numberOfNodes : Int = workAreaNodeList.getLength();
                var nameNode : Node = DomHelper.getInstance().searchNodeList(this.NAME, workAreaNodeList.item(0).getChildNodes());
                var nameTextNode : Node = nameNode.getFirstChild();
                this.name = nameTextNode.getNodeValue();
            } else {
                throw new haxe.Exception("Wrong Number of WorkAreas: " + numberOfworkAreas);
            }
            this.canvasNodeList = DomHelper.getInstance().getChildrenWithoutTextNodes(WorkAreaDom.FRAMES, workAreaNodeList.item(0).getChildNodes());
        } else {
            throw new haxe.Exception("workArea Node Not Found");
        }
    }

    public function getName() : String {
        return this.name;
    }

    public function getCanvasNodes() : BasicArrayList {
        return this.canvasNodeList;
    }

}

