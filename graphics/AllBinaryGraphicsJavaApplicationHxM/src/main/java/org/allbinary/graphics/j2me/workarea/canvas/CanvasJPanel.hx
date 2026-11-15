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

//import java.awt.*;
//import java.util.HashMap;
//import javax.swing.tree.DefaultMutableTreeNode;
//import javax.swing.tree.MutableTreeNode;
import org.allbinary.animation.VectorExplosionGenerator;
import org.allbinary.animation.VectorMirrorGenerator;
import org.allbinary.animation.vector.VectorCenterGenerator;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.j2me.GraphicsException;
import org.allbinary.graphics.j2me.StatusFactory;
import org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel;
import org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory;
import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface;
import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem;
import org.allbinary.graphics.j2me.workarea.tools.MouseStrings;
import org.allbinary.graphics.j2me.workarea.tools.Points;
import org.allbinary.graphics.j2me.workarea.tools.ToolFactory;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventListener;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService;
import org.allbinary.graphics.pipeline.RandomRotationFactory;
import org.allbinary.log.LOGGING;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.GuiLog;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Node;

class CanvasJPanel extends javax.swing.JPanel implements java.awt.event.MouseListener implements java.awt.event.MouseMotionListener implements java.awt.event.KeyListener implements MyGraphicItemEventListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var frame : Int = 0;
    private final guiLog : GuiLog = GuiLog.getInstance();
    private final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    private var selectedTool : GraphicItemInterface = null;
    private var graphicItemHashMap : HashMap = null;
    private var canvasDimension : IntegerDimension = null;
    private var angle : Float = 0.0;
    private var canvasTreeNode : DefaultMutableTreeNode = null;
    private var frameLabel : CanvasTreeLabel = null;
    private var workAreaJTreeJPanel : WorkAreaJTreeJPanel = null;
    private static final gridColor : Color = new Color(Std.int(BasicColorFactory.getInstance().WHITE));
    private static final backgroundColor : Color = new Color(Std.int(BasicColorFactory.getInstance().CLEAR_COLOR));
    private final grid : Grid;
    public function new(workAreaJTreeJPanel : WorkAreaJTreeJPanel, dimension : Dimension, x : Int, y : Int) {
        super();
        this.grid = new Grid();
        try {
            this.workAreaJTreeJPanel = workAreaJTreeJPanel;
            this.initComponents();
            this.initMyComponents();
            this.setSize(dimension);
            this.setCanvasSize(x, y);
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.GRAPHICSCREATION)) {
                this.guiLog.put("Constructor Error", this, "contructor", e);
            }
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(workAreaJTreeJPanel : WorkAreaJTreeJPanel, dimension : Dimension, canvasDom : CanvasDom) {
        super();
        this.grid = new Grid(canvasDom.getGrid());
        try {
            this.workAreaJTreeJPanel = workAreaJTreeJPanel;
            this.initComponents();
            this.initMyComponents();
            this.setSize(dimension);
            this.setCanvasSize(canvasDom.getDimension().getWidth(), canvasDom.getDimension().getHeight());
            this.graphicItemHashMap = canvasDom.getGraphicItemHashMap();
            final graphicItemArray : haxe.ds.Vector<Any> = this.graphicItemHashMap.keySet().toArray();
            final size : Int = graphicItemArray.length;
            for (index in 0...size) {
                var graphicItemTreeNode : MutableTreeNode = (cast graphicItemArray[index] : MutableTreeNode);
                this.canvasTreeNode.add(graphicItemTreeNode);
            }
            this.repaint();
            this.setAngle(canvasDom.getAngle());
            this.workAreaJTreeJPanel.updateTree();
            this.workAreaJTreeJPanel.expand();
            this.workAreaJTreeJPanel.repaint();
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.GRAPHICSCREATION)) {
                this.guiLog.put("Constructor Error", this, "contructor", e);
            }
        }
    }

    // throws Exception
    private function initMyComponents() : Void {
        this.frameLabel = new CanvasTreeLabel("FrameLabel" + CanvasJPanel.frame.toString());
        this.canvasTreeNode = new DefaultMutableTreeNode(this.frameLabel);
        CanvasJPanel.frame++;
        this.workAreaJTreeJPanel.add(this.getTreeNode());
        this.graphicItemHashMap = StdUtil.getInstance().createHashMap();
        this.grid.grid = PointFactory.getInstance().createXY(0, 0);
        this.setCanvasDimension(new IntegerDimension(0, 0));
        this.selectedTool = null;
        this.addKeyListener(this);
        this.addMouseListener(this);
        this.addMouseMotionListener(this);
        MyGraphicItemEventService.addListener(this);
    }

    public function getTreeNode() : MutableTreeNode {
        return this.canvasTreeNode;
    }

    private function initComponents() : Void {
        setLayout(new java.awt.GridLayout(1, 1));
    }

    // throws Exception
    public function setCanvasSize(x : Int, y : Int) : Void {
        this.grid.isGridPossible = true;
        if (x <= 0) {
            this.grid.isGridPossible = false;
            throw new GraphicsException("X Size Error: " + x, this, "setWorkAreaSize");
        }
        if (y <= 0) {
            this.grid.isGridPossible = false;
            throw new GraphicsException("Y Size Error: " + y, this, "setWorkAreaSize");
        }
        if (x > this.getWidth()) {
            this.grid.isGridPossible = false;
        }
        if (y > this.getHeight()) {
            this.grid.isGridPossible = false;
        }
        this.setCanvasDimension(new IntegerDimension(x, y));
        this.grid.isChanged = true;
    }

    public function setGrid(point : GPoint) : Void {
        this.setGrid(point.getX(), point.getY());
    }

    public function setGrid(xSize : Int, ySize : Int) : Void {
        try {
            if (xSize >= getCanvasDimension().getWidth() / 2 || xSize < 1) {
                throw new GraphicsException("X Size Error: " + xSize + " WorkArea X: " + getCanvasDimension().getWidth(), this, "setGrid");
            }
            if (ySize >= getCanvasDimension().getHeight() / 2 || ySize < 1) {
                throw new GraphicsException("Y Size Error" + ySize + " WorkArea Y: " + getCanvasDimension().getHeight(), this, "setGrid");
            }
            this.grid.grid = PointFactory.getInstance().createXY(xSize, ySize);
            this.grid.isChanged = true;
        } catch (e : haxe.Exception) {
        }
    }

    // throws Exception
    public function setDefaultGrid() : Void {
        var xPixelsPerWorkAreaPixel : Int = this.getWidth() / this.getCanvasDimension().getWidth();
        var yPixelsPerWorkAreaPixel : Int = this.getHeight() / this.getCanvasDimension().getHeight();
        this.setGrid(1, 1);
        this.grid.isChanged = true;
    }

    public function getAngle() : Float {
        return this.angle;
    }

    public function setAngle(angle : Float) : Void {
        this.angle = angle;
    }

    public function addAngle(angle : Float) : Void {
        this.setAngle(this.angle + angle);
    }

    public function explodeAll() : Void {
        var newPoints : BasicArrayList = new BasicArrayListD();
        final graphicItemArray : haxe.ds.Vector<Any> = this.getGraphicItemHashMap().keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var graphicItemNode : MutableTreeNode = (cast graphicItemArray[index] : MutableTreeNode);
            var graphicItem : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(graphicItemNode) : GraphicItemInterface);
            if (graphicItem.getName() == LinesGraphicItem.getStaticName()) {
                while (graphicItem.getPointsInterface().getSize() > 2) {
                    var newGraphicItem : GraphicItemInterface = GraphicItemFactory.getInstance().getInstance(graphicItem.getName()).getInstance(this);
                    var pointOne : GPoint = GPoint.getInstance(graphicItem.removePoint());
                    var pointTwo : GPoint = GPoint.getInstance(graphicItem.removePoint());
                    if (pointOne != null && pointTwo != null) {
                        newGraphicItem.addPoint(pointOne);
                        newGraphicItem.addPoint(pointTwo);
                    }
                    newPoints.add(newGraphicItem);
                }
            }
        }
        final size2 : Int = newPoints.size();
        for (index in 0...size2) {
            var newGraphicItem : GraphicItemInterface = (cast newPoints.get(index) : GraphicItemInterface);
            this.canvasTreeNode.add(newGraphicItem.getTreeNode());
            this.getGraphicItemHashMap().put(newGraphicItem.getTreeNode(), newGraphicItem);
        }
        this.workAreaJTreeJPanel.updateTree();
        this.workAreaJTreeJPanel.expand();
        this.workAreaJTreeJPanel.repaint();
    }

    // throws Exception
    public function explode(howMuch : Int, explosionType : Int) : Void {
        final graphicItemArray : haxe.ds.Vector<Any> = this.getGraphicItemHashMap().keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(graphicItemArray[index]) : GraphicItemInterface);
            var basicArrayList : BasicArrayList = VectorExplosionGenerator.getInstance().createList(item.getPointsInterface().getPoints(), howMuch, VectorExplosionGenerator.getInstance().RANDOM);
            var newPoints : Points = new Points();
            newPoints.addPoints(basicArrayList);
            item.setPointsInterface(newPoints);
            var angleDelta : Int = RandomRotationFactory.getInstance().getNextRandomAngle(howMuch);
            item.setAngle(angleDelta);
        }
        this.repaint();
    }

    // throws Exception
    public function mirror() : Void {
        var width : Int = this.getCanvasDimension().getWidth();
        final graphicItemArray : haxe.ds.Vector<Any> = this.getGraphicItemHashMap().keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(graphicItemArray[index]) : GraphicItemInterface);
            var basicArrayList : BasicArrayList = VectorMirrorGenerator.getInstance().getInstance(item.getPointsInterface().getPoints(), width);
            var newPoints : Points = new Points();
            newPoints.addPoints(basicArrayList);
            item.setPointsInterface(newPoints);
        }
        this.repaint();
    }

    // throws Exception
    public function center() : Void {
        new VectorCenterGenerator().transform(this.getGraphicItemHashMap());
        this.repaint();
    }

    public function setNewTool() : Void {
        try {
            StatusFactory.getInstance().setStatus("Tool Selected");
            this.selectedTool = ToolFactory.getInstance().getSelectedToolFactory().getInstance(this);
            var newNode : MutableTreeNode = this.selectedTool.getTreeNode();
            this.getGraphicItemHashMap().put(newNode, this.selectedTool);
            this.canvasTreeNode.add(newNode);
            if (this.getSelectedTool() == null) {
                throw new GraphicsException("No Tool Selected", this, "setSelectedTool");
            }
        } catch (e : haxe.Exception) {
        }
    }

    // throws Exception
    public function duplicateGraphicItem(graphicItem : GraphicItemInterface) : Void {
        var graphicItemClone : GraphicItemInterface = graphicItem.duplicate();
        this.getGraphicItemHashMap().put(graphicItemClone.getTreeNode(), graphicItemClone);
        this.canvasTreeNode.add(graphicItemClone.getTreeNode());
    }

    // throws Exception
    public function duplicateGraphicItemHashMap(hashMap : HashMap) : Void {
        final mutableTreeNodeArray : haxe.ds.Vector<Any> = hashMap.keySet().toArray();
        final size : Int = mutableTreeNodeArray.length;
        for (index in 0...size) {
            var treeNode : MutableTreeNode = (cast mutableTreeNodeArray[index] : MutableTreeNode);
            var graphicItem : GraphicItemInterface = (cast hashMap.get(treeNode) : GraphicItemInterface);
            this.duplicateGraphicItem(graphicItem);
        }
    }

    public function getGraphicItemHashMap() : HashMap {
        return this.graphicItemHashMap;
    }

    public function getXPixelsPerWorkAreaPixel() : Int {
        var x : Int = this.getGrid().grid.getX() * (this.getWidth() - 10) / this.getCanvasDimension().getWidth();
        if (this.getGrid().getZoom() == 1) {
            return 1;
        } else {
            return x;
        }
    }

    public function getYPixelsPerWorkAreaPixel() : Int {
        var y : Int = this.getGrid().grid.getY() * (this.getHeight() - 10) / this.getCanvasDimension().getHeight();
        if (this.getGrid().getZoom() == 1) {
            return 1;
        } else {
            return y;
        }
    }

    public function getSelectedTool() : GraphicItemInterface {
        return this.selectedTool;
    }

    public function drawItems(graphics : Graphics) : Void {
        var angleDouble : Null<Float> = this.angle;
        final graphicItemArray : haxe.ds.Vector<Any> = this.getGraphicItemHashMap().keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(graphicItemArray[index]) : GraphicItemInterface);
            item.paint(graphics, angleDouble, this.getCanvasDimension(), this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        }
    }

    public function drawGrid(graphics : Graphics) : Void {
        var xAdjust : Int = (this.getWidth() % this.getXPixelsPerWorkAreaPixel()) / 2;
        var yAdjust : Int = (this.getHeight() % this.getYPixelsPerWorkAreaPixel()) / 2;
        var xLeft : Int = xAdjust;
        var yUpper : Int = yAdjust;
        var xRight : Int = this.getWidth() - xAdjust;
        var yLower : Int = this.getHeight() - yAdjust;
        graphics.setColor(CanvasJPanel.gridColor);
        {
            var value : Int = yAdjust;
            while (value <= this.getHeight() - yAdjust) {
            graphics.drawLine(xLeft, value, xRight, value);
                value += this.getYPixelsPerWorkAreaPixel();
            }
        }
        {
            var value : Int = xAdjust;
            while (value <= this.getWidth() - xAdjust) {
            graphics.drawLine(value, yUpper, value, yLower);
                value += this.getYPixelsPerWorkAreaPixel();
            }
        }
    }

    public function paint(graphics : Graphics) : Void {
        try {
            if (this.getGrid().isChanged) {
                graphics.setColor(CanvasJPanel.backgroundColor);
                graphics.fillRect(0, 0, getWidth(), getHeight());
                if (this.getGrid().getZoom() > 2 && this.getGrid().isGridOn && this.getGrid().isGridPossible) {
                    this.setDefaultGrid();
                    this.drawGrid(graphics);
                }
                this.drawItems(graphics);
                graphics.drawString(this.getAngle().toString(), this.getWidth() - 75, this.getHeight() - 15);
                this.grid.isChanged = false;
            }
        } catch (e : haxe.Exception) {
        }
    }

    public function repaint() : Void {
        if (this.grid != null) {
            this.grid.isChanged = true;
        }
        super.repaint();
    }

    // throws Exception
    public function toDom() : Node {
        return new CanvasDom(this).toDom();
    }

    public function changed() : Void {
        this.grid.isChanged = true;
    }

    public function mouseClicked(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(MouseStrings.getInstance().MOUSE_CLICKED_LABEL + this.logMouseEvent(mouseEvent));
        if (this.getSelectedTool() != null && this.getSelectedTool().isActive()) {
            var graphicItem : GraphicItemInterface = this.getSelectedTool();
            graphicItem.mouseClicked(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        } else {
            this.setNewTool();
            var graphicItem : GraphicItemInterface = this.getSelectedTool();
            if (graphicItem != null) {
                graphicItem.mouseClicked(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
            }
        }
        this.grid.isChanged = true;
        this.repaint();
        this.workAreaJTreeJPanel.updateTree();
        this.workAreaJTreeJPanel.expand();
        this.workAreaJTreeJPanel.repaint();
    }

    public function mouseEntered(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(this.logMouseEvent(mouseEvent));
    }

    public function mouseExited(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(this.logMouseEvent(mouseEvent));
    }

    public function mousePressed(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(MouseStrings.getInstance().MOUSE_PRESSED_LABEL + this.logMouseEvent(mouseEvent));
        if (this.getSelectedTool() != null) {
            var graphicItem : GraphicItemInterface = this.getSelectedTool();
            graphicItem.mousePressed(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        }
        this.requestFocus();
        this.grid.isChanged = true;
        this.repaint();
    }

    public function mouseReleased(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(MouseStrings.getInstance().MOUSE_RELEASED_LABEL + this.logMouseEvent(mouseEvent));
        var graphicItem : GraphicItemInterface = this.getSelectedTool();
        if (graphicItem != null) {
            graphicItem.mouseReleased(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        }
        this.requestFocus();
        this.grid.isChanged = true;
        this.repaint();
    }

    public function mouseDragged(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(MouseStrings.getInstance().MOUSE_DRAGGED_LABEL + this.logMouseEvent(mouseEvent));
        var graphicItem : GraphicItemInterface = this.getSelectedTool();
        if (graphicItem != null) {
            graphicItem.mouseDragged(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        }
        this.requestFocus();
        this.grid.isChanged = true;
        this.repaint();
    }

    public function mouseMoved(mouseEvent : java.awt.event.MouseEvent) : Void {
        StatusFactory.getInstance().setStatusNoLog(MouseStrings.getInstance().MOUSE_MOVED_LABEL + this.logMouseEvent(mouseEvent));
        if (this.getSelectedTool() != null && this.getSelectedTool().isActive()) {
            var graphicItem : GraphicItemInterface = this.getSelectedTool();
            graphicItem.mouseMoved(mouseEvent, this.getXPixelsPerWorkAreaPixel(), this.getYPixelsPerWorkAreaPixel());
        }
        this.requestFocus();
        this.grid.isChanged = true;
        this.repaint();
    }

    private function logMouseEvent(mouseEvent : java.awt.event.MouseEvent) : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(PositionStrings.getInstance().X_LABEL);
        stringBuffer.appendint(Std.int(mouseEvent.getX() / this.getXPixelsPerWorkAreaPixel()));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(PositionStrings.getInstance().Y_LABEL);
        stringBuffer.appendint(Std.int(mouseEvent.getY() / this.getYPixelsPerWorkAreaPixel()));
        return stringBuffer.toString();
    }

    public function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void {
        StatusFactory.getInstance().setStatus("Key Pressed");
        try {
            final graphicItemArray : haxe.ds.Vector<Any> = this.graphicItemHashMap.keySet().toArray();
            final size : Int = graphicItemArray.length;
            for (index in 0...size) {
                var graphicItemInterface : GraphicItemInterface = (cast this.graphicItemHashMap.get(graphicItemArray[index]) : GraphicItemInterface);
                var keyCode : Int = keyEvent.getKeyCode();
                if (graphicItemInterface.isActive()) {
                    if (keyCode == keyEvent.VK_UP) {
                        graphicItemInterface.translate(0, -1);
                    } else if (keyCode == keyEvent.VK_DOWN) {
                        graphicItemInterface.translate(0, 1);
                    } else if (keyCode == keyEvent.VK_LEFT) {
                        graphicItemInterface.translate(-1, 0);
                    } else if (keyCode == keyEvent.VK_RIGHT) {
                        graphicItemInterface.translate(1, 0);
                    }
                }
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, this.gameInputStrings.KEY_PRESSED, e);
        }
        if (this.getSelectedTool() != null && this.getSelectedTool().isActive()) {
            StatusFactory.getInstance().setStatus("Key Pressed for Tool");
            var graphicItem : GraphicItemInterface = this.getSelectedTool();
            graphicItem.keyPressed(keyEvent);
        } else {
            this.setNewTool();
        }
        this.grid.isChanged = true;
        this.repaint();
    }

    public function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function delete(evt : MyGraphicItemEvent) : Void {
        this.getGraphicItemHashMap().remove(evt.getTreeNode());
        this.workAreaJTreeJPanel.updateTree();
        this.workAreaJTreeJPanel.expand();
        this.workAreaJTreeJPanel.repaint();
    }

    public function deselect(evt : MyGraphicItemEvent) : Void {
        var graphicItemInterface : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(evt.getTreeNode()) : GraphicItemInterface);
        if (graphicItemInterface != null) {
            graphicItemInterface.setColor(Color.WHITE);
            graphicItemInterface.deactivate();
            this.workAreaJTreeJPanel.repaint();
        }
    }

    public function highlight(evt : MyGraphicItemEvent) : Void {
        var graphicItemInterface : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(evt.getTreeNode()) : GraphicItemInterface);
        if (graphicItemInterface != null) {
            graphicItemInterface.setColor(Color.YELLOW);
            graphicItemInterface.activate();
            this.workAreaJTreeJPanel.repaint();
        }
    }

    // throws Exception
    public function duplicate() : CanvasJPanel {
        var newCanvasJPanel : CanvasJPanel = new CanvasJPanel(this.workAreaJTreeJPanel, this.getSize(), this.getCanvasDimension().getWidth(), this.getCanvasDimension().getHeight());
        newCanvasJPanel.setGrid(this.getGrid().getGrid());
        newCanvasJPanel.setAngle(this.getAngle());
        newCanvasJPanel.duplicateGraphicItemHashMap(this.getGraphicItemHashMap());
        this.workAreaJTreeJPanel.updateTree();
        this.workAreaJTreeJPanel.expand();
        this.workAreaJTreeJPanel.repaint();
        return newCanvasJPanel;
    }

    // throws Exception
    public function duplicate(event : MyGraphicItemEvent) : Void {
        var treeNode : MutableTreeNode = event.getTreeNode();
        var graphicItem : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(treeNode) : GraphicItemInterface);
        if (graphicItem != null) {
            this.duplicateGraphicItem(graphicItem);
            this.workAreaJTreeJPanel.updateTree();
            this.workAreaJTreeJPanel.expand();
            this.workAreaJTreeJPanel.repaint();
        }
    }

    public function rotate(event : MyGraphicItemEvent) : Void {
        var treeNode : MutableTreeNode = event.getTreeNode();
        var graphicItem : GraphicItemInterface = (cast this.getGraphicItemHashMap().get(treeNode) : GraphicItemInterface);
        if (graphicItem != null) {
            graphicItem.addAngle(event.getAngle());
        }
    }

    public function getCanvasDimension() : IntegerDimension {
        return this.canvasDimension;
    }

    public function setCanvasDimension(canvasDimension : IntegerDimension) : Void {
        this.canvasDimension = canvasDimension;
    }

    public function getGrid() : Grid {
        return this.grid;
    }

}

