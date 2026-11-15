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

class MyGraphicItemEventSource {
    private var command : String;
    private var treeNode : MutableTreeNode;
    private var angle : Float = 0.0;
    public function new(command : String, treeNode : MutableTreeNode) {
        this.command = command;
        this.treeNode = treeNode;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(command : String, angle : Float, treeNode : MutableTreeNode) {
        this.command = command;
        this.treeNode = treeNode;
        this.setAngle(angle);
    }

    public function getCommand() : String {
        return this.command;
    }

    public function getTreeNode() : MutableTreeNode {
        return this.treeNode;
    }

    public function getAngle() : Float {
        return this.angle;
    }

    public function setAngle(angle : Float) : Void {
        this.angle = angle;
    }

}

