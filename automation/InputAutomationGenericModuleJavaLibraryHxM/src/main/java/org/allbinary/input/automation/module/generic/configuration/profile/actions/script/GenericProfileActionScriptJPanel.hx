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
package org.allbinary.input.automation.module.generic.configuration.profile.actions.script;

//import java.awt.event.MouseEvent;
//import javax.swing.*;
//import javax.swing.tree.DefaultMutableTreeNode;
//import javax.swing.tree.DefaultTreeModel;
//import javax.swing.tree.TreePath;
import org.allbinary.input.automation.actions.script.JTreeInterface;
import org.allbinary.input.automation.actions.script.condition.CustomTreeNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class GenericProfileActionScriptJPanel extends javax.swing.JPanel implements JTreeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var defaultMutableTreeNode : DefaultMutableTreeNode = new DefaultMutableTreeNode("Root");
    private var genericProfileActionScript : GenericProfileActionScript = null;
    public function new() {
        super();
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
    }

    public function updateJTree() : Void {
        var defaultTreeModel : DefaultTreeModel = new DefaultTreeModel(this.getGenericProfileActionScript());
        this.getActionScriptJTree().setModel(defaultTreeModel);
        this.repaint();
        this.logUtil.putF("Updated UI", this, "updateJTree");
    }

    public function getGenericProfileActionScript() : GenericProfileActionScript {
        return this.genericProfileActionScript;
    }

    public function setGenericProfileActionScript(genericProfileActionScript : GenericProfileActionScript) : Void {
        this.genericProfileActionScript = genericProfileActionScript;
    }

    public function getActionScriptJTree() : javax.swing.JTree {
        return this.actionScriptJTree;
    }

    public function setActionScriptJTree(actionScriptJTree : javax.swing.JTree) : Void {
        this.actionScriptJTree = actionScriptJTree;
    }

    private function initComponents() : Void {
        this.jScrollPane1 = new javax.swing.JScrollPane();
        this.actionScriptJTree = new javax.swing.JTree();
        setLayout(new java.awt.GridLayout(1, 0));
        this.actionScriptJTree.setPreferredSize(new java.awt.Dimension(500, 500));
        this.actionScriptJTree.addMouseListener(/* anonymous class body:
            public function mouseClicked(evt : java.awt.event.MouseEvent) : Void {
                actionScriptJTreeMouseClicked(evt);
            }

            public function mouseReleased(evt : java.awt.event.MouseEvent) : Void {
                actionScriptJTreeMouseReleased(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.jScrollPane1.setViewportView(this.actionScriptJTree);
        add(this.jScrollPane1);
    }

    private function actionScriptJTreeMouseReleased(evt : java.awt.event.MouseEvent) : Void {
        var button : Int = evt.getButton();
        if (button == MouseEvent.BUTTON3) {
            var treePath : TreePath = this.getActionScriptJTree().getSelectionPath();
            if (treePath != null) {
                var anyType : Any = treePath.getLastPathComponent();
                if (Std.isOfType(anyType, CustomTreeNodeInterface)) {
                    var customTreeNodeInterface : CustomTreeNodeInterface = (cast anyType : CustomTreeNodeInterface);
                    var jPopupMenu : JPopupMenu = customTreeNodeInterface.getJPopupMenu();
                    jPopupMenu.show((cast evt.getSource() : JComponent), evt.getX(), evt.getY());
                }
            }
        }
    }

    private function actionScriptJTreeMouseClicked(evt : java.awt.event.MouseEvent) : Void {
    }

    private var actionScriptJTree : javax.swing.JTree = null;
    private var jScrollPane1 : javax.swing.JScrollPane = null;
}

