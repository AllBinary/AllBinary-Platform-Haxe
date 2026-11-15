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
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.media.image.analysis.ColorRangeInterface;
import org.allbinary.string.CommonStrings;

class ColorAtActionScriptConditionJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var colorAtActionScriptConditionInterface : ColorAtActionScriptConditionInterface;
    public function new(colorAtActionScriptConditionInterface : ColorAtActionScriptConditionInterface) {
        super();
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.colorAtActionScriptConditionInterface = colorAtActionScriptConditionInterface;
        this.set();
    }

    private function set() : Void {
        var colorRangeInterface : ColorRangeInterface = this.colorAtActionScriptConditionInterface.getColorRangeInterface();
        this.getMinRedJTextField().setText(Std.string(colorRangeInterface.getMinRed()));
        this.getMaxRedJTextField().setText(Std.string(colorRangeInterface.getMaxRed()));
        this.getMinGreenJTextField().setText(Std.string(colorRangeInterface.getMinGreen()));
        this.getMaxGreenJTextField().setText(Std.string(colorRangeInterface.getMaxGreen()));
        this.getMinBlueJTextField().setText(Std.string(colorRangeInterface.getMinBlue()));
        this.getMaxBlueJTextField().setText(Std.string(colorRangeInterface.getMaxBlue()));
        this.getColorAtXJTextField().setText(Std.string(this.colorAtActionScriptConditionInterface.getPoint().x));
        this.getColorAtYJTextField().setText(Std.string(this.colorAtActionScriptConditionInterface.getPoint().y));
        this.colorAtActionScriptConditionInterface.log();
    }

    private function update() : Void {
        var colorRangeInterface : ColorRangeInterface = this.colorAtActionScriptConditionInterface.getColorRangeInterface();
        colorRangeInterface.setMinRed(Std.int(Std.string(this.getMinRedJTextField().getText())));
        colorRangeInterface.setMaxRed(Std.int(Std.string(this.getMaxRedJTextField().getText())));
        colorRangeInterface.setMinGreen(Std.int(Std.string(this.getMinGreenJTextField().getText())));
        colorRangeInterface.setMaxGreen(Std.int(Std.string(this.getMaxGreenJTextField().getText())));
        colorRangeInterface.setMinBlue(Std.int(Std.string(this.getMinBlueJTextField().getText())));
        colorRangeInterface.setMaxBlue(Std.int(Std.string(this.getMaxBlueJTextField().getText())));
        var xString : String = this.getColorAtXJTextField().getText();
        if (!StringValidationUtil.getInstance().isEmpty(xString) && StringValidationUtil.getInstance().isNumber(xString)) {
            this.colorAtActionScriptConditionInterface.getPoint().x = Std.parseInt(xString);
        }
        var yString : String = this.getColorAtYJTextField().getText();
        if (!StringValidationUtil.getInstance().isEmpty(yString) && StringValidationUtil.getInstance().isNumber(yString)) {
            this.colorAtActionScriptConditionInterface.getPoint().y = Std.parseInt(xString);
        }
        this.colorAtActionScriptConditionInterface.log();
    }

    public function getColorAtXJTextField() : javax.swing.JTextField {
        return this.colorAtXJTextField;
    }

    public function setColorAtXJTextField(colorAtXJTextField : javax.swing.JTextField) : Void {
        this.colorAtXJTextField = colorAtXJTextField;
    }

    public function getColorAtYJTextField() : javax.swing.JTextField {
        return this.colorAtYJTextField;
    }

    public function setColorAtYJTextField(colorAtYJTextField : javax.swing.JTextField) : Void {
        this.colorAtYJTextField = colorAtYJTextField;
    }

    public function getMaxBlueJTextField() : javax.swing.JTextField {
        return this.maxBlueJTextField;
    }

    public function setMaxBlueJTextField(maxBlueJTextField : javax.swing.JTextField) : Void {
        this.maxBlueJTextField = maxBlueJTextField;
    }

    public function getMaxGreenJTextField() : javax.swing.JTextField {
        return this.maxGreenJTextField;
    }

    public function setMaxGreenJTextField(maxGreenJTextField : javax.swing.JTextField) : Void {
        this.maxGreenJTextField = maxGreenJTextField;
    }

    public function getMaxRedJTextField() : javax.swing.JTextField {
        return this.maxRedJTextField;
    }

    public function setMaxRedJTextField(maxRedJTextField : javax.swing.JTextField) : Void {
        this.maxRedJTextField = maxRedJTextField;
    }

    public function getMinBlueJTextField() : javax.swing.JTextField {
        return this.minBlueJTextField;
    }

    public function setMinBlueJTextField(minBlueJTextField : javax.swing.JTextField) : Void {
        this.minBlueJTextField = minBlueJTextField;
    }

    public function getMinGreenJTextField() : javax.swing.JTextField {
        return this.minGreenJTextField;
    }

    public function setMinGreenJTextField(minGreenJTextField : javax.swing.JTextField) : Void {
        this.minGreenJTextField = minGreenJTextField;
    }

    public function getMinRedJTextField() : javax.swing.JTextField {
        return this.minRedJTextField;
    }

    public function setMinRedJTextField(minRedJTextField : javax.swing.JTextField) : Void {
        this.minRedJTextField = minRedJTextField;
    }

    public function getYJLabel() : javax.swing.JLabel {
        return this.yJLabel;
    }

    public function setYJLabel(yJLabel : javax.swing.JLabel) : Void {
        this.yJLabel = yJLabel;
    }

    public function getColorAtActionJDialog() : javax.swing.JDialog {
        return this.colorAtActionJDialog;
    }

    public function setColorAtActionJDialog(colorAtActionJDialog : javax.swing.JDialog) : Void {
        this.colorAtActionJDialog = colorAtActionJDialog;
    }

    private function initComponents() : Void {
        this.colorAtActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.locationJLabel = new javax.swing.JLabel();
        this.colorAtXJTextField = new javax.swing.JTextField();
        this.xJLabel = new javax.swing.JLabel();
        this.yJLabel = new javax.swing.JLabel();
        this.colorAtYJTextField = new javax.swing.JTextField();
        this.colorRangeJLabel = new javax.swing.JLabel();
        this.redJLabel = new javax.swing.JLabel();
        this.minJLabel = new javax.swing.JLabel();
        this.maxJLabel = new javax.swing.JLabel();
        this.greenJLabel = new javax.swing.JLabel();
        this.blueJLabel = new javax.swing.JLabel();
        this.minRedJTextField = new javax.swing.JTextField();
        this.maxRedJTextField = new javax.swing.JTextField();
        this.maxGreenJTextField = new javax.swing.JTextField();
        this.minBlueJTextField = new javax.swing.JTextField();
        this.maxBlueJTextField = new javax.swing.JTextField();
        this.okJButton = new javax.swing.JButton();
        this.minGreenJTextField = new javax.swing.JTextField();
        this.colorAtActionJButton = new javax.swing.JButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.colorAtActionJDialog.setMinimumSize(new java.awt.Dimension(350, 250));
        this.titleJLabel.setText("              Color At Action Options            ");
        this.locationJLabel.setText("Location:");
        this.xJLabel.setText("X:");
        this.yJLabel.setText("Y:");
        this.colorRangeJLabel.setText("Color Range");
        this.redJLabel.setText("Red:");
        this.minJLabel.setText("Minimum");
        this.maxJLabel.setText("Maximum");
        this.greenJLabel.setText("Green:");
        this.blueJLabel.setText("Blue:");
        this.okJButton.setText("OK");
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var colorAtActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.colorAtActionJDialog.getContentPane());
        this.colorAtActionJDialog.getContentPane().setLayout(colorAtActionJDialogLayout);
        colorAtActionJDialogLayout.setHorizontalGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addContainerGap().addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(okJButton).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(blueJLabel).addComponent(greenJLabel).addComponent(redJLabel).addComponent(colorRangeJLabel)).addGap(29, 29, 29)).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout.createSequentialGroup().addComponent(locationJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(xJLabel).addGap(18, 18, 18))).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(minBlueJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE).addComponent(minGreenJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE).addComponent(minJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(minRedJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE).addComponent(colorAtXJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE)).addGap(16, 16, 16))).addGap(6, 6, 6).addComponent(yJLabel).addGap(24, 24, 24).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(maxJLabel, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addGroup(javax.swing.GroupLayout.Alignment.LEADING, colorAtActionJDialogLayout.createSequentialGroup().addGap(1, 1, 1).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addComponent(maxBlueJTextField, javax.swing.GroupLayout.Alignment.TRAILING).addComponent(maxRedJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 43, Short.MAX_VALUE).addComponent(maxGreenJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE))).addComponent(colorAtYJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 44, Short.MAX_VALUE)).addGap(22, 22, 22)).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, colorAtActionJDialogLayout.createSequentialGroup().addComponent(titleJLabel).addGap(33, 33, 33)))));
        colorAtActionJDialogLayout.setVerticalGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addContainerGap().addComponent(titleJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addGap(15, 15, 15).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(xJLabel).addComponent(locationJLabel).addComponent(colorAtXJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(yJLabel)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(minJLabel).addComponent(colorRangeJLabel)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(minRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(redJLabel)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(greenJLabel).addComponent(minGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(colorAtActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(blueJLabel).addComponent(minBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 17, Short.MAX_VALUE).addComponent(okJButton)).addGroup(colorAtActionJDialogLayout.createSequentialGroup().addGap(14, 14, 14).addComponent(colorAtYJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(maxJLabel).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(maxRedJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(maxGreenJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(maxBlueJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))).addContainerGap()));
        setPreferredSize(new java.awt.Dimension(100, 0));
        this.colorAtActionJButton.setText("Edit");
        this.colorAtActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                colorAtActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Color At:");
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE).addComponent(colorAtActionJButton)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(colorAtActionJButton)));
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.update();
        this.getColorAtActionJDialog().setVisible(false);
    }

    private function colorAtActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.getColorAtActionJDialog().setVisible(true);
    }

    private var blueJLabel : javax.swing.JLabel = null;
    private var colorAtActionJButton : javax.swing.JButton = null;
    private var colorAtActionJDialog : javax.swing.JDialog = null;
    private var colorAtXJTextField : javax.swing.JTextField = null;
    private var colorAtYJTextField : javax.swing.JTextField = null;
    private var colorRangeJLabel : javax.swing.JLabel = null;
    private var greenJLabel : javax.swing.JLabel = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var locationJLabel : javax.swing.JLabel = null;
    private var maxBlueJTextField : javax.swing.JTextField = null;
    private var maxGreenJTextField : javax.swing.JTextField = null;
    private var maxJLabel : javax.swing.JLabel = null;
    private var maxRedJTextField : javax.swing.JTextField = null;
    private var minBlueJTextField : javax.swing.JTextField = null;
    private var minGreenJTextField : javax.swing.JTextField = null;
    private var minJLabel : javax.swing.JLabel = null;
    private var minRedJTextField : javax.swing.JTextField = null;
    private var okJButton : javax.swing.JButton = null;
    private var redJLabel : javax.swing.JLabel = null;
    private var titleJLabel : javax.swing.JLabel = null;
    private var xJLabel : javax.swing.JLabel = null;
    private var yJLabel : javax.swing.JLabel = null;
}

