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
package org.allbinary.input.automation.module.generic.configuration.profile.actions;

import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory;
import org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition;
import org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition;
import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface;
import org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel;
import org.allbinary.logic.communication.log.LogUtil;

class GenericProfileActionJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var genericProfileAction : GenericProfileAction = null;
    private var genericProfileActionScriptJPanel : GenericProfileActionScriptJPanel = null;
    public function new() {
        super();
        this.initComponents();
    }

    public function updateProfileActionUI() : Void {
        this.blankProfileActionScriptJPanel.removeAll();
        final genericProfileActionScriptJPanel : GenericProfileActionScriptJPanel = new GenericProfileActionScriptJPanel();
        JTreeInterfaceFactory.getInstance().set(genericProfileActionScriptJPanel);
        this.setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel);
        this.getGenericProfileActionScriptJPanel().setGenericProfileActionScript(this.getGenericProfileAction().getGenericProfileActionScript());
        this.getGenericProfileActionScriptJPanel().updateJTree();
        var layout : javax.swing.GroupLayout = (cast this.blankProfileActionScriptJPanel.getLayout() : javax.swing.GroupLayout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 395, Short.MAX_VALUE).addComponent(this.getGenericProfileActionScriptJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 256, Short.MAX_VALUE).addComponent(this.getGenericProfileActionScriptJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
        this.logUtil.putF("Updated UI", this, "updateUI");
    }

    public function getGenericProfileAction() : GenericProfileAction {
        return this.genericProfileAction;
    }

    public function setGenericProfileAction(genericProfileAction : GenericProfileAction) : Void {
        this.genericProfileAction = genericProfileAction;
    }

    public function getGenericProfileActionScriptJPanel() : GenericProfileActionScriptJPanel {
        return this.genericProfileActionScriptJPanel;
    }

    public function setGenericProfileActionScriptJPanel(genericProfileActionScriptJPanel : GenericProfileActionScriptJPanel) : Void {
        this.genericProfileActionScriptJPanel = genericProfileActionScriptJPanel;
    }

    private function initComponents() : Void {
        this.genericProfileActionScriptJScrollPane = new javax.swing.JScrollPane();
        this.blankProfileActionScriptJPanel = new javax.swing.JPanel();
        this.ifJLabel = new javax.swing.JLabel();
        this.newColorAtJButton = new javax.swing.JButton();
        this.newTimeIntervalJButton = new javax.swing.JButton();
        this.newAlwaysJButton = new javax.swing.JButton();
        setMinimumSize(new java.awt.Dimension(440, 275));
        setPreferredSize(new java.awt.Dimension(440, 275));
        this.genericProfileActionScriptJScrollPane.setPreferredSize(new java.awt.Dimension(474, 270));
        this.blankProfileActionScriptJPanel.setMinimumSize(new java.awt.Dimension(400, 200));
        var blankProfileActionScriptJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.blankProfileActionScriptJPanel);
        this.blankProfileActionScriptJPanel.setLayout(blankProfileActionScriptJPanelLayout);
        blankProfileActionScriptJPanelLayout.setHorizontalGroup(blankProfileActionScriptJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 9996, Short.MAX_VALUE));
        blankProfileActionScriptJPanelLayout.setVerticalGroup(blankProfileActionScriptJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 9967, Short.MAX_VALUE));
        this.genericProfileActionScriptJScrollPane.setViewportView(this.blankProfileActionScriptJPanel);
        this.ifJLabel.setText("Conditions:");
        this.newColorAtJButton.setText("Color Range At");
        this.newColorAtJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newColorAtJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.newTimeIntervalJButton.setText("Time Interval");
        this.newTimeIntervalJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newTimeIntervalJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.newAlwaysJButton.setText("Always On/Off");
        this.newAlwaysJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newAlwaysJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(ifJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(newColorAtJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(newTimeIntervalJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(newAlwaysJButton).addContainerGap(61, Short.MAX_VALUE)).addComponent(genericProfileActionScriptJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 440, Short.MAX_VALUE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(ifJLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(newColorAtJButton).addComponent(newTimeIntervalJButton).addComponent(newAlwaysJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(genericProfileActionScriptJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE)));
    }

    private function newTimeIntervalJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.logUtil.putF("New Time Interval Action Condition", this, "newTimeIntervalJButtonActionPerformed");
        this.getGenericProfileAction().getGenericProfileActionScript().addCondition((cast new TimeIntervalActionScriptCondition() : ProfileActionScriptConditionInterface));
        this.updateProfileActionUI();
    }

    private function newAlwaysJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.logUtil.putF("New EveryTime Action Condition", this, "newEveryTimeJButtonActionPerformed");
        this.getGenericProfileAction().getGenericProfileActionScript().addCondition((cast new AlwaysActionScriptCondition() : ProfileActionScriptConditionInterface));
        this.updateProfileActionUI();
    }

    private function newColorAtJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.logUtil.putF("New Color At Action Condition", this, "newColorAtJButtonActionPerformed");
        this.getGenericProfileAction().getGenericProfileActionScript().addCondition((cast new ColorAtActionScriptCondition() : ProfileActionScriptConditionInterface));
        this.updateProfileActionUI();
    }

    private var blankProfileActionScriptJPanel : javax.swing.JPanel = null;
    private var genericProfileActionScriptJScrollPane : javax.swing.JScrollPane = null;
    private var ifJLabel : javax.swing.JLabel = null;
    private var newAlwaysJButton : javax.swing.JButton = null;
    private var newColorAtJButton : javax.swing.JButton = null;
    private var newTimeIntervalJButton : javax.swing.JButton = null;
}

