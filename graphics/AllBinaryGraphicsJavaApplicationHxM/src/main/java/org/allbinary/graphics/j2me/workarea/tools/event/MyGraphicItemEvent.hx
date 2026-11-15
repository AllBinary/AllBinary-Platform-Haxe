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
package org.allbinary.graphics.j2me.workarea.tools.event;

//import javax.swing.tree.MutableTreeNode;

class MyGraphicItemEvent extends java.util.EventObject {
    public function new(source : Any) {
        super(source);
    }

    public function getSource() : Any {
        return super.getSource();
    }

    public function toString() : String {
        return super.toString();
    }

    public function getCommand() : String {
        var myEventSource : MyGraphicItemEventSource = (cast this.getSource() : MyGraphicItemEventSource);
        return myEventSource.getCommand();
    }

    public function getTreeNode() : MutableTreeNode {
        var myEventSource : MyGraphicItemEventSource = (cast this.getSource() : MyGraphicItemEventSource);
        return myEventSource.getTreeNode();
    }

    public function getAngle() : Float {
        var myEventSource : MyGraphicItemEventSource = (cast this.getSource() : MyGraphicItemEventSource);
        return myEventSource.getAngle();
    }

}

