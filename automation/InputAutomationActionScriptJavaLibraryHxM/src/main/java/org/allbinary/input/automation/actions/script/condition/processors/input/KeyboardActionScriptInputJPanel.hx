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

//import javax.swing.*;
import org.allbinary.input.KeySingletonFactory;
import org.allbinary.input.automation.robot.InputRobot;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.TempInputRobotNames;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonStrings;

class KeyboardActionScriptInputJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var keyActionScriptInputInterface : KeyboardActionScriptInputInterface;
    public function new(keyActionScriptInputInterface : KeyboardActionScriptInputInterface) {
        super();
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.keyActionScriptInputInterface = keyActionScriptInputInterface;
        var defaultComboBoxModel : DefaultComboBoxModel = new DefaultComboBoxModel();
        defaultComboBoxModel.addElement(TempInputRobotNames.DX_NAME);
        defaultComboBoxModel.addElement(InputRobot.NAME);
        this.inputAutomationTypeJComboBox.setModel(defaultComboBoxModel);
        this.keyNameJComboBox.setModel(KeyNameDefaultComboBoxModelFactory.getInstance());
        this.keyIntegerJComboBox.setModel(KeyCharDefaultComboBoxModelFactory.getInstance());
        if (this.keyActionScriptInputInterface.isNormal()) {
            this.normalJRadioButton.setSelected(true);
            this.pressJRadioButton.setSelected(false);
            this.releaseJRadioButton.setSelected(false);
        } else if (this.keyActionScriptInputInterface.isPress()) {
            this.normalJRadioButton.setSelected(false);
            this.pressJRadioButton.setSelected(true);
            this.releaseJRadioButton.setSelected(false);
        } else if (this.keyActionScriptInputInterface.isRelease()) {
            this.normalJRadioButton.setSelected(false);
            this.pressJRadioButton.setSelected(false);
            this.releaseJRadioButton.setSelected(true);
        }
        this.set();
    }

    private function set() : Void {
        var inputTypeComboBoxModel : ComboBoxModel = this.inputAutomationTypeJComboBox.getModel();
        inputTypeComboBoxModel.setSelectedItem(this.keyActionScriptInputInterface.getInputRobotInterface().getName());
        this.textJTextField.setText(this.keyActionScriptInputInterface.getText());
        this.delayJTextField.setText(Std.string(this.keyActionScriptInputInterface.getDelayBetweenKeys()));
        this.timeJTextField.setText(Std.string(this.keyActionScriptInputInterface.getTime()));
        this.keyActionScriptInputInterface.log();
    }

    // throws Exception
    private function updateInputType() : Void {
        var comboBoxModel : ComboBoxModel = this.inputAutomationTypeJComboBox.getModel();
        var selectedItem : String = (cast comboBoxModel.getSelectedItem() : String);
        if (!StringValidationUtil.getInstance().isEmpty(selectedItem)) {
            this.keyActionScriptInputInterface.setInputRobotInterface(InputRobotFactory.getInstance().get(selectedItem));
        }
    }

    private function getSelectedKey() : Null<Int> {
        var comboBoxModel : ComboBoxModel = this.keyNameJComboBox.getModel();
        var selectedItem : String = (cast comboBoxModel.getSelectedItem() : String);
        if (!StringValidationUtil.getInstance().isEmpty(selectedItem)) {
            return (cast KeySingletonFactory.getHashtable().get(selectedItem) : Null<Int>);
        }
        return null;
    }

    private function updateKeys() : Void {
        var text : String = this.textJTextField.getText();
        this.keyActionScriptInputInterface.setText(text);
    }

    // throws Exception
    private function update() : Void {
        this.updateInputType();
        this.updateKeys();
        this.keyActionScriptInputInterface.setTime(Std.int(Std.string(this.timeJTextField.getText())));
        this.keyActionScriptInputInterface.log();
    }

    public function getKeyActionJDialog() : javax.swing.JDialog {
        return this.keyActionJDialog;
    }

    public function setKeyActionJDialog(keyActionJDialog : javax.swing.JDialog) : Void {
        this.keyActionJDialog = keyActionJDialog;
    }

    private function initComponents() : Void {
        this.keyActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.addKeyJLabel = new javax.swing.JLabel();
        this.keyNameJComboBox = new javax.swing.JComboBox();
        this.timeJTextField = new javax.swing.JTextField();
        this.holdTimeJLabel = new javax.swing.JLabel();
        this.inputAutomationTypeJComboBox = new javax.swing.JComboBox();
        this.inputTypeJLabel = new javax.swing.JLabel();
        this.delayJTextField = new javax.swing.JTextField();
        this.delayBetweenJLabel = new javax.swing.JLabel();
        this.testJLabel = new javax.swing.JLabel();
        this.textJTextField = new javax.swing.JTextField();
        this.pressJRadioButton = new javax.swing.JRadioButton();
        this.releaseJRadioButton = new javax.swing.JRadioButton();
        this.normalJRadioButton = new javax.swing.JRadioButton();
        this.simultaneousJRadioButton = new javax.swing.JRadioButton();
        this.sequenceJRadioButton = new javax.swing.JRadioButton();
        this.jPanel1 = new javax.swing.JPanel();
        this.okJButton = new javax.swing.JButton();
        this.keyIntegerJComboBox = new javax.swing.JComboBox();
        this.keyActionJButton = new javax.swing.JButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.keyActionJDialog.setMinimumSize(new java.awt.Dimension(255, 280));
        this.titleJLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        this.titleJLabel.setText("Keyboard Input Options");
        this.addKeyJLabel.setText("Add Key:");
        this.keyNameJComboBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                keyNameJComboBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.timeJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.holdTimeJLabel.setText("Hold Time (ms):");
        this.inputTypeJLabel.setText("Input Type:");
        this.delayJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.delayBetweenJLabel.setText("Delay Between Keys (ms):");
        this.testJLabel.setText("Text:");
        this.textJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.pressJRadioButton.setText("Press");
        this.pressJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.pressJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.pressJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                pressJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.releaseJRadioButton.setText("Release");
        this.releaseJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.releaseJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.releaseJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                releaseJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.normalJRadioButton.setSelected(true);
        this.normalJRadioButton.setText("Normal");
        this.normalJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.normalJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.normalJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                normalJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.simultaneousJRadioButton.setSelected(true);
        this.simultaneousJRadioButton.setText("Simultaneous");
        this.simultaneousJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.simultaneousJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.simultaneousJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                simultaneousJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.sequenceJRadioButton.setText("Sequence");
        this.sequenceJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.sequenceJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.sequenceJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                sequenceJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.okJButton.setText("OK");
        this.okJButton.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jPanel1.add(this.okJButton);
        this.keyIntegerJComboBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                keyIntegerJComboBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var keyActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.keyActionJDialog.getContentPane());
        this.keyActionJDialog.getContentPane().setLayout(keyActionJDialogLayout);
        keyActionJDialogLayout.setHorizontalGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(keyActionJDialogLayout.createSequentialGroup().addContainerGap().addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(keyActionJDialogLayout.createSequentialGroup().addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addComponent(addKeyJLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(inputTypeJLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(inputAutomationTypeJComboBox, 0, 148, Short.MAX_VALUE).addComponent(textJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 148, Short.MAX_VALUE).addGroup(keyActionJDialogLayout.createSequentialGroup().addComponent(keyNameJComboBox, 0, 101, Short.MAX_VALUE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(keyIntegerJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)))).addComponent(testJLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE).addGroup(keyActionJDialogLayout.createSequentialGroup().addComponent(normalJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(pressJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(releaseJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 48, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, keyActionJDialogLayout.createSequentialGroup().addComponent(holdTimeJLabel).addGap(22, 22, 22).addComponent(timeJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 113, Short.MAX_VALUE)).addGroup(keyActionJDialogLayout.createSequentialGroup().addComponent(delayBetweenJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE).addComponent(delayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(keyActionJDialogLayout.createSequentialGroup().addComponent(simultaneousJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(sequenceJRadioButton))).addContainerGap()).addComponent(titleJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 229, Short.MAX_VALUE));
        keyActionJDialogLayout.setVerticalGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(keyActionJDialogLayout.createSequentialGroup().addComponent(titleJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(inputTypeJLabel).addComponent(inputAutomationTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(addKeyJLabel).addComponent(keyIntegerJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(keyNameJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(testJLabel).addComponent(textJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(pressJRadioButton).addComponent(normalJRadioButton).addComponent(releaseJRadioButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(holdTimeJLabel).addComponent(timeJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(delayBetweenJLabel).addComponent(delayJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(keyActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(simultaneousJRadioButton).addComponent(sequenceJRadioButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap()));
        setMinimumSize(new java.awt.Dimension(100, 0));
        this.keyActionJButton.setText("Edit");
        this.keyActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                keyActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Key:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 49, Short.MAX_VALUE).addComponent(keyActionJButton)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(keyActionJButton)));
    }

    private function prependText(integer : Null<Int>) : Void {
        if (integer != null) {
            var newKey : String = "&#" + integer.toString() + ";";
            this.textJTextField.setText(newKey + this.textJTextField.getText());
        }
    }

    private function keyIntegerJComboBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.keyIntegerJComboBox.getSelectedIndex();
        this.keyNameJComboBox.setSelectedIndex(this.keyIntegerJComboBox.getSelectedIndex());
    }

    private function sequenceJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.sequenceJRadioButton.isSelected()) {
            this.delayJTextField.setText(CommonPhoneStrings.getInstance().ONE);
            this.simultaneousJRadioButton.setSelected(false);
        }
    }

    private function simultaneousJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.simultaneousJRadioButton.isSelected()) {
            this.delayJTextField.setText(CommonPhoneStrings.getInstance().ZERO);
            this.sequenceJRadioButton.setSelected(false);
        }
    }

    private function keyNameJComboBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        var integer : Null<Int> = this.getSelectedKey();
        this.prependText(integer);
        this.keyIntegerJComboBox.setSelectedIndex(this.keyNameJComboBox.getSelectedIndex());
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.update();
            this.getKeyActionJDialog().setVisible(false);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "okButtonActionPerformed", e);
        }
    }

    private function keyActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.getKeyActionJDialog().setVisible(true);
    }

    private function normalJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.normalJRadioButton.isSelected()) {
            this.keyActionScriptInputInterface.setNormal();
            this.pressJRadioButton.setSelected(false);
            this.releaseJRadioButton.setSelected(false);
        }
    }

    private function releaseJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.releaseJRadioButton.isSelected()) {
            this.keyActionScriptInputInterface.setRelease(true);
            this.keyActionScriptInputInterface.setPress(false);
            this.pressJRadioButton.setSelected(false);
            this.normalJRadioButton.setSelected(false);
        }
    }

    private function pressJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.pressJRadioButton.isSelected()) {
            this.keyActionScriptInputInterface.setPress(true);
            this.keyActionScriptInputInterface.setRelease(false);
            this.releaseJRadioButton.setSelected(false);
            this.normalJRadioButton.setSelected(false);
        }
    }

    private var addKeyJLabel : javax.swing.JLabel = null;
    private var delayBetweenJLabel : javax.swing.JLabel = null;
    private var delayJTextField : javax.swing.JTextField = null;
    private var holdTimeJLabel : javax.swing.JLabel = null;
    private var inputAutomationTypeJComboBox : javax.swing.JComboBox = null;
    private var inputTypeJLabel : javax.swing.JLabel = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var keyActionJButton : javax.swing.JButton = null;
    private var keyActionJDialog : javax.swing.JDialog = null;
    private var keyIntegerJComboBox : javax.swing.JComboBox = null;
    private var keyNameJComboBox : javax.swing.JComboBox = null;
    private var normalJRadioButton : javax.swing.JRadioButton = null;
    private var okJButton : javax.swing.JButton = null;
    private var pressJRadioButton : javax.swing.JRadioButton = null;
    private var releaseJRadioButton : javax.swing.JRadioButton = null;
    private var sequenceJRadioButton : javax.swing.JRadioButton = null;
    private var simultaneousJRadioButton : javax.swing.JRadioButton = null;
    private var testJLabel : javax.swing.JLabel = null;
    private var textJTextField : javax.swing.JTextField = null;
    private var timeJTextField : javax.swing.JTextField = null;
    private var titleJLabel : javax.swing.JLabel = null;
}

