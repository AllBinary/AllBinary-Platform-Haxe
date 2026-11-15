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
package org.allbinary.input.automation.actions.script.condition;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AlwaysActionScriptConditionJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var alwaysActionScriptConditionInterface : AlwaysActionScriptConditionInterface;
    public function new(alwaysActionScriptConditionInterface : AlwaysActionScriptConditionInterface) {
        super();
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.alwaysActionScriptConditionInterface = alwaysActionScriptConditionInterface;
        this.set();
    }

    private function set() : Void {
        if (this.alwaysActionScriptConditionInterface.isIsOn()) {
            this.alwaysJComboBox.setSelectedIndex(0);
        } else {
            this.alwaysJComboBox.setSelectedIndex(1);
        }
        this.alwaysActionScriptConditionInterface.log();
    }

    private function update() : Void {
        if (this.alwaysJComboBox.getSelectedIndex() == 0) {
            this.alwaysActionScriptConditionInterface.setIsOn(true);
        } else {
            this.alwaysActionScriptConditionInterface.setIsOn(false);
        }
        this.alwaysActionScriptConditionInterface.log();
    }

    public function getAlwaysActionJDialog() : javax.swing.JDialog {
        return this.alwaysActionJDialog;
    }

    public function setAlwaysActionJDialog(alwaysActionJDialog : javax.swing.JDialog) : Void {
        this.alwaysActionJDialog = alwaysActionJDialog;
    }

    private function initComponents() : Void {
        this.alwaysActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.okJButton = new javax.swing.JButton();
        this.jLabel2 = new javax.swing.JLabel();
        this.alwaysJComboBox = new javax.swing.JComboBox();
        this.alwaysActionJButton = new javax.swing.JButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.alwaysActionJDialog.setMinimumSize(new java.awt.Dimension(250, 150));
        this.titleJLabel.setText("Always Condition Options");
        this.okJButton.setText("OK");
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel2.setText("On:");
        this.alwaysJComboBox.setModel(new javax.swing.DefaultComboBoxModel(haxe.ds.Vector.fromArrayCopy(["true", "false"])));
        var alwaysActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.alwaysActionJDialog.getContentPane());
        this.alwaysActionJDialog.getContentPane().setLayout(alwaysActionJDialogLayout);
        alwaysActionJDialogLayout.setHorizontalGroup(alwaysActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(alwaysActionJDialogLayout.createSequentialGroup().addGroup(alwaysActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(alwaysActionJDialogLayout.createSequentialGroup().addGap(47, 47, 47).addGroup(alwaysActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, alwaysActionJDialogLayout.createSequentialGroup().addComponent(jLabel2).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(alwaysJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addComponent(titleJLabel))).addGroup(alwaysActionJDialogLayout.createSequentialGroup().addGap(79, 79, 79).addComponent(okJButton))).addContainerGap(45, Short.MAX_VALUE)));
        alwaysActionJDialogLayout.setVerticalGroup(alwaysActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(alwaysActionJDialogLayout.createSequentialGroup().addContainerGap().addComponent(titleJLabel).addGap(20, 20, 20).addGroup(alwaysActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(alwaysJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel2)).addGap(15, 15, 15).addComponent(okJButton).addContainerGap()));
        setMinimumSize(new java.awt.Dimension(100, 0));
        this.alwaysActionJButton.setText("Edit");
        this.alwaysActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                alwaysActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Always:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 33, Short.MAX_VALUE).addComponent(alwaysActionJButton)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(alwaysActionJButton)));
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.update();
        this.getAlwaysActionJDialog().setVisible(false);
    }

    private function alwaysActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.getAlwaysActionJDialog().setVisible(true);
    }

    private var alwaysActionJButton : javax.swing.JButton = null;
    private var alwaysActionJDialog : javax.swing.JDialog = null;
    private var alwaysJComboBox : javax.swing.JComboBox = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var okJButton : javax.swing.JButton = null;
    private var titleJLabel : javax.swing.JLabel = null;
}

