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
package org.allbinary.input.automation.actions.script.condition.processors.input;


class InputAutomationTypeJPanel extends javax.swing.JPanel {
    public function new() {
        super();
        this.initComponents();
    }

    public function getInputAutomationTypeJComboBox() : javax.swing.JComboBox {
        return this.inputAutomationTypeJComboBox;
    }

    public function setInputAutomationTypeJComboBox(inputAutomationTypeJComboBox : javax.swing.JComboBox) : Void {
        this.inputAutomationTypeJComboBox = inputAutomationTypeJComboBox;
    }

    private function initComponents() : Void {
        this.inputAutomationTypeJComboBox = new javax.swing.JComboBox();
        this.jLabel1 = new javax.swing.JLabel();
        this.inputAutomationTypeJComboBox.setModel(new javax.swing.DefaultComboBoxModel(haxe.ds.Vector.fromArrayCopy(["DirectX", "DirectX 8", "Low Level", "Java Robot"])));
        this.jLabel1.setText("Input Type:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(inputAutomationTypeJComboBox, 0, 98, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)));
    }

    private var inputAutomationTypeJComboBox : javax.swing.JComboBox = null;
    private var jLabel1 : javax.swing.JLabel = null;
}

