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
package org.allbinary.input.automation.module.generic.configuration;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class GenericModuleConfigurationJPanel extends javax.swing.JPanel implements GenericModuleConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var genericProfiles : GenericProfiles = null;
    private var selectedGenericProfile : GenericProfile = null;
    public function new() {
        super();
        this.initComponents();
        this.setGenericProfiles(new GenericProfiles(GenericProfiles.DEFAULT_FILE));
        this.selectFirstElement();
    }

    private function initComponents() : Void {
        this.newProfileJDialog = new javax.swing.JDialog();
        this.okNewProfileJButton = new javax.swing.JButton();
        this.newProfileNameJLabel = new javax.swing.JLabel();
        this.newProfileNameJTextField = new javax.swing.JTextField();
        this.buttonGroup2 = new javax.swing.ButtonGroup();
        this.genericJTabbedPane = new javax.swing.JTabbedPane();
        this.genericProfilesJPanel = new javax.swing.JPanel();
        this.genericProfilesJScrollPane = new javax.swing.JScrollPane();
        this.genericProfilesJList = new javax.swing.JList();
        this.newProfileJButton = new javax.swing.JButton();
        this.deleteProfileJButton = new javax.swing.JButton();
        this.jPanel1 = new javax.swing.JPanel();
        this.screenCaptureJRadioButton = new javax.swing.JRadioButton();
        this.jLabel1 = new javax.swing.JLabel();
        this.jLabel2 = new javax.swing.JLabel();
        this.savedCaptureJRadioButton = new javax.swing.JRadioButton();
        this.captureMotionAnalysisJCheckBox = new javax.swing.JCheckBox();
        this.captureComparisonJCheckBox = new javax.swing.JCheckBox();
        this.jLabel3 = new javax.swing.JLabel();
        this.blankGenericProfileActionsJPanel = new javax.swing.JPanel();
        this.newProfileJDialog.setMinimumSize(new java.awt.Dimension(250, 150));
        this.newProfileJDialog.setResizable(false);
        this.okNewProfileJButton.setText("Ok");
        this.okNewProfileJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okNewProfileJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.newProfileNameJLabel.setText("New Profile Name");
        var newProfileJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.newProfileJDialog.getContentPane());
        this.newProfileJDialog.getContentPane().setLayout(newProfileJDialogLayout);
        newProfileJDialogLayout.setHorizontalGroup(newProfileJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(newProfileJDialogLayout.createSequentialGroup().addGroup(newProfileJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(newProfileJDialogLayout.createSequentialGroup().addGap(80, 80, 80).addComponent(newProfileNameJLabel)).addGroup(newProfileJDialogLayout.createSequentialGroup().addGap(30, 30, 30).addComponent(newProfileNameJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(newProfileJDialogLayout.createSequentialGroup().addGap(100, 100, 100).addComponent(okNewProfileJButton))).addContainerGap(35, Short.MAX_VALUE)));
        newProfileJDialogLayout.setVerticalGroup(newProfileJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(newProfileJDialogLayout.createSequentialGroup().addGap(10, 10, 10).addComponent(newProfileNameJLabel).addGap(16, 16, 16).addComponent(newProfileNameJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(20, 20, 20).addComponent(okNewProfileJButton)));
        setLayout(new java.awt.GridLayout(1, 0));
        setMinimumSize(new java.awt.Dimension(400, 300));
        setPreferredSize(new java.awt.Dimension(700, 700));
        this.genericJTabbedPane.setToolTipText(this.stringUtil.EMPTY_STRING);
        this.genericJTabbedPane.setMinimumSize(new java.awt.Dimension(800, 600));
        this.genericProfilesJPanel.setMinimumSize(new java.awt.Dimension(400, 300));
        this.genericProfilesJPanel.setPreferredSize(new java.awt.Dimension(0, 0));
        this.genericProfilesJList.addListSelectionListener(/* anonymous class body:
            public function valueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
                genericProfilesJListValueChanged(evt);
            }

*/ new javax.swing.event.ListSelectionListener());
        this.genericProfilesJScrollPane.setViewportView(this.genericProfilesJList);
        this.newProfileJButton.setText("New");
        this.newProfileJButton.setToolTipText("Creates a new profile");
        this.newProfileJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newProfileJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.deleteProfileJButton.setText("Delete");
        this.deleteProfileJButton.setToolTipText("Deletes the selected profile");
        this.deleteProfileJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                deleteProfileJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jPanel1.setPreferredSize(new java.awt.Dimension(1000, 100));
        this.screenCaptureJRadioButton.setText("Screen Captures");
        this.screenCaptureJRadioButton.setToolTipText("Records the screen into memory for logical processing");
        this.screenCaptureJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.screenCaptureJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.screenCaptureJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                screenCaptureJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Profile Options");
        this.jLabel2.setText("Process From:");
        this.savedCaptureJRadioButton.setText("Saved Images");
        this.savedCaptureJRadioButton.setToolTipText("Loads images from files for logical processing.  Usually for debugging your profile actions");
        this.savedCaptureJRadioButton.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.savedCaptureJRadioButton.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.savedCaptureJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                savedCaptureJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.captureMotionAnalysisJCheckBox.setText("Motion Analysis");
        this.captureMotionAnalysisJCheckBox.setToolTipText("Uses image comparison and contraints to locate moving objects");
        this.captureMotionAnalysisJCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.captureMotionAnalysisJCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.captureMotionAnalysisJCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                captureMotionAnalysisJCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.captureComparisonJCheckBox.setText("Comparison");
        this.captureComparisonJCheckBox.setToolTipText("Compares the last two input images for multi image logic");
        this.captureComparisonJCheckBox.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        this.captureComparisonJCheckBox.setMargin(new java.awt.Insets(0, 0, 0, 0));
        this.captureComparisonJCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                captureComparisonJCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel3.setText("Image Processing:");
        this.jLabel3.setToolTipText("Turns on/off various extended image processing");
        var jPanel1Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(screenCaptureJRadioButton).addComponent(jLabel1).addComponent(jLabel2).addComponent(savedCaptureJRadioButton).addComponent(captureMotionAnalysisJCheckBox).addComponent(captureComparisonJCheckBox).addComponent(jLabel3)).addContainerGap(22, Short.MAX_VALUE)));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel2).addGap(7, 7, 7).addComponent(screenCaptureJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(savedCaptureJRadioButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel3).addGap(7, 7, 7).addComponent(captureComparisonJCheckBox).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(captureMotionAnalysisJCheckBox).addContainerGap(106, Short.MAX_VALUE)));
        var genericProfilesJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.genericProfilesJPanel);
        this.genericProfilesJPanel.setLayout(genericProfilesJPanelLayout);
        genericProfilesJPanelLayout.setHorizontalGroup(genericProfilesJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(genericProfilesJPanelLayout.createSequentialGroup().addGroup(genericProfilesJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(genericProfilesJPanelLayout.createSequentialGroup().addComponent(newProfileJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(deleteProfileJButton)).addGroup(genericProfilesJPanelLayout.createSequentialGroup().addComponent(genericProfilesJScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 119, Short.MAX_VALUE))).addContainerGap()));
        genericProfilesJPanelLayout.setVerticalGroup(genericProfilesJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(genericProfilesJPanelLayout.createSequentialGroup().addGroup(genericProfilesJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(newProfileJButton).addComponent(deleteProfileJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(genericProfilesJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE).addComponent(genericProfilesJScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE))));
        this.genericJTabbedPane.addTab("Profiles", genericProfilesJPanel);
        var blankGenericProfileActionsJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.blankGenericProfileActionsJPanel);
        this.blankGenericProfileActionsJPanel.setLayout(blankGenericProfileActionsJPanelLayout);
        blankGenericProfileActionsJPanelLayout.setHorizontalGroup(blankGenericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 395, Short.MAX_VALUE));
        blankGenericProfileActionsJPanelLayout.setVerticalGroup(blankGenericProfileActionsJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 275, Short.MAX_VALUE));
        this.genericJTabbedPane.addTab("Actions", blankGenericProfileActionsJPanel);
        add(this.genericJTabbedPane);
    }

    private function savedCaptureJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            if (this.savedCaptureJRadioButton.isSelected()) {
                this.logUtil.putF("Selected", this, "savedCaptureJRadioButtonActionPerformed");
                this.getSelectedGenericProfile().add(GenericProfileDataWorkerType.SAVED_CAPTURE);
                this.getSelectedGenericProfile().remove(GenericProfileDataWorkerType.SCREEN_CAPTURE);
                this.screenCaptureJRadioButton.setSelected(false);
                this.getGenericProfiles().save();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "savedCaptureJRadioButtonActionPerformed", e);
        }
    }

    private function screenCaptureJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            if (this.screenCaptureJRadioButton.isSelected()) {
                this.logUtil.putF("Selected", this, "screenCaptureJRadioButtonActionPerformed");
                this.getSelectedGenericProfile().add(GenericProfileDataWorkerType.SCREEN_CAPTURE);
                this.getSelectedGenericProfile().remove(GenericProfileDataWorkerType.SAVED_CAPTURE);
                this.savedCaptureJRadioButton.setSelected(false);
                this.getGenericProfiles().save();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "screenCaptureJRadioButtonActionPerformed", e);
        }
    }

    private function captureMotionAnalysisJCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            if (this.captureMotionAnalysisJCheckBox.isSelected()) {
                this.getSelectedGenericProfile().add(GenericProfileDataWorkerType.MOTION);
            } else {
                this.getSelectedGenericProfile().remove(GenericProfileDataWorkerType.MOTION);
            }
            this.getGenericProfiles().save();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "captureComparisonJCheckBoxActionPerformed", e);
        }
    }

    private function captureComparisonJCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            if (this.captureComparisonJCheckBox.isSelected()) {
                this.getSelectedGenericProfile().add(GenericProfileDataWorkerType.COMPARISON);
            } else {
                this.getSelectedGenericProfile().remove(GenericProfileDataWorkerType.COMPARISON);
            }
            this.getGenericProfiles().save();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "captureComparisonJCheckBoxActionPerformed", e);
        }
    }

    // throws Exception
    private function updateProfileUI(profileNameString : String) : Void {
        this.getBlankGenericProfileActionsJPanel().removeAll();
        if (profileNameString != null) {
            var genericProfileActionsJPanel : GenericProfileActionsJPanel = new GenericProfileActionsJPanel();
            this.setSelectedGenericProfile(this.getGenericProfiles().get(profileNameString));
            this.getSelectedGenericProfile().setGenericProfileActions(new GenericProfileActions(genericProfileActionsJPanel, profileNameString));
            genericProfileActionsJPanel.setGenericProfileActions(this.getSelectedGenericProfile().getGenericProfileActions());
            genericProfileActionsJPanel.selectFirstElement();
            var layout : javax.swing.GroupLayout = (cast this.getBlankGenericProfileActionsJPanel().getLayout() : javax.swing.GroupLayout);
            layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 395, Short.MAX_VALUE).addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
            layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 256, Short.MAX_VALUE).addComponent(genericProfileActionsJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
            this.updateProfileOptions();
            this.logUtil.putF("Setting Configuration Profile JPanel", this, "updateProfileUI");
        } else {
            this.logUtil.putF("Null Configuration Profile", this, "updateProfileUI");
        }
    }

    // throws Exception
    private function selectFirstElement() : Void {
        this.genericProfilesJList.setModel(this.getGenericProfiles().getDefaultListModelHelper().getListModel());
        if (this.genericProfilesJList.getModel().getSize() > 0) {
            this.genericProfilesJList.setSelectedValue(this.genericProfilesJList.getModel().getElementAt(0), true);
            this.updateProfileUI((cast this.genericProfilesJList.getModel().getElementAt(0) : String));
        }
    }

    // throws Exception
    private function updateProfileOptions() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "updateProfileOptions");
        var genericProfile : GenericProfile = this.getSelectedGenericProfile();
        var vector : BasicArrayList = genericProfile.getGenericProfileDataWorkerTypeVector();
        this.screenCaptureJRadioButton.setSelected(false);
        this.savedCaptureJRadioButton.setSelected(false);
        this.captureComparisonJCheckBox.setSelected(false);
        this.captureMotionAnalysisJCheckBox.setSelected(false);
        final size : Int = vector.size();
        for (index in 0...size) {
            var genericProfileDataWorkerType : GenericProfileDataWorkerType = (cast vector.get(index) : GenericProfileDataWorkerType);
            this.logUtil.putF(genericProfile.getName() + " has GenericProfileDataWorkerType: " + genericProfileDataWorkerType.toString(), this, "updateProfileOptions");
            if (genericProfileDataWorkerType == GenericProfileDataWorkerType.SCREEN_CAPTURE) {
                this.logUtil.putF("Screen Capture Selected", this, "updateProfileOptions");
                this.screenCaptureJRadioButton.setSelected(true);
            } else if (genericProfileDataWorkerType == GenericProfileDataWorkerType.SAVED_CAPTURE) {
                this.logUtil.putF("Saved Capture Selected", this, "updateProfileOptions");
                this.savedCaptureJRadioButton.setSelected(true);
            } else if (genericProfileDataWorkerType == GenericProfileDataWorkerType.COMPARISON) {
                this.logUtil.putF("Checking Comparison Box", this, "updateProfileOptions");
                this.captureComparisonJCheckBox.setSelected(true);
            } else if (genericProfileDataWorkerType == GenericProfileDataWorkerType.MOTION) {
                this.logUtil.putF("Checking Motion Box", this, "updateProfileOptions");
                this.captureMotionAnalysisJCheckBox.setSelected(true);
            }
        }
        if (!this.screenCaptureJRadioButton.isSelected() && !this.savedCaptureJRadioButton.isSelected()) {
            this.screenCaptureJRadioButton.setSelected(true);
            this.getSelectedGenericProfile().add(GenericProfileDataWorkerType.SCREEN_CAPTURE);
        }
        this.logUtil.putF(this.commonStrings.END, this, "updateProfileOptions");
    }

    public function getBlankGenericProfileActionsJPanel() : javax.swing.JPanel {
        return this.blankGenericProfileActionsJPanel;
    }

    public function setBlankGenericProfileActionsJPanel(blankGenericProfileActionsJPanel : javax.swing.JPanel) : Void {
        this.blankGenericProfileActionsJPanel = blankGenericProfileActionsJPanel;
    }

    private function getGenericProfiles() : GenericProfiles {
        return this.genericProfiles;
    }

    private function setGenericProfiles(genericProfiles : GenericProfiles) : Void {
        this.genericProfiles = genericProfiles;
    }

    public function getSelectedGenericProfile() : GenericProfile {
        return this.selectedGenericProfile;
    }

    public function setSelectedGenericProfile(selectedGenericProfile : GenericProfile) : Void {
        this.selectedGenericProfile = selectedGenericProfile;
    }

    private function genericProfilesJListValueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
        try {
            var profileNameString : String = (cast this.genericProfilesJList.getSelectedValue() : String);
            this.updateProfileUI(profileNameString);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "genericProfilesJListValueChanged", e);
        }
    }

    private function deleteProfileJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            var anyType : haxe.ds.Vector<Any> = this.genericProfilesJList.getSelectedValues();
            for (index in 0...anyType.length) {
                var nextSelectedValueString : String = (cast anyType[index] : String);
                this.getGenericProfiles().remove(nextSelectedValueString);
            }
            this.selectFirstElement();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "deleteProfileJButtonActionPerformed", e);
        }
    }

    private function okNewProfileJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            var newProfileName : String = this.newProfileNameJTextField.getText();
            this.getGenericProfiles().add(newProfileName);
            this.genericProfilesJList.setModel(this.getGenericProfiles().getDefaultListModelHelper().getListModel());
            this.genericProfilesJList.setSelectedValue(newProfileName, true);
            this.newProfileJDialog.setVisible(false);
            this.updateProfileUI(newProfileName);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "okNewProfileJButtonActionPerformed", e);
        }
    }

    private function newProfileJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.newProfileJDialog.setVisible(true);
    }

    private var blankGenericProfileActionsJPanel : javax.swing.JPanel = null;
    private var buttonGroup2 : javax.swing.ButtonGroup = null;
    private var captureComparisonJCheckBox : javax.swing.JCheckBox = null;
    private var captureMotionAnalysisJCheckBox : javax.swing.JCheckBox = null;
    private var deleteProfileJButton : javax.swing.JButton = null;
    private var genericJTabbedPane : javax.swing.JTabbedPane = null;
    private var genericProfilesJList : javax.swing.JList = null;
    private var genericProfilesJPanel : javax.swing.JPanel = null;
    private var genericProfilesJScrollPane : javax.swing.JScrollPane = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLabel3 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var newProfileJButton : javax.swing.JButton = null;
    private var newProfileJDialog : javax.swing.JDialog = null;
    private var newProfileNameJLabel : javax.swing.JLabel = null;
    private var newProfileNameJTextField : javax.swing.JTextField = null;
    private var okNewProfileJButton : javax.swing.JButton = null;
    private var savedCaptureJRadioButton : javax.swing.JRadioButton = null;
    private var screenCaptureJRadioButton : javax.swing.JRadioButton = null;
}

