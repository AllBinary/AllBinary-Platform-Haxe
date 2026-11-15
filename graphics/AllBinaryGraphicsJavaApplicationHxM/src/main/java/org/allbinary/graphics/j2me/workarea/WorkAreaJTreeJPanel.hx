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

//import javax.swing.*;
//import javax.swing.tree.DefaultMutableTreeNode;
//import javax.swing.tree.MutableTreeNode;
//import javax.swing.tree.TreePath;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasTreeLabel;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService;
import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventSource;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class WorkAreaJTreeJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var rootTreeNode : DefaultMutableTreeNode;
    private var workAreaJTree : JTree = null;
    private var highlightedBasicArrayList : BasicArrayList;
    public function new(workAreaName : String) {
        super();
        this.initComponents();
        this.rootTreeNode = new DefaultMutableTreeNode(workAreaName);
        this.workAreaPropertiesJPanel.removeAll();
        this.updateTree();
        this.highlightedBasicArrayList = new BasicArrayListD();
    }

    public function add(treeNode : MutableTreeNode) : Void {
        this.rootTreeNode.add(treeNode);
    }

    public function updateTree() : Void {
        this.workAreaJTree = new JTree(this.rootTreeNode);
        this.workAreaJTree.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                workAreaJTreeMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.workAreaPropertiesJPanel.removeAll();
        this.workAreaPropertiesJPanel.add(this.workAreaJTree);
    }

    public function getNode(treePathArray : haxe.ds.Vector<TreePath>) : BasicArrayList {
        var basicArrayList : BasicArrayList = new BasicArrayListD();
        if (treePathArray != null) {
            for (index in 0...treePathArray.length) {
                basicArrayList.add(this.getNode(treePathArray[index]));
            }
        }
        return basicArrayList;
    }

    public function getNode(treePath : TreePath) : DefaultMutableTreeNode {
        if (treePath != null) {
            var obj : haxe.ds.Vector<Any> = treePath.getPath();
            if (obj != null) {
                var node : DefaultMutableTreeNode = (cast obj[obj.length - 1] : DefaultMutableTreeNode);
                return node;
            }
        }
        return null;
    }

    // throws Exception
    public function deselectAll() : Void {
        var size : Int = this.highlightedBasicArrayList.size();
        this.logUtil.putF("size: " + size, this, "deselectAll");
        for (index in 0...size) {
            var node : DefaultMutableTreeNode = (cast this.highlightedBasicArrayList.get(index) : DefaultMutableTreeNode);
            MyGraphicItemEventService.fire(new MyGraphicItemEvent((cast new MyGraphicItemEventSource(MyGraphicItemEventService.DESELECT, node) : Any)));
        }
        this.highlightedBasicArrayList.clear();
    }

    // throws Exception
    public function selectGraphicItem(node : DefaultMutableTreeNode) : Void {
        this.highlightedBasicArrayList.add(node);
        MyGraphicItemEventService.fire(new MyGraphicItemEvent((cast new MyGraphicItemEventSource(MyGraphicItemEventService.SELECT, node) : Any)));
    }

    // throws Exception
    public function removeGraphicItem(node : DefaultMutableTreeNode) : Void {
        MyGraphicItemEventService.fire(new MyGraphicItemEvent((cast new MyGraphicItemEventSource(MyGraphicItemEventService.DELETE, node) : Any)));
    }

    // throws Exception
    public function removeCanvas(node : DefaultMutableTreeNode) : Void {
        MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.DELETE, node) : Any)));
    }

    // throws Exception
    public function remove(treePath : TreePath) : Void {
        var node : DefaultMutableTreeNode = this.getNode(treePath);
        if (node != null) {
            if (Std.isOfType(node.getUserObject(), CanvasTreeLabel)) {
                this.removeCanvas(node);
            } else {
                this.removeGraphicItem(node);
            }
        }
        var parent : DefaultMutableTreeNode = (cast node.getParent() : DefaultMutableTreeNode);
        parent.remove(node);
    }

    // throws Exception
    private function copy() : Void {
        var treePath : TreePath = this.workAreaJTree.getSelectionPath();
        this.copy(treePath);
        this.updateTree();
        this.expand();
        this.repaint();
    }

    // throws Exception
    private function copy(treePath : TreePath) : Void {
        var node : DefaultMutableTreeNode = this.getNode(treePath);
        if (node != null) {
            if (Std.isOfType(node.getUserObject(), CanvasTreeLabel)) {
                MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.DUPLICATE, node) : Any)));
            } else {
                MyGraphicItemEventService.fire(new MyGraphicItemEvent((cast new MyGraphicItemEventSource(MyGraphicItemEventService.DUPLICATE, node) : Any)));
            }
        }
    }

    // throws Exception
    public function rotate(treePath : TreePath, angle : Float) : Void {
        var node : DefaultMutableTreeNode = this.getNode(treePath);
        if (node != null) {
            if (Std.isOfType(node.getUserObject(), CanvasTreeLabel)) {
                MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.ROTATE, angle, node) : Any)));
            } else {
                MyGraphicItemEventService.fire(new MyGraphicItemEvent((cast new MyGraphicItemEventSource(MyGraphicItemEventService.ROTATE, angle, node) : Any)));
            }
        }
    }

    public function getRootTreeNode() : MutableTreeNode {
        return this.rootTreeNode;
    }

    public function expand() : Void {
        this.workAreaJTree.expandRow(0);
        this.workAreaJTree.expandRow(1);
    }

    public function expand(treePath : TreePath) : Void {
        this.workAreaJTree.expandPath(treePath);
    }

    private function initComponents() : Void {
        itemJPopupMenu = new javax.swing.JPopupMenu();
        this.deleteJMenuItem = new javax.swing.JMenuItem();
        this.copyJMenuItem = new javax.swing.JMenuItem();
        this.rotateJMenuItem = new javax.swing.JMenuItem();
        this.itemJScrollPane1 = new javax.swing.JScrollPane();
        this.workAreaPropertiesJPanel = new javax.swing.JPanel();
        itemJPopupMenu.addPopupMenuListener(/* anonymous class body:
            public function popupMenuCanceled(evt : javax.swing.event.PopupMenuEvent) : Void {
            }

            public function popupMenuWillBecomeInvisible(evt : javax.swing.event.PopupMenuEvent) : Void {
                itemJPopupMenuPopupMenuWillBecomeInvisible(evt);
            }

            public function popupMenuWillBecomeVisible(evt : javax.swing.event.PopupMenuEvent) : Void {
                itemJPopupMenuPopupMenuWillBecomeVisible(evt);
            }

*/ new javax.swing.event.PopupMenuListener());
        this.deleteJMenuItem.setText("Delete");
        this.deleteJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                deleteJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.itemJPopupMenu.add(this.deleteJMenuItem);
        this.copyJMenuItem.setText("Copy");
        this.copyJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                copyJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.itemJPopupMenu.add(this.copyJMenuItem);
        this.rotateJMenuItem.setText("Rotate 45*");
        this.rotateJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                rotateJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.itemJPopupMenu.add(this.rotateJMenuItem);
        setLayout(new java.awt.GridLayout(1, 1));
        this.workAreaPropertiesJPanel.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                workAreaPropertiesJPanelMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.workAreaPropertiesJPanel.setLayout(new java.awt.GridLayout(1, 0));
        this.itemJScrollPane1.setViewportView(this.workAreaPropertiesJPanel);
        add(this.itemJScrollPane1);
    }

    private function rotateJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            var treePath : TreePath = this.workAreaJTree.getSelectionPath();
            this.rotate(treePath, 45);
            this.updateTree();
            this.expand();
            this.repaint();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "rotateJMenuItemMousePressed", e);
        }
    }

    private function workAreaJTreeMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            var selectedTreePathArray : haxe.ds.Vector<TreePath> = this.workAreaJTree.getSelectionPaths();
            var list : BasicArrayList = this.getNode(selectedTreePathArray);
            if (list.size() > 0) {
                if ((evt.getModifiers() & evt.BUTTON3_MASK) == evt.BUTTON3_MASK) {
                    for (index in 0...selectedTreePathArray.length) {
                        var defaultMutableTreeNode : DefaultMutableTreeNode = (cast list.get(index) : DefaultMutableTreeNode);
                        if (Std.isOfType(defaultMutableTreeNode.getUserObject(), CanvasTreeLabel)) {
                            this.itemJPopupMenu.show(this, evt.getX(), evt.getY());
                        } else {
                            this.itemJPopupMenu.show(this, evt.getX(), evt.getY());
                        }
                    }
                }
                if ((evt.getModifiers() & evt.BUTTON1_MASK) == evt.BUTTON1_MASK) {
                    this.deselectAll();
                    for (index in 0...selectedTreePathArray.length) {
                        var defaultMutableTreeNode : DefaultMutableTreeNode = (cast list.get(index) : DefaultMutableTreeNode);
                        if (Std.isOfType(defaultMutableTreeNode.getUserObject(), CanvasTreeLabel)) {
                            MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.SELECT, defaultMutableTreeNode) : Any)));
                        } else {
                            this.selectGraphicItem(defaultMutableTreeNode);
                        }
                    }
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "workAreaJTreeMousePressed", e);
        }
    }

    private function itemJPopupMenuPopupMenuWillBecomeInvisible(evt : javax.swing.event.PopupMenuEvent) : Void {
    }

    private function itemJPopupMenuPopupMenuWillBecomeVisible(evt : javax.swing.event.PopupMenuEvent) : Void {
    }

    private function copyJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            this.copy();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "copyJMenuItemMousePressed", e);
        }
    }

    private function deleteJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            var selectedTreePathArray : haxe.ds.Vector<TreePath> = this.workAreaJTree.getSelectionPaths();
            for (index in 0...selectedTreePathArray.length) {
                var treePath : TreePath = selectedTreePathArray[index];
                this.remove(treePath);
                this.updateTree();
                this.expand();
                this.repaint();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "deleteJMenuItemMousePressed", e);
        }
    }

    private function workAreaPropertiesJPanelMousePressed(evt : java.awt.event.MouseEvent) : Void {
    }

    private var copyJMenuItem : javax.swing.JMenuItem = null;
    private var deleteJMenuItem : javax.swing.JMenuItem = null;
    private var itemJPopupMenu : javax.swing.JPopupMenu = null;
    private var itemJScrollPane1 : javax.swing.JScrollPane = null;
    private var rotateJMenuItem : javax.swing.JMenuItem = null;
    private var workAreaPropertiesJPanel : javax.swing.JPanel = null;
}

