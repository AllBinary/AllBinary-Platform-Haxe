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

//import java.awt.*;
//import javax.swing.tree.MutableTreeNode;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom;
import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension;
import org.w3c.dom.Node;

interface GraphicItemInterface {
    function getName() : String;

    function setColor(color : Color) : Void;

    function getTreeNode() : MutableTreeNode;

    function getPointsInterface() : Points;

    function setPointsInterface(points : Points) : Void;

    function isValid() : Bool;

    function isActive() : Bool;

    function deactivate() : Void;

    function activate() : Void;

    function setFulcrumPoint(point : GPoint) : Void;

    // throws Exception
    function translate(x : Int, y : Int) : Void;

    function setRotate(theta : Float) : Void;

    function addRotate(theta : Float) : Void;

    function setAngle(angle : Float) : Void;

    function addAngle(angle : Float) : Void;

    function getAngle() : Float;

    function paint(g : Graphics, canvasAngle : Null<Float>, dimension : IntegerDimension, x : Int, y : Int) : Void;

    // throws Exception
    function toDom(canvasDom : CanvasDom) : Node;

    function removePoint() : GPoint;

    function addPoint(point : GPoint) : Void;

    function mouseClicked(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void;

    function mouseEntered(mouseEvent : java.awt.event.MouseEvent) : Void;

    function mouseExited(mouseEvent : java.awt.event.MouseEvent) : Void;

    function mousePressed(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void;

    function mouseReleased(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void;

    function mouseDragged(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void;

    function mouseMoved(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void;

    function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void;

    function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void;

    function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void;

    // throws Exception
    function duplicate() : GraphicItemInterface;

}

