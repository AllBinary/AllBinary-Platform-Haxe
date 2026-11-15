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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.swing.tree.DefaultMutableTreeNode;
//import javax.swing.tree.MutableTreeNode;
import org.allbinary.dom.DomHelper;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.j2me.StatusFactory;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom;
import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension;
import org.allbinary.graphics.pipeline.BasicGraphicsPipeline;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class LinesGraphicItem implements GraphicItemInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    private var treeNode : DefaultMutableTreeNode = null;
    private var pointTreeNodeVector : BasicArrayList = null;
    private var currentMousePoint : GPoint = null;
    private var fulcrumPoint : GPoint = null;
    private var active : Bool = false;
    private var theta : Float = 0.0;
    private static final RECT : String = "rect";
    private static final ARC : String = "arc";
    private static final STRING : String = "string";
    private static final CHAR : String = "char";
    private static final IMAGE : String = "image";
    private static var item : Int = 0;
    private var color : Color = new Color(Std.int(BasicColorFactory.getInstance().WHITE));
    private var points : Points;
    public function new() {
        this.points = new Points();
        try {
            this.init();
            this.active = true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(linesNode : Node) {
        this.points = new Points();
        this.init();
        this.active = false;
        var lineNodes : BasicArrayList = DomHelper.getInstance().getWithoutTextNodes(linesNode.getChildNodes());
        var numberOfLines : Int = lineNodes.size();
        for (index in 0...numberOfLines) {
            var lineNode : Node = (cast lineNodes.get(index) : Node);
            var pointNodes : BasicArrayList = DomHelper.getInstance().getWithoutTextNodes(lineNode.getChildNodes());
            var pointOneNode : Node = DomHelper.getInstance().searchNodeList(PointsDomUtil.getInstance().POINTONE, pointNodes);
            this.addPoint(pointOneNode.getChildNodes());
            if (index == numberOfLines - 1) {
                var pointTwoNode : Node = DomHelper.getInstance().searchNodeList(PointsDomUtil.getInstance().POINTTWO, pointNodes);
                this.addPoint(pointTwoNode.getChildNodes());
            }
        }
        if (numberOfLines == 0) {
            throw new haxe.Exception("Lines node does not contain a line");
        }
    }

    // throws Exception
    public function init() : Void {
        this.treeNode = new DefaultMutableTreeNode(PointsDomUtil.getInstance().LINES + LinesGraphicItem.item);
        LinesGraphicItem.item++;
        this.points.init();
        this.pointTreeNodeVector = new BasicArrayListD();
        this.fulcrumPoint = PointFactory.getInstance().createXY(0, 0);
    }

    // throws Exception
    public function translate(x : Int, y : Int) : Void {
        StatusFactory.getInstance().setStatus("Translating: " + this.points.getPoints());
        var basicGraphicsPipeline : BasicGraphicsPipeline = new BasicGraphicsPipeline(this.points.getPoints());
        basicGraphicsPipeline.translate(x, y);
        this.points = new Points();
        this.points.addPoints(basicGraphicsPipeline.getMatrix());
    }

    public function setRotate(theta : Float) : Void {
        while (theta > 2 * Math.PI) {
            theta -= 2 * Math.PI;
        }
        while (theta < 0.0) {
            theta += 2 * Math.PI;
        }
        this.theta = theta;
    }

    public function addRotate(theta : Float) : Void {
        this.setRotate(this.theta + theta);
    }

    public function setAngle(angle : Float) : Void {
        this.setRotate(((angle) * Math.PI / 180));
    }

    public function addAngle(angle : Float) : Void {
        this.setRotate(this.theta + ((angle) * Math.PI / 180));
    }

    public function getTreeNode() : MutableTreeNode {
        return (cast this.treeNode : MutableTreeNode);
    }

    private static final NAME : String = "Line Tool";
    public function getName() : String {
        return LinesGraphicItem.NAME;
    }

    public static function getStaticName() : String {
        return LinesGraphicItem.NAME;
    }

    // throws Exception
    // synchronized
    private function addPoint(pointNodes : NodeList) : Void {
        var list : BasicArrayList = DomHelper.getInstance().getWithoutTextNodes(pointNodes);
        var xNode : Node = DomHelper.getInstance().searchNodeList(PositionStrings.getInstance().X, list);
        var xTextNode : Node = xNode.getFirstChild();
        var xInteger : Null<Int> = xTextNode.getNodeValue();
        var yNode : Node = DomHelper.getInstance().searchNodeList(PositionStrings.getInstance().Y, list);
        var yTextNode : Node = yNode.getFirstChild();
        var yInteger : Null<Int> = yTextNode.getNodeValue();
        var point : GPoint = PointFactory.getInstance().createXY(Std.int(xInteger), Std.int(yInteger));
        this.addPoint(point);
    }

    // synchronized
    public function addPoint(point : GPoint) : Void {
        this.points.getPoints().add(point);
        this.logUtil.putF(point.toString(), this, "addPoint");
        this.pointTreeNodeVector.add(new DefaultMutableTreeNode(point.toString()));
        this.treeNode.add((cast this.pointTreeNodeVector.get(this.pointTreeNodeVector.size() - 1) : DefaultMutableTreeNode));
    }

    // synchronized
    public function removePoint() : GPoint {
        var point : GPoint = null;
        if (this.points.getSize() > 0) {
            var lastPoint : Int = this.points.getSize() - 1;
            point = (cast this.points.getPoints().removeAt(lastPoint) : GPoint);
            var index : Int = this.pointTreeNodeVector.size() - 1;
            if (index > 0) {
                this.treeNode.remove((cast this.pointTreeNodeVector.get(index) : DefaultMutableTreeNode));
                this.pointTreeNodeVector.remove(index);
            }
        }
        return point;
    }

    public function isActive() : Bool {
        return this.active;
    }

    public function deactivate() : Void {
        this.active = false;
    }

    public function activate() : Void {
        this.active = true;
    }

    // throws Exception
    public function duplicatePoints(list : BasicArrayList) : Void {
        var size : Int = list.size();
        for (index in 0...size) {
            var point : GPoint = (cast list.get(index) : GPoint);
            if (point != null) {
                this.points.getPoints().add(PointFactory.getInstance().createXY(point.getX(), point.getY()));
                this.pointTreeNodeVector.add(new DefaultMutableTreeNode(point.toString()));
                this.treeNode.add((cast this.pointTreeNodeVector.get(this.pointTreeNodeVector.size() - 1) : DefaultMutableTreeNode));
            }
        }
    }

    // throws Exception
    public function duplicate() : GraphicItemInterface {
        var linesGraphicItem : LinesGraphicItem = new LinesGraphicItem();
        linesGraphicItem.duplicatePoints(this.points.getPoints());
        linesGraphicItem.deactivate();
        return linesGraphicItem;
    }

    public function getAngle() : Float {
        return ((this.theta) * 180 / Math.PI);
    }

    public function setFulcrumPoint(point : GPoint) : Void {
        this.fulcrumPoint = point;
    }

    public function paint(g : Graphics, canvasAngle : Null<Float>, dimension : IntegerDimension, x : Int, y : Int) : Void {
        try {
            var graphics : Graphics2D = (cast g : Graphics2D);
            graphics.setColor(getColor());
            graphics.setStroke(new BasicStroke(x));
            if (this.isActive() && this.currentMousePoint != null) {
                this.points.getPoints().add(this.currentMousePoint);
            }
            var tempPointVector : BasicArrayList = PointsUtil.getInstance().doTransforms(this.points.getPoints(), canvasAngle, PointFactory.getInstance().createXY(dimension.getWidth(), dimension.getHeight()));
            if (this.isActive() && this.currentMousePoint != null) {
                this.currentMousePoint = (cast this.points.getPoints().removeAt(this.points.getSize() - 1) : GPoint);
            }
            var size : Int = tempPointVector.size();
            var firstPoint : GPoint = null;
            if (size > 0) {
                firstPoint = (cast tempPointVector.get(0) : GPoint);
            }
            for (index in 1...size) {
                var secondPoint : GPoint = (cast tempPointVector.get(index) : GPoint);
                graphics.drawLine((firstPoint.getX() * x) - (Std.int(x / 4)), (firstPoint.getY() * y) - (Std.int(y / 4)), (secondPoint.getX() * x) - (Std.int(x / 4)), (secondPoint.getY() * y) - (Std.int(y / 4)));
                firstPoint = secondPoint;
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "mouseMoved", e);
        }
    }

    // throws Exception
    public function toDom(canvasDom : CanvasDom) : Node {
        return PointsDomUtil.getInstance().toDom(canvasDom, this.points.getPoints());
    }

    public function isValid() : Bool {
        return this.points.isValid();
    }

    public function getPointsInterface() : Points {
        return this.points;
    }

    public function setPointsInterface(points : Points) : Void {
        this.points = points;
    }

    public function getColor() : Color {
        return this.color;
    }

    public function setColor(color : Color) : Void {
        this.color = color;
    }

    public function mouseClicked(mouseEvent : java.awt.event.MouseEvent, x : Int, y : Int) : Void {
        try {
            var mousePoint : GPoint = PointFactory.getInstance().createXY(mouseEvent.getPoint().x, mouseEvent.getPoint().y);
            if ((mouseEvent.getModifiers() & mouseEvent.BUTTON1_MASK) == mouseEvent.BUTTON1_MASK) {
                var point : GPoint = PointFactory.getInstance().createXY(mousePoint.getX() / x, mousePoint.getY() / y);
                StatusFactory.getInstance().setStatus("Line Point Added: " + point.toString());
                this.addPoint(point);
            } else if ((mouseEvent.getModifiers() & mouseEvent.BUTTON3_MASK) == mouseEvent.BUTTON3_MASK) {
                StatusFactory.getInstance().setStatus("Line Point Removed");
                this.removePoint();
            }
            this.currentMousePoint = mousePoint;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "mouseMoved", e);
        }
    }

    public function mouseEntered(mouseEvent : java.awt.event.MouseEvent) : Void {
    }

    public function mouseExited(mouseEvent : java.awt.event.MouseEvent) : Void {
    }

    public function mousePressed(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
    }

    public function mouseReleased(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
    }

    public function mouseDragged(mouseEvent : java.awt.event.MouseEvent, xPixelsPerCell : Int, yPixelsPerCell : Int) : Void {
    }

    public function mouseMoved(mouseEvent : java.awt.event.MouseEvent, x : Int, y : Int) : Void {
        try {
            var mousePoint : GPoint = PointFactory.getInstance().createXY(mouseEvent.getPoint().x, mouseEvent.getPoint().y);
            var point : GPoint = PointFactory.getInstance().createXY(mousePoint.getX() / x, mousePoint.getY() / y);
            this.currentMousePoint = point;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "mouseMoved", e);
        }
    }

    public function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void {
        try {
            var keyCode : Int = keyEvent.getKeyCode();
            if (keyCode == keyEvent.VK_ESCAPE) {
                StatusFactory.getInstance().setStatus("Deactivated");
                this.deactivate();
            } else if (keyCode == keyEvent.VK_UP) {
                this.translate(0, -1);
            } else if (keyCode == keyEvent.VK_DOWN) {
                this.translate(0, 1);
            } else if (keyCode == keyEvent.VK_LEFT) {
                this.translate(-1, 0);
            } else if (keyCode == keyEvent.VK_RIGHT) {
                this.translate(1, 0);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, gameInputStrings.KEY_PRESSED, e);
        }
    }

    public function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void {
    }

}

