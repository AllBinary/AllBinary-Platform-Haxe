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

import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel;
import org.allbinary.logic.communication.log.LogUtil;

class RemoveActionScriptItemJPanel extends java.awt.Panel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var genericProfileActionJPanel : GenericProfileActionJPanel;
    private var profileActionScriptConditionInterface : ProfileActionScriptConditionInterface;
    public function new(genericProfileActionJPanel : GenericProfileActionJPanel, profileActionScriptConditionInterface : ProfileActionScriptConditionInterface) {
        super();
        this.initComponents();
        this.genericProfileActionJPanel = genericProfileActionJPanel;
        this.profileActionScriptConditionInterface = profileActionScriptConditionInterface;
    }

    private function initComponents() : Void {
        this.removeJButton = new javax.swing.JButton();
        setLayout(new java.awt.GridLayout());
        this.removeJButton.setText("Remove");
        this.removeJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                removeJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        add(this.removeJButton);
    }

    private function removeJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        final genericProfileAction : GenericProfileAction = this.genericProfileActionJPanel.getGenericProfileAction();
        if (genericProfileAction == null) {
            this.logUtil.putF("GenericProfileAction was null", this, "removeJButtonActionPerformed");
            return;
        }
        genericProfileAction.getGenericProfileActionScript().removeCondition(this.profileActionScriptConditionInterface);
        this.genericProfileActionJPanel.updateProfileActionUI();
    }

    private var removeJButton : javax.swing.JButton = null;
}

