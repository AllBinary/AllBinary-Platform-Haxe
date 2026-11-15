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

//import java.awt.event.InputEvent;
//import javax.swing.*;
import org.allbinary.input.automation.robot.InputRobot;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.TempInputRobotNames;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonStrings;

class MouseActionScriptInputJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var mouseActionScriptInputInterface : MouseActionScriptInputInterface;
    public function new(mouseActionScriptInputInterface : MouseActionScriptInputInterface) {
        super();
        this.logUtil.putF(CommonLabels.getInstance().START + mouseActionScriptInputInterface, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.mouseActionScriptInputInterface = mouseActionScriptInputInterface;
        final defaultComboBoxModel : DefaultComboBoxModel = new DefaultComboBoxModel();
        defaultComboBoxModel.addElement(TempInputRobotNames.LOW_NAME);
        defaultComboBoxModel.addElement(TempInputRobotNames.SYS_NAME);
        defaultComboBoxModel.addElement(InputRobot.NAME);
        this.inputAutomationTypeJComboBox.setModel(defaultComboBoxModel);
        this.set();
    }

    private function set() : Void {
        final inputTypeComboBoxModel : ComboBoxModel = this.inputAutomationTypeJComboBox.getModel();
        inputTypeComboBoxModel.setSelectedItem(this.mouseActionScriptInputInterface.getInputRobotInterface().getName());
        if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON1_MASK) != 0) {
            this.button1JCheckBox.setSelected(true);
        } else {
            this.button1JCheckBox.setSelected(false);
        }
        if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON2_MASK) != 0) {
            this.button2JCheckBox.setSelected(true);
        } else {
            this.button2JCheckBox.setSelected(false);
        }
        this.mouseDelayJTextField.setText(Std.string(this.mouseActionScriptInputInterface.getTime()));
        this.mouseXJTextField.setText(Std.string(this.mouseActionScriptInputInterface.getPoint().x));
        this.mouseYJTextField.setText(Std.string(this.mouseActionScriptInputInterface.getPoint().y));
        this.mouseActionScriptInputInterface.log();
    }

    // throws Exception
    private function updateInputType() : Void {
        final comboBoxModel : ComboBoxModel = this.inputAutomationTypeJComboBox.getModel();
        final selectedItem : String = (cast comboBoxModel.getSelectedItem() : String);
        if (!StringValidationUtil.getInstance().isEmpty(selectedItem)) {
            this.mouseActionScriptInputInterface.setInputRobotInterface(InputRobotFactory.getInstance().get(selectedItem));
        }
    }

    // throws Exception
    private function update() : Void {
        this.updateInputType();
        this.mouseActionScriptInputInterface.setTime(Std.string(this.mouseDelayJTextField.getText()));
        this.logUtil.putF("Button State: " + this.mouseActionScriptInputInterface.getButtonClicks(), this, "update");
        if (this.button1JCheckBox.isSelected()) {
            if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON1_MASK) == 0) {
                this.mouseActionScriptInputInterface.setButtonClicks(this.mouseActionScriptInputInterface.getButtonClicks() | InputEvent.BUTTON1_MASK);
                this.logUtil.putF("Button 1 Selected: " + this.mouseActionScriptInputInterface.getButtonClicks(), this, "update");
            }
        } else {
            if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON1_MASK) != 0) {
                this.mouseActionScriptInputInterface.setButtonClicks(this.mouseActionScriptInputInterface.getButtonClicks() ^ InputEvent.BUTTON1_MASK);
                this.logUtil.putF("Button 1 Deselected: " + this.mouseActionScriptInputInterface.getButtonClicks(), this, "update");
            }
        }
        if (this.button2JCheckBox.isSelected()) {
            if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON2_MASK) == 0) {
                this.mouseActionScriptInputInterface.setButtonClicks(this.mouseActionScriptInputInterface.getButtonClicks() | InputEvent.BUTTON2_MASK);
                this.logUtil.putF("Button 2 Selected: " + this.mouseActionScriptInputInterface.getButtonClicks(), this, "update");
            }
        } else {
            if ((this.mouseActionScriptInputInterface.getButtonClicks() & InputEvent.BUTTON2_MASK) != 0) {
                this.mouseActionScriptInputInterface.setButtonClicks(this.mouseActionScriptInputInterface.getButtonClicks() ^ InputEvent.BUTTON2_MASK);
                this.logUtil.putF("Button 2 Deselected: " + this.mouseActionScriptInputInterface.getButtonClicks(), this, "update");
            }
        }
        var mouseXString : String = this.mouseXJTextField.getText();
        if (!StringValidationUtil.getInstance().isEmpty(mouseXString) && StringValidationUtil.getInstance().isNumber(mouseXString)) {
            this.mouseActionScriptInputInterface.getPoint().x = Std.parseInt(mouseXString);
        }
        var mouseYString : String = this.mouseYJTextField.getText();
        if (!StringValidationUtil.getInstance().isEmpty(mouseYString) && StringValidationUtil.getInstance().isNumber(mouseYString)) {
            this.mouseActionScriptInputInterface.getPoint().y = Std.parseInt(mouseYString);
        }
        this.mouseActionScriptInputInterface.log();
    }

    public function getMouseActionJDialog() : javax.swing.JDialog {
        return this.mouseActionJDialog;
    }

    public function setMouseActionJDialog(mouseActionJDialog : javax.swing.JDialog) : Void {
        this.mouseActionJDialog = mouseActionJDialog;
    }

    private function initComponents() : Void {
        this.mouseActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.okJButton = new javax.swing.JButton();
        this.jLabel2 = new javax.swing.JLabel();
        this.jLabel3 = new javax.swing.JLabel();
        this.button1JCheckBox = new javax.swing.JCheckBox();
        this.button2JCheckBox = new javax.swing.JCheckBox();
        this.jLabel4 = new javax.swing.JLabel();
        this.mouseXJTextField = new javax.swing.JTextField();
        this.jLabel5 = new javax.swing.JLabel();
        this.mouseYJTextField = new javax.swing.JTextField();
        this.inputTypeJLabel = new javax.swing.JLabel();
        this.inputAutomationTypeJComboBox = new javax.swing.JComboBox();
        this.jLabel6 = new javax.swing.JLabel();
        this.mouseDelayJTextField = new javax.swing.JTextField();
        this.mouseActionJButton = new javax.swing.JButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.mouseActionJDialog.setMinimumSize(new java.awt.Dimension(275, 185));
        this.titleJLabel.setText("Mouse Input Options");
        this.okJButton.setText("OK");
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel2.setText("Buttons:");
        this.jLabel3.setText("Move To:");
        this.button1JCheckBox.setText(CommonPhoneStrings.getInstance().ONE);
        this.button1JCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.button1JCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.button2JCheckBox.setText(CommonPhoneStrings.getInstance().TWO);
        this.button2JCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.button2JCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.button2JCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                button2JCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel4.setText("x:");
        this.mouseXJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.jLabel5.setText("y:");
        this.mouseYJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.inputTypeJLabel.setText("Input Type:");
        this.jLabel6.setText("Delay:");
        this.mouseDelayJTextField.setText("100");
        var mouseActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.mouseActionJDialog.getContentPane());
        this.mouseActionJDialog.getContentPane().setLayout(mouseActionJDialogLayout);
        mouseActionJDialogLayout.setHorizontalGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(mouseActionJDialogLayout.createSequentialGroup().addContainerGap().addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(inputTypeJLabel).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout.createSequentialGroup().addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout.createSequentialGroup().addComponent(jLabel2).addGap(25, 25, 25)).addGroup(mouseActionJDialogLayout.createSequentialGroup().addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jLabel3).addComponent(jLabel6)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(mouseDelayJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 154, Short.MAX_VALUE).addGroup(mouseActionJDialogLayout.createSequentialGroup().addComponent(titleJLabel).addGap(45, 45, 45)).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mouseActionJDialogLayout.createSequentialGroup().addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(inputAutomationTypeJComboBox, 0, 154, Short.MAX_VALUE)).addGroup(mouseActionJDialogLayout.createSequentialGroup().addComponent(button1JCheckBox).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(button2JCheckBox)).addGroup(mouseActionJDialogLayout.createSequentialGroup().addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addGroup(mouseActionJDialogLayout.createSequentialGroup().addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(okJButton)).addGroup(mouseActionJDialogLayout.createSequentialGroup().addComponent(jLabel4).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 5, Short.MAX_VALUE).addComponent(mouseXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE))).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel5).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(mouseYJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 62, Short.MAX_VALUE))))).addContainerGap()));
        mouseActionJDialogLayout.setVerticalGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(mouseActionJDialogLayout.createSequentialGroup().addComponent(titleJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(inputTypeJLabel).addComponent(inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(button1JCheckBox).addComponent(button2JCheckBox))).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel6).addComponent(mouseDelayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(mouseActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel3).addComponent(jLabel4).addComponent(jLabel5).addComponent(mouseYJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(mouseXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(okJButton).addContainerGap()));
        setMinimumSize(new java.awt.Dimension(100, 0));
        this.mouseActionJButton.setText("Edit");
        this.mouseActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                mouseActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Mouse:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 36, Short.MAX_VALUE).addComponent(mouseActionJButton)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(mouseActionJButton)));
    }

    private function button2JCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.update();
            this.getMouseActionJDialog().setVisible(false);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "okButtonActionPerformed", e);
        }
    }

    private function mouseActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.getMouseActionJDialog().setVisible(true);
    }

    private var button1JCheckBox : javax.swing.JCheckBox = null;
    private var button2JCheckBox : javax.swing.JCheckBox = null;
    private var inputAutomationTypeJComboBox : javax.swing.JComboBox = null;
    private var inputTypeJLabel : javax.swing.JLabel = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLabel3 : javax.swing.JLabel = null;
    private var jLabel4 : javax.swing.JLabel = null;
    private var jLabel5 : javax.swing.JLabel = null;
    private var jLabel6 : javax.swing.JLabel = null;
    private var mouseActionJButton : javax.swing.JButton = null;
    private var mouseActionJDialog : javax.swing.JDialog = null;
    private var mouseDelayJTextField : javax.swing.JTextField = null;
    private var mouseXJTextField : javax.swing.JTextField = null;
    private var mouseYJTextField : javax.swing.JTextField = null;
    private var okJButton : javax.swing.JButton = null;
    private var titleJLabel : javax.swing.JLabel = null;
}

