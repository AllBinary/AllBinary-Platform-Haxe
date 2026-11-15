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

//import java.awt.*;
//import java.util.EventListener;
//import java.util.HashMap;
//import java.util.LinkedList;
//import javax.swing.*;
//import javax.swing.tree.MutableTreeNode;
import org.allbinary.dom.DomHelper;
import org.allbinary.graphics.j2me.StatusFactory;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventListener;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService;
import org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel;
import org.allbinary.graphics.j2me.workarea.tools.ToolJPanel;
import org.allbinary.log.LOGGING;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class WorkAreaJPanel extends JPanel implements WorkAreaJPanelInterface implements MyCanvasEventListener implements EventListener implements Runnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var canvasJPanelList : LinkedList = null;
    private var canvasHolderJPanel : JPanel = null;
    private var name : String = null;
    private var selectedFrame : Int = 0;
    private static var document : org.w3c.dom.Document = null;
    private var propertiesJPanel : PropertiesJPanel = null;
    private var workAreaJTreeJPanel : WorkAreaJTreeJPanel = null;
    private var isPlaying : Bool = false;
    public function new(name : String, dimension : Dimension, x : Int, y : Int) {
        super();
        try {
            this.initComponents();
            this.name = name;
            this.initMyComponents(dimension);
            this.workAreaJTreeJPanel = new WorkAreaJTreeJPanel(this.name);
            var canvasJPanel : CanvasJPanel = new CanvasJPanel(this.workAreaJTreeJPanel, this.getSize(), x, y);
            this.canvasJPanelList.add(canvasJPanel);
            this.selectedFrame = 0;
            this.propertiesJPanel.set(this.workAreaJTreeJPanel);
            this.canvasHolderJPanel.add((cast canvasJPanel : Component));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(workAreaDom : WorkAreaDom, dimension : Dimension) {
        super();
        try {
            this.initComponents();
            this.name = workAreaDom.getName();
            this.initMyComponents(dimension);
            var canvasNodeList : BasicArrayList = workAreaDom.getCanvasNodes();
            var numberOfFrames : Int = canvasNodeList.size();
            for (index in 0...numberOfFrames) {
                var node : Node = (cast canvasNodeList.get(index) : Node);
                var canvasJPanel : CanvasJPanel = new CanvasJPanel(this.workAreaJTreeJPanel, this.getSize(), new CanvasDom(node));
                this.canvasJPanelList.add(canvasJPanel);
            }
            this.selectedFrame = 0;
            this.canvasHolderJPanel.add((cast this.getCurrentFrame() : Component));
            this.propertiesJPanel.set(this.workAreaJTreeJPanel);
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.LOADINGERROR)) {
                this.logUtil.put("Constructor Error", this, "WorkAreaJPanel", e);
            }
            throw e;
        }
    }

    private function initMyComponents(dimension : Dimension) : Void {
        this.workAreaJTreeJPanel = new WorkAreaJTreeJPanel(this.name);
        this.canvasHolderJPanel = new JPanel();
        this.canvasHolderJPanel.setSize(dimension);
        this.canvasHolderJPanel.setLayout(new GridLayout(1, 1));
        this.setSize(dimension);
        this.canvasJPanelList = new LinkedList();
        var gridBagLayout : GridBagLayout = new GridBagLayout();
        var gridBagConstraints : GridBagConstraints = new GridBagConstraints();
        this.innerJPanel.setLayout(gridBagLayout);
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.gridwidth = 1;
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH;
        gridBagConstraints.weightx = .05;
        gridBagConstraints.weighty = .05;
        var toolJPanel : ToolJPanel = new ToolJPanel();
        gridBagLayout.setConstraints(toolJPanel, gridBagConstraints);
        this.innerJPanel.add(toolJPanel);
        gridBagConstraints = new GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.gridwidth = 6;
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH;
        gridBagConstraints.weightx = 1;
        gridBagConstraints.weighty = 1;
        gridBagLayout.setConstraints(this.canvasHolderJPanel, gridBagConstraints);
        this.innerJPanel.add(this.canvasHolderJPanel);
        gridBagConstraints = new GridBagConstraints();
        gridBagConstraints.gridx = 8;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.gridwidth = java.awt.GridBagConstraints.REMAINDER;
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH;
        gridBagConstraints.weightx = .1;
        gridBagConstraints.weighty = .1;
        this.propertiesJPanel = new PropertiesJPanel();
        gridBagLayout.setConstraints(this.propertiesJPanel, gridBagConstraints);
        this.innerJPanel.add(this.propertiesJPanel);
        MyCanvasEventService.addListener((cast this : MyCanvasEventListener));
    }

    private function getCanvasHashMap() : HashMap {
        final canvasJPanelHashMap : HashMap = StdUtil.getInstance().createHashMap();
        final size : Int = this.canvasJPanelList.size();
        for (index in 0...size) {
            final canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(index) : CanvasJPanel);
            canvasJPanelHashMap.put(canvasJPanel.getTreeNode(), index);
        }
        return canvasJPanelHashMap;
    }

    // synchronized
    public function play() : Void {
        this.isPlaying = true;
    }

    // synchronized
    public function stop() : Void {
        this.isPlaying = false;
    }

    // synchronized
    public function isPlaying() : Bool {
        return this.isPlaying;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function disableCanvas() : Void {
        this.canvasHolderJPanel.removeAll();
    }

    public function enableCanvas() : Void {
        this.canvasHolderJPanel.add((cast this.getCurrentFrame() : Component));
    }

    public function deselect() : Void {
        super.setVisible(false);
    }

    public function select() : Void {
        super.setVisible(true);
        if (this.canvasHolderJPanel.getComponentCount() == 1) {
            final component : Component = this.canvasHolderJPanel.getComponent(0);
            if (component != null) {
                component.repaint();
            }
        }
    }

    public function changeZoom(factor : Int) : Void {
        final size : Int = this.canvasJPanelList.size();
        for (index in 0...size) {
            var canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(index) : CanvasJPanel);
            canvasJPanel.getGrid().setZoom(canvasJPanel.getGrid().getZoom() + factor);
        }
    }

    public function getCurrentFrame() : CanvasJPanel {
        return (cast this.canvasJPanelList.get(this.selectedFrame) : CanvasJPanel);
    }

    private function initDuplicate(newCanvasJPanel : CanvasJPanel) : Void {
        if (newCanvasJPanel != null) {
            this.canvasJPanelList.add(newCanvasJPanel);
            this.select(this.canvasJPanelList.size() - 1);
        }
    }

    // throws Exception
    private function duplicate(treeNode : MutableTreeNode) : Void {
        var canvasJPanelHashMap : HashMap = this.getCanvasHashMap();
        if (canvasJPanelHashMap.containsKey(treeNode)) {
            var frameInteger : Null<Int> = (cast canvasJPanelHashMap.get(treeNode) : Null<Int>);
            var canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(Std.int(frameInteger)) : CanvasJPanel);
            this.initDuplicate(canvasJPanel.duplicate());
        }
    }

    // throws Exception
    public function autoRotate(increments : Int, totalAngle : Int) : Void {
        var incrementAngle : Int = (Std.int(totalAngle / increments));
        for (index in 1...increments) {
            var canvasJPanel : CanvasJPanel = (cast this.getCurrentFrame() : CanvasJPanel);
            var newCanvasJPanel : CanvasJPanel = canvasJPanel.duplicate();
            newCanvasJPanel.setAngle(incrementAngle * index);
            this.initDuplicate(newCanvasJPanel);
        }
    }

    public function explodeAll() : Void {
        var canvasJPanel : CanvasJPanel = (cast this.getCurrentFrame() : CanvasJPanel);
        canvasJPanel.explodeAll();
    }

    // throws Exception
    public function autoExplode(numberOfFrames : Int, explodeType : Int) : Void {
        for (index in 1...numberOfFrames) {
            var canvasJPanel : CanvasJPanel = (cast this.getCurrentFrame() : CanvasJPanel);
            var newCanvasJPanel : CanvasJPanel = canvasJPanel.duplicate();
            newCanvasJPanel.explode(index + 1, explodeType);
            this.initDuplicate(newCanvasJPanel);
        }
    }

    // throws Exception
    public function autoMirror() : Void {
        var canvasJPanel : CanvasJPanel = (cast this.getCurrentFrame() : CanvasJPanel);
        var newCanvasJPanel : CanvasJPanel = canvasJPanel.duplicate();
        newCanvasJPanel.mirror();
        this.initDuplicate(newCanvasJPanel);
    }

    // synchronized
    private function select(index : Int) : Void {
        if (index < this.canvasJPanelList.size()) {
            var canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(index) : CanvasJPanel);
            if (canvasJPanel != null) {
                this.canvasHolderJPanel.removeAll();
                this.canvasHolderJPanel.add(canvasJPanel);
                this.selectedFrame = index;
                canvasJPanel.changed();
                this.canvasHolderJPanel.repaint();
                canvasJPanel.repaint();
            }
        }
    }

    private function select(treeNode : MutableTreeNode) : Void {
        var canvasJPanelHashMap : HashMap = this.getCanvasHashMap();
        var frameInteger : Null<Int> = (cast canvasJPanelHashMap.get(treeNode) : Null<Int>);
        if (frameInteger != null) {
            this.select(Std.int(frameInteger));
        }
    }

    public static function getDocument() : Document {
        return WorkAreaJPanel.document;
    }

    // throws Exception
    public function toDocument() : Document {
        WorkAreaJPanel.document = DomHelper.getInstance().createDocument();
        var workAreaNode : Node = WorkAreaJPanel.document.createElement(WorkAreaDom.WORKAREA);
        var nameNode : Node = WorkAreaJPanel.document.createElement(WorkAreaDom.NAME);
        var nameTextNode : Node = WorkAreaJPanel.document.createTextNode(this.name);
        nameNode.appendChild(nameTextNode);
        var framesNode : Node = WorkAreaJPanel.document.createElement(WorkAreaDom.FRAMES);
        final size : Int = this.canvasJPanelList.size();
        for (index in 0...size) {
            var canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(index) : CanvasJPanel);
            framesNode.appendChild(canvasJPanel.toDom());
        }
        workAreaNode.appendChild(nameNode);
        workAreaNode.appendChild(framesNode);
        WorkAreaJPanel.document.appendChild(workAreaNode);
        return document;
    }

    private function initComponents() : Void {
        this.innerJPanel = new javax.swing.JPanel();
        setLayout(new java.awt.GridLayout(1, 1));
        this.innerJPanel.addKeyListener(/* anonymous class body:
            public function keyTyped(evt : java.awt.event.KeyEvent) : Void {
                innerJPanelKeyTyped(evt);
            }

            public function keyPressed(evt : java.awt.event.KeyEvent) : Void {
                innerJPanelKeyPressed(evt);
            }

            public function keyReleased(evt : java.awt.event.KeyEvent) : Void {
                innerJPanelKeyReleased(evt);
            }

*/ new java.awt.event.KeyAdapter());
        add(this.innerJPanel);
    }

    private function innerJPanelKeyReleased(evt : java.awt.event.KeyEvent) : Void {
        StatusFactory.getInstance().setStatus("Key Pressed1");
    }

    private function innerJPanelKeyPressed(evt : java.awt.event.KeyEvent) : Void {
        StatusFactory.getInstance().setStatus("Key Pressed2");
    }

    private function innerJPanelKeyTyped(evt : java.awt.event.KeyEvent) : Void {
        StatusFactory.getInstance().setStatus("Key Pressed3");
    }

    public function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void {
        this.getCurrentFrame().keyPressed(keyEvent);
    }

    public function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function delete(evt : MyCanvasEvent) : Void {
        var canvasJPanelHashMap : HashMap = this.getCanvasHashMap();
        if (canvasJPanelHashMap.containsKey(evt.getTreeNode())) {
            this.canvasHolderJPanel.removeAll();
            var frameInt : Null<Int> = (cast canvasJPanelHashMap.get(evt.getTreeNode()) : Null<Int>);
            this.canvasJPanelList.remove(Std.int(frameInt));
            this.select(Std.int(frameInt));
        }
    }

    // throws Exception
    public function duplicate(evt : MyCanvasEvent) : Void {
        this.duplicate(evt.getTreeNode());
    }

    public function select(evt : MyCanvasEvent) : Void {
        this.select(evt.getTreeNode());
        StatusFactory.getInstance().setStatus("Frame Selected");
    }

    public function rotate(evt : MyCanvasEvent) : Void {
        var canvasJPanelHashMap : HashMap = this.getCanvasHashMap();
        var treeNode : MutableTreeNode = evt.getTreeNode();
        var frameInt : Null<Int> = (cast canvasJPanelHashMap.get(evt.getTreeNode()) : Null<Int>);
        var canvasJPanel : CanvasJPanel = (cast this.canvasJPanelList.get(Std.int(frameInt)) : CanvasJPanel);
        if (canvasJPanel != null) {
            canvasJPanel.addAngle(evt.getAngle());
            this.select(Std.int(frameInt));
        }
        StatusFactory.getInstance().setStatus("Canvas Rotated");
    }

    public function explode(evt : MyCanvasEvent) : Void {
        this.explodeAll();
    }

    // throws Exception
    public function autoExplode(evt : MyCanvasEvent) : Void {
        this.autoExplode(10, 0);
    }

    // throws Exception
    public function center() : Void {
        var canvasJPanel : CanvasJPanel = (cast this.getCurrentFrame() : CanvasJPanel);
        canvasJPanel.center();
    }

    // throws Exception
    public function center(evt : MyCanvasEvent) : Void {
        this.center();
    }

    public function run() : Void {
        try {
            while (true) {
                if (this.isPlaying()) {
                    final size : Int = this.canvasJPanelList.size();
                    for (index in 0...size) {
                        if (!this.isPlaying()) {
                            break;
                        }
                        this.select(index);
                        Sys.sleep(haxe.Int64.toInt(100) / 1000);
                    }
                } else {
                    Sys.sleep(haxe.Int64.toInt(500) / 1000);
                }
                Sys.sleep(haxe.Int64.toInt(250) / 1000);
            }
        } catch (e : haxe.Exception) {
        }
    }

    private var innerJPanel : javax.swing.JPanel = null;
}

