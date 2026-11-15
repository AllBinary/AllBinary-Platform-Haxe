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
package org.allbinary.input.automation.actions.script;

//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import javax.swing.*;
//import javax.swing.tree.DefaultMutableTreeNode;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Node;

class ProfileActionScriptItem extends DefaultMutableTreeNode implements ProfileActionScriptItemInterface implements ActionListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var jPopupMenu : JPopupMenu = null;
    private static final EDIT : String = "Edit";
    public static final DELETE : String = "Delete";
    public static final NEW_CONDITION : String = "New Condition";
    public static final NEW_INPUT : String = "New Input";
    public static final NEW_OUTPUT : String = "New Output";
    public static final NEW_COLOR_AT : String = "Color At";
    public static final NEW_TIME_INTERVAL : String = "Time Interval";
    public static final NEW_ALWAYS : String = "Always On/Off";
    public static final NEW_KEY_INPUT : String = "Key";
    public static final NEW_MOUSE_INPUT : String = "Mouse";
    public static final NEW_JOYSTICK_INPUT : String = "Joystick";
    public static final NEW_IMAGE_OUTPUT : String = "Image";
    public function new(label : String, node : Node) {
        super(label);
        this.init();
        this.logUtil.putF("Label: " + label, this, this.commonStrings.CONSTRUCTOR);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(label : String) {
        super(label);
        this.init();
        this.logUtil.putF("Label: " + label, this, this.commonStrings.CONSTRUCTOR);
    }

    private function init() : Void {
        this.setJPopupMenu(new JPopupMenu());
        var jMenuItemEdit : JMenuItem = new JMenuItem(EDIT);
        var jMenuItemDelete : JMenuItem = new JMenuItem(DELETE);
        jMenuItemEdit.addActionListener(this);
        jMenuItemDelete.addActionListener(this);
        this.getJPopupMenu().add(jMenuItemEdit);
        this.getJPopupMenu().add(jMenuItemDelete);
    }

    // throws Exception
    public function process(frame : Null<haxe.Int64>) : Void {
        throw new haxe.Exception();
    }

    public function getJPopupMenu() : JPopupMenu {
        return this.jPopupMenu;
    }

    public function showDialog() : Void {
        throw new haxe.Exception();
    }

    public function actionPerformed(actionEvent : ActionEvent) : Void {
        if (actionEvent.getActionCommand().compareTo(ProfileActionScriptItem.EDIT) == 0) {
            this.showDialog();
        }
    }

    public function setJPopupMenu(jPopupMenu : JPopupMenu) : Void {
        this.jPopupMenu = jPopupMenu;
    }

}

