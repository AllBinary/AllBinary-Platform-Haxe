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


class ActionScriptItemJPanel extends javax.swing.JPanel {
    public function new() {
        super();
        this.initComponents();
    }

    public function getNewActionScriptInputJPanel() : javax.swing.JPanel {
        return this.newActionScriptInputJPanel;
    }

    public function setNewActionScriptInputJPanel(newActionScriptInputJPanel : javax.swing.JPanel) : Void {
        this.newActionScriptInputJPanel = newActionScriptInputJPanel;
    }

    public function getRemoveJPanel() : javax.swing.JPanel {
        return this.removeJPanel;
    }

    public function setRemoveJPanel(removeJPanel : javax.swing.JPanel) : Void {
        this.removeJPanel = removeJPanel;
    }

    public function getScriptItemJPanel() : javax.swing.JPanel {
        return this.scriptItemJPanel;
    }

    public function setScriptItemJPanel(scriptItemJPanel : javax.swing.JPanel) : Void {
        this.scriptItemJPanel = scriptItemJPanel;
    }

    public function getNewActionScriptConditionJPanel() : javax.swing.JPanel {
        return this.newActionScriptConditionJPanel;
    }

    public function setNewActionScriptConditionJPanel(newActionScriptConditionJPanel : javax.swing.JPanel) : Void {
        this.newActionScriptConditionJPanel = newActionScriptConditionJPanel;
    }

    public function getChildActionScriptConditionJPanel() : javax.swing.JPanel {
        return this.childActionScriptConditionJPanel;
    }

    public function setChildActionScriptConditionJPanel(childActionScriptConditionJPanel : javax.swing.JPanel) : Void {
        this.childActionScriptConditionJPanel = childActionScriptConditionJPanel;
    }

    private function initComponents() : Void {
        this.newActionScriptInputJPanel = new javax.swing.JPanel();
        this.childActionScriptConditionJPanel = new javax.swing.JPanel();
        this.newActionScriptConditionJPanel = new javax.swing.JPanel();
        this.scriptItemJPanel = new javax.swing.JPanel();
        this.removeJPanel = new javax.swing.JPanel();
        this.newActionScriptInputJPanel.setLayout(new java.awt.GridLayout(1, 0));
        var childActionScriptConditionJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.childActionScriptConditionJPanel);
        this.childActionScriptConditionJPanel.setLayout(childActionScriptConditionJPanelLayout);
        childActionScriptConditionJPanelLayout.setHorizontalGroup(childActionScriptConditionJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 229, Short.MAX_VALUE));
        childActionScriptConditionJPanelLayout.setVerticalGroup(childActionScriptConditionJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 8, Short.MAX_VALUE));
        this.newActionScriptConditionJPanel.setLayout(new java.awt.GridLayout(1, 0));
        this.scriptItemJPanel.setLayout(new java.awt.GridLayout(1, 1));
        this.removeJPanel.setLayout(new java.awt.GridLayout(1, 1));
        this.removeJPanel.setMinimumSize(new java.awt.Dimension(30, 20));
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(scriptItemJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(removeJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 56, Short.MAX_VALUE)).addComponent(newActionScriptInputJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE).addComponent(newActionScriptConditionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE).addComponent(childActionScriptConditionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(scriptItemJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE).addComponent(removeJPanel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(childActionScriptConditionJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(newActionScriptConditionJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(newActionScriptInputJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)));
    }

    private var childActionScriptConditionJPanel : javax.swing.JPanel = null;
    private var newActionScriptConditionJPanel : javax.swing.JPanel = null;
    private var newActionScriptInputJPanel : javax.swing.JPanel = null;
    private var removeJPanel : javax.swing.JPanel = null;
    private var scriptItemJPanel : javax.swing.JPanel = null;
}

