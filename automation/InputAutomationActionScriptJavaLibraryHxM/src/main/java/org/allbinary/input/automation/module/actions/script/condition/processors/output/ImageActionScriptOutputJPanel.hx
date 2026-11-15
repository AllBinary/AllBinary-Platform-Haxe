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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.swing.*;
import org.allbinary.input.media.image.InputImageType;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ImageActionScriptOutputJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var capturedImageActionScriptOutputInterface : ImageActionScriptOutputInterface;
    public function new(capturedImageActionScriptOutputInterface : ImageActionScriptOutputInterface) {
        super();
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.capturedImageActionScriptOutputInterface = capturedImageActionScriptOutputInterface;
        this.set();
    }

    private function set() : Void {
        this.setImageTypeJlistModel();
        var imageTypes : ImageTypes = this.capturedImageActionScriptOutputInterface.getImageTypes();
        var vector : BasicArrayList = imageTypes.getVector();
        var selectedArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...vector.size()) 0]);
        final size : Int = vector.size();
        for (index in 0...size) {
            var imageType : InputImageType = (cast vector.get(index) : InputImageType);
            selectedArray[index++] = imageType.getIndex();
        }
        this.itemTypesJList.setSelectedIndices(selectedArray);
        if (this.capturedImageActionScriptOutputInterface.isSaved()) {
            this.saveJCheckBox.setSelected(true);
        }
        if (this.capturedImageActionScriptOutputInterface.isSaved()) {
            this.displayJCheckBox.setSelected(true);
        }
        this.capturedImageActionScriptOutputInterface.log();
    }

    private function update() : Void {
        var anyType : haxe.ds.Vector<Any> = this.itemTypesJList.getSelectedValues();
        var imageTypes : ImageTypes = ImageTypes.valueOf(anyType);
        this.capturedImageActionScriptOutputInterface.setImageTypes(imageTypes);
        if (this.saveJCheckBox.isSelected()) {
            this.capturedImageActionScriptOutputInterface.setSaved(true);
        } else {
            this.capturedImageActionScriptOutputInterface.setSaved(false);
        }
        if (this.displayJCheckBox.isSelected()) {
            this.capturedImageActionScriptOutputInterface.setDisplay(true);
        } else {
            this.capturedImageActionScriptOutputInterface.setDisplay(false);
        }
        this.capturedImageActionScriptOutputInterface.log();
    }

    private function setImageTypeJlistModel() : Void {
        var defaultListModel : DefaultListModel = new DefaultListModel();
        var vector : BasicArrayList = InputImageType.getAllAsVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var imageType : InputImageType = (cast vector.get(index) : InputImageType);
            defaultListModel.addElement(imageType.getName());
        }
        this.itemTypesJList.setModel(defaultListModel);
    }

    public function getCapturedImageActionJDialog() : javax.swing.JDialog {
        return this.capturedImageActionJDialog;
    }

    public function setCapturedImageActionJDialog(capturedImageActionJDialog : javax.swing.JDialog) : Void {
        this.capturedImageActionJDialog = capturedImageActionJDialog;
    }

    private function initComponents() : Void {
        this.capturedImageActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.okJButton = new javax.swing.JButton();
        this.saveJCheckBox = new javax.swing.JCheckBox();
        this.displayJCheckBox = new javax.swing.JCheckBox();
        this.jScrollPane1 = new javax.swing.JScrollPane();
        this.itemTypesJList = new javax.swing.JList();
        this.capturedImageActionJButton = new javax.swing.JButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.capturedImageActionJDialog.setMinimumSize(new java.awt.Dimension(250, 250));
        this.titleJLabel.setText("Image Output Options");
        this.okJButton.setText("OK");
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.saveJCheckBox.setText("Save To File");
        this.saveJCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.saveJCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.displayJCheckBox.setText("Display");
        this.displayJCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.displayJCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.displayJCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                displayJCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.itemTypesJList.setModel(/* anonymous class body:
            public var strings : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]);
            public function getSize() : Int {
                return strings.length;
            }

            public function getElementAt(i : Int) : Any {
                return strings[i];
            }

*/ new javax.swing.AbstractListModel());
        this.jScrollPane1.setViewportView(this.itemTypesJList);
        var capturedImageActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.capturedImageActionJDialog.getContentPane());
        this.capturedImageActionJDialog.getContentPane().setLayout(capturedImageActionJDialogLayout);
        capturedImageActionJDialogLayout.setHorizontalGroup(capturedImageActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addGroup(capturedImageActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addGap(61, 61, 61).addComponent(titleJLabel)).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addContainerGap().addGroup(capturedImageActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(capturedImageActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(displayJCheckBox).addComponent(saveJCheckBox, javax.swing.GroupLayout.Alignment.TRAILING)).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addGap(84, 84, 84).addComponent(okJButton)))).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addContainerGap().addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE))).addContainerGap()));
        capturedImageActionJDialogLayout.setVerticalGroup(capturedImageActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(capturedImageActionJDialogLayout.createSequentialGroup().addComponent(titleJLabel).addGap(5, 5, 5).addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 105, Short.MAX_VALUE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(saveJCheckBox).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(displayJCheckBox).addGap(9, 9, 9).addComponent(okJButton).addContainerGap()));
        setMinimumSize(new java.awt.Dimension(100, 0));
        this.capturedImageActionJButton.setText("Edit");
        this.capturedImageActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                capturedImageActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Capture Image:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(capturedImageActionJButton)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(capturedImageActionJButton)));
    }

    private function displayJCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.update();
        this.getCapturedImageActionJDialog().setVisible(false);
    }

    private function capturedImageActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.getCapturedImageActionJDialog().setVisible(true);
    }

    private var capturedImageActionJButton : javax.swing.JButton = null;
    private var capturedImageActionJDialog : javax.swing.JDialog = null;
    private var displayJCheckBox : javax.swing.JCheckBox = null;
    private var itemTypesJList : javax.swing.JList = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jScrollPane1 : javax.swing.JScrollPane = null;
    private var okJButton : javax.swing.JButton = null;
    private var saveJCheckBox : javax.swing.JCheckBox = null;
    private var titleJLabel : javax.swing.JLabel = null;
}

