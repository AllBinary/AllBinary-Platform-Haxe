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
package org.allbinary.graphics.j2me.workarea.canvas;

//import java.util.HashMap;
import org.allbinary.animation.vector.VectorCenterGenerator;
import org.allbinary.dom.DomHelper;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel;
import org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory;
import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface;
import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Node;

class CanvasDom {
    private final graphicsStrings : GraphicsStrings = GraphicsStrings.getInstance();
    public static final FRAME : String = "frame";
    public static final ROTATE : String = "rotate";
    public static final SIZE : String = "size";
    public static final X : String = "X";
    public static final Y : String = "Y";
    public static final ZOOM : String = "zoom";
    public static final GRID : String = "grid";
    public static final ENABLED : String = "enabled";
    public static final POSSIBLE : String = "possible";
    public static final GRAPHICITEMS : String = "graphicItems";
    public static final REAL_SIZE : String = "realSize";
    private var graphicItemHashMap : HashMap;
    private var angle : Float;
    private var dimension : IntegerDimension;
    private final grid : Grid;
    public function new(canvasNode : Node) {
        this.grid = new Grid();
        this.grid.grid = PointFactory.getInstance().createXY(0, 0);
        this.dimension = new IntegerDimension(0, 0);
        var name : String = canvasNode.getNodeName();
        if (Reflect.compare(name, CanvasDom.FRAME) == 0) {
            this.graphicItemHashMap = StdUtil.getInstance().createHashMap();
            var angleNode : Node = DomHelper.getInstance().searchNodeList(this.ROTATE, canvasNode.getChildNodes());
            var angleTextNode : Node = angleNode.getFirstChild();
            var angle : Float = angleTextNode.getNodeValue();
            this.setAngle(angle);
            var sizeNode : Node = DomHelper.getInstance().searchNodeList(this.SIZE, canvasNode.getChildNodes());
            var xNode : Node = DomHelper.getInstance().searchNodeList(this.X, sizeNode.getChildNodes());
            var xTextNode : Node = xNode.getFirstChild();
            var x : Int = Std.int(xTextNode.getNodeValue());
            var yNode : Node = DomHelper.getInstance().searchNodeList(this.Y, sizeNode.getChildNodes());
            var yTextNode : Node = yNode.getFirstChild();
            var y : Int = Std.int(yTextNode.getNodeValue());
            this.setWorkArea(x, y);
            var zoomNode : Node = DomHelper.getInstance().searchNodeList(this.ZOOM, canvasNode.getChildNodes());
            var zoomTextNode : Node = zoomNode.getFirstChild();
            this.grid.setZoom(Std.int(zoomTextNode.getNodeValue()));
            var gridNode : Node = DomHelper.getInstance().searchNodeList(this.GRID, canvasNode.getChildNodes());
            var gridSizeNode : Node = DomHelper.getInstance().searchNodeList(this.SIZE, gridNode.getChildNodes());
            var gridXNode : Node = DomHelper.getInstance().searchNodeList(this.X, gridSizeNode.getChildNodes());
            var gridXTextNode : Node = gridXNode.getFirstChild();
            var gridX : Int = Std.int(gridXTextNode.getNodeValue());
            var gridYNode : Node = DomHelper.getInstance().searchNodeList(this.Y, gridSizeNode.getChildNodes());
            var gridYTextNode : Node = gridYNode.getFirstChild();
            var gridY : Int = Std.int(gridYTextNode.getNodeValue());
            this.setGrid(gridX, gridY);
            var enableNode : Node = DomHelper.getInstance().searchNodeList(this.ENABLED, gridNode.getChildNodes());
            var enableTextNode : Node = enableNode.getFirstChild();
            this.grid.showGrid(enableTextNode.getNodeValue());
            var possibleNode : Node = DomHelper.getInstance().searchNodeList(this.POSSIBLE, gridNode.getChildNodes());
            var possibleTextNode : Node = possibleNode.getFirstChild();
            this.grid.isGridPossible = possibleTextNode.getNodeValue();
            var graphicItemNodeList : BasicArrayList = DomHelper.getInstance().getChildrenWithoutTextNodes(this.GRAPHICITEMS, canvasNode.getChildNodes());
            if (graphicItemNodeList != null) {
                this.graphicItemHashMap = GraphicItemFactory.getInstance().getInstance(graphicItemNodeList);
            }
        } else {
            throw new haxe.Exception("Frame Element Not Found but Found: " + name);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(canvasJPanel : CanvasJPanel) {
        this.angle = canvasJPanel.getAngle();
        this.graphicItemHashMap = canvasJPanel.getGraphicItemHashMap();
        this.dimension = canvasJPanel.getCanvasDimension();
        this.grid = new Grid(canvasJPanel.getGrid());
        this.angle = canvasJPanel.getAngle();
    }

    public function getAngle() : Float {
        return this.angle;
    }

    public function getGraphicItemHashMap() : HashMap {
        return this.graphicItemHashMap;
    }

    public function setAngle(angle : Float) : Void {
        this.angle = angle;
    }

    // throws Exception
    public function setWorkArea(x : Int, y : Int) : Void {
        this.setDimension(new IntegerDimension(x, y));
    }

    // throws Exception
    public function setGrid(gridX : Int, gridY : Int) : Void {
        this.grid.grid = PointFactory.getInstance().createXY(gridX, gridY);
    }

    private function getPointNode(point : GPoint, pointName : String) : Node {
        var document : org.w3c.dom.Document = WorkAreaJPanel.getDocument();
        var pointNode : Node = (cast document.createElement(pointName) : Node);
        var xNode : Node = (cast document.createElement(this.X) : Node);
        var xTextNode : Node = (cast document.createTextNode(Std.string(point.getX())) : Node);
        xNode.appendChild(xTextNode);
        var yNode : Node = (cast document.createElement(this.Y) : Node);
        var yTextNode : Node = (cast document.createTextNode(Std.string(point.getY())) : Node);
        yNode.appendChild(yTextNode);
        pointNode.appendChild(xNode);
        pointNode.appendChild(yNode);
        return pointNode;
    }

    // throws Exception
    public function toDom() : Node {
        var document : org.w3c.dom.Document = WorkAreaJPanel.getDocument();
        var frameNode : Node = (cast document.createElement(this.FRAME) : Node);
        var angleNode : Node = (cast document.createElement(this.ROTATE) : Node);
        var angleTextNode : Node = (cast document.createTextNode(Std.string(this.getAngle())) : Node);
        angleNode.appendChild(angleTextNode);
        var sizeNode : Node = (cast this.getPointNode(PointFactory.getInstance().createXY(this.getDimension().getWidth(), this.getDimension().getHeight()), this.SIZE) : Node);
        var zoomNode : Node = (cast document.createElement(this.ZOOM) : Node);
        var zoomTextNode : Node = (cast document.createTextNode(Std.string(this.getGrid().getZoom())) : Node);
        zoomNode.appendChild(zoomTextNode);
        var gridNode : Node = (cast document.createElement(this.GRID) : Node);
        var gridSizeNode : Node = (cast this.getPointNode(this.getGrid().grid, this.SIZE) : Node);
        gridNode.appendChild(gridSizeNode);
        var enableNode : Node = (cast document.createElement(this.ENABLED) : Node);
        var enableTextNode : Node = (cast document.createTextNode(Std.string(this.getGrid().isGridOn())) : Node);
        enableNode.appendChild(enableTextNode);
        gridNode.appendChild(enableNode);
        var possibleNode : Node = (cast document.createElement(this.POSSIBLE) : Node);
        var possibleTextNode : Node = (cast document.createTextNode(Std.string(this.getGrid().isGridPossible())) : Node);
        possibleNode.appendChild(possibleTextNode);
        gridNode.appendChild(possibleNode);
        var realSizeNode : Node = (cast document.createElement(REAL_SIZE) : Node);
        var vectorCenterGenerator : VectorCenterGenerator = new VectorCenterGenerator();
        vectorCenterGenerator.calculate(this.getGraphicItemHashMap());
        var widthNode : Node = (cast document.createElement(this.graphicsStrings.WIDTH) : Node);
        var widthTextNode : Node = (cast document.createTextNode(Std.string(vectorCenterGenerator.getWidth())) : Node);
        widthNode.appendChild(widthTextNode);
        realSizeNode.appendChild(widthNode);
        var heightNode : Node = (cast document.createElement(this.graphicsStrings.HEIGHT) : Node);
        var heightTextNode : Node = (cast document.createTextNode(Std.string(vectorCenterGenerator.getHeight())) : Node);
        heightNode.appendChild(heightTextNode);
        realSizeNode.appendChild(heightNode);
        frameNode.appendChild(angleNode);
        frameNode.appendChild(sizeNode);
        frameNode.appendChild(zoomNode);
        frameNode.appendChild(gridNode);
        frameNode.appendChild(realSizeNode);
        var graphicItemNode : Node = (cast document.createElement(this.GRAPHICITEMS) : Node);
        final graphicItemArray : haxe.ds.Vector<Any> = this.getGraphicItemHashMap().keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast this.graphicItemHashMap.get(graphicItemArray[index]) : GraphicItemInterface);
            if (item.getName() == LinesGraphicItem.getStaticName()) {
                if (item.isValid()) {
                    graphicItemNode.appendChild(item.toDom(this));
                }
            }
        }
        frameNode.appendChild(graphicItemNode);
        return frameNode;
    }

    public function getDimension() : IntegerDimension {
        return this.dimension;
    }

    public function setDimension(dimension : IntegerDimension) : Void {
        this.dimension = dimension;
    }

    public function getGrid() : Grid {
        return this.grid;
    }

}

