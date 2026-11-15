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

import org.allbinary.input.automation.module.DefaultListModelHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class GenericProfileActionsJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var genericProfileActions : GenericProfileActions = null;
    private var genericProfileActionJPanel : GenericProfileActionJPanel = null;
    public function new() {
        super();
        this.initComponents();
    }

    private function initComponents() : Void {
        this.newProfileActionJDialog = new javax.swing.JDialog();
        this.newProfileActionJLabel = new javax.swing.JLabel();
        this.okNewProfileActionJButton = new javax.swing.JButton();
        this.newProfileActionJTextField = new javax.swing.JTextField();
        this.genericProfileActionsJPanel = new javax.swing.JPanel();
        this.genericProfileActionsJScrollPane = new javax.swing.JScrollPane();
        this.genericProfileActionsJList = new javax.swing.JList();
        this.newActionJButton = new javax.swing.JButton();
        this.deleteActionJButton = new javax.swing.JButton();
        this.saveJButton = new javax.swing.JButton();
        this.blankGenericProfileActionJPanel = new javax.swing.JPanel();
        this.newProfileActionJDialog.setMinimumSize(new java.awt.Dimension(250, 150));
        this.newProfileActionJDialog.setResizable(false);
        this.newProfileActionJLabel.setText("New Action Name");
        this.okNewProfileActionJButton.setText("Ok");
        this.okNewProfileActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okNewProfileActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var newProfileActionJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.newProfileActionJDialog.getContentPane());
        this.newProfileActionJDialog.getContentPane().setLayout(newProfileActionJDialogLayout);
        newProfileActionJDialogLayout.setHorizontalGroup(newProfileActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(newProfileActionJDialogLayout.createSequentialGroup().addGroup(newProfileActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(newProfileActionJDialogLayout.createSequentialGroup().addGap(93, 93, 93).addComponent(okNewProfileActionJButton)).addGroup(newProfileActionJDialogLayout.createSequentialGroup().addGap(75, 75, 75).addComponent(newProfileActionJLabel)).addGroup(newProfileActionJDialogLayout.createSequentialGroup().addGap(29, 29, 29).addComponent(newProfileActionJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE))).addContainerGap(34, Short.MAX_VALUE)));
        newProfileActionJDialogLayout.setVerticalGroup(newProfileActionJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, newProfileActionJDialogLayout.createSequentialGroup().addContainerGap().addComponent(newProfileActionJLabel).addGap(21, 21, 21).addComponent(newProfileActionJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 20, Short.MAX_VALUE).addComponent(okNewProfileActionJButton).addContainerGap()));
        this.genericProfileActionsJPanel.setPreferredSize(new java.awt.Dimension(10000, 10000));
        this.genericProfileActionsJList.addListSelectionListener(/* anonymous class body:
            public function valueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
                genericProfileActionsJListValueChanged(evt);
            }

*/ new javax.swing.event.ListSelectionListener());
        this.genericProfileActionsJScrollPane.setViewportView(this.genericProfileActionsJList);
        this.newActionJButton.setText("New");
        this.newActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.deleteActionJButton.setText("Delete");
        this.deleteActionJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                deleteActionJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.saveJButton.setText("Save");
        this.saveJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                saveJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.blankGenericProfileActionJPanel.setMinimumSize(new java.awt.Dimension(500, 300));
        var blankGenericProfileActionJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.blankGenericProfileActionJPanel);
        this.blankGenericProfileActionJPanel.setLayout(blankGenericProfileActionJPanelLayout);
        blankGenericProfileActionJPanelLayout.setHorizontalGroup(blankGenericProfileActionJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 500, Short.MAX_VALUE));
        blankGenericProfileActionJPanelLayout.setVerticalGroup(blankGenericProfileActionJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 296, Short.MAX_VALUE));
        var genericProfileActionsJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.genericProfileActionsJPanel);
        this.genericProfileActionsJPanel.setLayout(genericProfileActionsJPanelLayout);
        genericProfileActionsJPanelLayout.setHorizontalGroup(genericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(genericProfileActionsJPanelLayout.createSequentialGroup().addComponent(genericProfileActionsJScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(blankGenericProfileActionJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)).addGroup(genericProfileActionsJPanelLayout.createSequentialGroup().addComponent(newActionJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(deleteActionJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(saveJButton).addContainerGap()));
        genericProfileActionsJPanelLayout.setVerticalGroup(genericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(genericProfileActionsJPanelLayout.createSequentialGroup().addGroup(genericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(newActionJButton).addComponent(deleteActionJButton).addComponent(saveJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(genericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addComponent(blankGenericProfileActionJPanel, 0, 296, Short.MAX_VALUE).addComponent(genericProfileActionsJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 296, Short.MAX_VALUE)).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 596, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 336, javax.swing.GroupLayout.PREFERRED_SIZE));
    }

    public function setModel() : Void {
        var defaultListModelHelper : DefaultListModelHelper = this.getGenericProfileActions().getDefaultListModelHelper();
        if (defaultListModelHelper.getListModel().getSize() > 0) {
            this.genericProfileActionsJList.setModel(defaultListModelHelper.getListModel());
        }
    }

    private function saveJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.getGenericProfileActions().save();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "saveJButtonActionPerformed", e);
        }
    }

    private function updateProfileActionUI(profileActionNameString : String) : Void {
        this.blankGenericProfileActionJPanel.removeAll();
        if (profileActionNameString != null) {
            var genericProfileAction : GenericProfileAction = this.getGenericProfileActions().getAction(profileActionNameString);
            this.setGenericProfileActionJPanel(new GenericProfileActionJPanel());
            this.getGenericProfileActionJPanel().setGenericProfileAction(genericProfileAction);
            this.getGenericProfileActionJPanel().updateProfileActionUI();
            var layout : javax.swing.GroupLayout = (cast this.blankGenericProfileActionJPanel.getLayout() : javax.swing.GroupLayout);
            layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 395, Short.MAX_VALUE).addComponent(this.getGenericProfileActionJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
            layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 256, Short.MAX_VALUE).addComponent(this.getGenericProfileActionJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
            this.logUtil.putF("Setting Configuration Profile Actions JPanel", this, "genericProfileActionsJListValueChanged");
        }
    }

    private function genericProfileActionsJListValueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
        try {
            var profileActionNameString : String = (cast this.genericProfileActionsJList.getSelectedValue() : String);
            this.updateProfileActionUI(profileActionNameString);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "genericProfileActionsJListValueChanged", e);
        }
    }

    private function okNewProfileActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            var newActionName : String = this.newProfileActionJTextField.getText();
            this.getGenericProfileActions().add(newActionName);
            this.setModel();
            this.genericProfileActionsJList.setSelectedValue(newActionName, true);
            this.newProfileActionJDialog.setVisible(false);
            this.updateProfileActionUI(newActionName);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "okNewProfileActionJButtonActionPerformed", e);
        }
    }

    private function deleteActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            var anyType : haxe.ds.Vector<Any> = this.genericProfileActionsJList.getSelectedValues();
            for (index in 0...anyType.length) {
                var nextSelectedValueString : String = (cast anyType[index] : String);
                this.getGenericProfileActions().remove(nextSelectedValueString);
            }
            this.selectFirstElement();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "deleteActionJButtonActionPerformed", e);
        }
    }

    // throws Exception
    public function selectFirstElement() : Void {
        this.setModel();
        if (this.genericProfileActionsJList.getModel().getSize() > 0) {
            this.genericProfileActionsJList.setSelectedValue(this.genericProfileActionsJList.getModel().getElementAt(0), true);
            this.updateProfileActionUI((cast this.genericProfileActionsJList.getModel().getElementAt(0) : String));
        } else {
            this.blankGenericProfileActionJPanel.removeAll();
            this.blankGenericProfileActionJPanel.repaint();
        }
    }

    public function getGenericProfileActionJPanel() : GenericProfileActionJPanel {
        return this.genericProfileActionJPanel;
    }

    public function setGenericProfileActionJPanel(genericProfileActionJPanel : GenericProfileActionJPanel) : Void {
        this.genericProfileActionJPanel = genericProfileActionJPanel;
    }

    public function getGenericProfileActions() : GenericProfileActions {
        return this.genericProfileActions;
    }

    public function setGenericProfileActions(genericProfileActions : GenericProfileActions) : Void {
        this.genericProfileActions = genericProfileActions;
    }

    private function newActionJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.newProfileActionJDialog.setVisible(true);
    }

    private var blankGenericProfileActionJPanel : javax.swing.JPanel = null;
    private var deleteActionJButton : javax.swing.JButton = null;
    private var genericProfileActionsJList : javax.swing.JList = null;
    private var genericProfileActionsJPanel : javax.swing.JPanel = null;
    private var genericProfileActionsJScrollPane : javax.swing.JScrollPane = null;
    private var newActionJButton : javax.swing.JButton = null;
    private var newProfileActionJDialog : javax.swing.JDialog = null;
    private var newProfileActionJLabel : javax.swing.JLabel = null;
    private var newProfileActionJTextField : javax.swing.JTextField = null;
    private var okNewProfileActionJButton : javax.swing.JButton = null;
    private var saveJButton : javax.swing.JButton = null;
}

