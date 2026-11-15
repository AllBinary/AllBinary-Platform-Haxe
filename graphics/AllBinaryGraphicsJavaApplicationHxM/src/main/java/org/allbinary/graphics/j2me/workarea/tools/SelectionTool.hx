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
//import java.util.HashMap;
//import javax.swing.tree.MutableTreeNode;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel;
import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.RectangleCollisionPointUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Node;

class SelectionTool implements GraphicItemInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final canvasJPanel : CanvasJPanel;
    private var active : Bool = true;
    public function new(canvasJPanel : CanvasJPanel) {
        this.canvasJPanel = canvasJPanel;
    }

    public function setColor(color : Color) : Void {
    }

    public function getTreeNode() : MutableTreeNode {
        return null;
    }

    public function getPointsInterface() : Points {
        return null;
    }

    public function setPointsInterface(points : Points) : Void {
    }

    public function isValid() : Bool {
        return true;
    }

    public function isActive() : Bool {
        return this.active;
    }

    public function deactivate() : Void {
    }

    public function activate() : Void {
    }

    public function setFulcrumPoint(point : GPoint) : Void {
    }

    // throws Exception
    public function translate(x : Int, y : Int) : Void {
    }

    public function setRotate(theta : Float) : Void {
    }

    public function addRotate(theta : Float) : Void {
    }

    public function setAngle(angle : Float) : Void {
    }

    public function addAngle(angle : Float) : Void {
    }

    public function getAngle() : Float {
        return 0.0;
    }

    private var controlIdDown : Bool = false;
    private function makeSelection() : Void {
        var xRect : Int = this.getXRect();
        var xRect2 : Int = Math.abs(this.endPoint.getX() - this.startPoint.getX()) + xRect;
        var yRect : Int = this.getYRect();
        var yRect2 : Int = Math.abs(this.endPoint.getY() - this.startPoint.getY()) + yRect;
        var hashMap : HashMap = this.canvasJPanel.getGraphicItemHashMap();
        final graphicItemArray : haxe.ds.Vector<Any> = hashMap.keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast hashMap.get(graphicItemArray[index]) : GraphicItemInterface);
            if (item.getName() == LinesGraphicItem.getStaticName()) {
                if (RectangleCollisionPointUtil.allPointsInsideCell(xRect, yRect, xRect2, yRect2, item.getPointsInterface().getPoints(), this.canvasJPanel.getXPixelsPerWorkAreaPixel(), this.canvasJPanel.getYPixelsPerWorkAreaPixel())) {
                    item.setColor(Color.YELLOW);
                    item.activate();
                } else if (!this.controlIdDown) {
                    item.setColor(Color.WHITE);
                    item.deactivate();
                }
            }
        }
    }

    private final rectColor : Color = new Color(Std.int(BasicColorFactory.getInstance().RED));
    public function getXRect() : Int {
        var xDiff : Int = this.endPoint.getX() - this.startPoint.getX();
        var xRect : Int = this.startPoint.getX();
        if (xDiff < 0) {
            xRect = this.endPoint.getX();
        }
        return xRect;
    }

    public function getYRect() : Int {
        var yDiff : Int = this.endPoint.getY() - this.startPoint.getY();
        var yRect : Int = this.startPoint.getY();
        if (yDiff < 0) {
            yRect = this.endPoint.getY();
        }
        return yRect;
    }

    public function paint(g : Graphics, canvasAngle : Null<Float>, dimension : IntegerDimension, x : Int, y : Int) : Void {
        g.setColor(this.rectColor);
        var xRect : Int = this.getXRect();
        var width : Int = Math.abs(this.endPoint.getX() - this.startPoint.getX());
        var yRect : Int = this.getYRect();
        var height : Int = Math.abs(this.endPoint.getY() - this.startPoint.getY());
        g.drawRect(xRect, yRect, width, height);
    }

    // throws Exception
    public function toDom(canvasDom : CanvasDom) : Node {
        return null;
    }

    public function removePoint() : GPoint {
        return null;
    }

    public function addPoint(point : GPoint) : Void {
    }

    private static final NAME : String = "Selection Tool";
    public function getName() : String {
        return SelectionTool.NAME;
    }

    public static function getStaticName() : String {
        return SelectionTool.NAME;
    }

    private var startPoint : GPoint = PointFactory.getInstance().ZERO_ZERO;
    private var endPoint : GPoint = this.startPoint;
    public function mouseClicked(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
    }

    public function mouseMoved(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
    }

    public function mouseEntered(mouseEvent : java.awt.event.MouseEvent) : Void {
    }

    public function mouseExited(mouseEvent : java.awt.event.MouseEvent) : Void {
    }

    public function mousePressed(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
        this.logUtil.putF(this.commonStrings.START, this, MouseStrings.getInstance().MOUSE_PRESSED);
        this.startPoint = PointFactory.getInstance().createXY(mouseEvent.getX(), mouseEvent.getY());
        this.endPoint = this.startPoint;
    }

    public function mouseReleased(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
        this.logUtil.putF(this.commonStrings.START, this, MouseStrings.getInstance().MOUSE_RELEASED);
        this.endPoint = PointFactory.getInstance().createXY(mouseEvent.getX(), mouseEvent.getY());
        this.active = false;
        this.makeSelection();
    }

    public function mouseDragged(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
        this.endPoint = PointFactory.getInstance().createXY(mouseEvent.getX(), mouseEvent.getY());
    }

    public function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void {
        if (keyEvent.getKeyCode() == keyEvent.VK_CONTROL) {
            this.controlIdDown = true;
        }
    }

    public function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void {
        if (keyEvent.getKeyCode() == keyEvent.VK_CONTROL) {
            this.controlIdDown = false;
        }
    }

    public function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    // throws Exception
    public function duplicate() : GraphicItemInterface {
        return null;
    }

}

