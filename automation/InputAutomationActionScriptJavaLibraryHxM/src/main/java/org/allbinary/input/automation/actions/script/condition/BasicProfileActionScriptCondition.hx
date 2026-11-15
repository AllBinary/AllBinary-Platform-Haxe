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

//import java.awt.event.ActionEvent;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.swing.*;
//import javax.swing.tree.TreePath;
import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory;
import org.allbinary.input.automation.actions.script.ProfileActionScriptItem;
import org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface;
import org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface;
import org.allbinary.input.automation.actions.script.condition.processors.input.GenericProfileActionScriptInputData;
import org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput;
import org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput;
import org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputFactory;
import org.allbinary.input.automation.module.actions.script.condition.processors.output.GenericProfileActionScriptOutputData;
import org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput;
import org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class BasicProfileActionScriptCondition extends ProfileActionScriptItem implements ProfileActionScriptConditionInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var profileActionProcessorInterfaceVector : BasicArrayList = null;
    private var profileActionConditionInterfaceVector : BasicArrayList = null;
    public function new(label : String, node : Node) {
        super(label, node);
        this.init();
        var nodeList : NodeList = node.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var actionItemNode : Node = nodeList.item(index);
            if (actionItemNode.getNodeType() == Node.ELEMENT_NODE) {
                if (actionItemNode.getNodeName().compareTo(GenericProfileActionScriptConditionData.NAME) == 0) {
                    this.addCondition(ProfileActionScriptConditionFactory.getInstance(actionItemNode));
                } else if (actionItemNode.getNodeName().compareTo(GenericProfileActionScriptInputData.NAME) == 0) {
                    this.addProcessor(ProfileActionScriptInputFactory.getInstance(actionItemNode));
                } else if (actionItemNode.getNodeName().compareTo(GenericProfileActionScriptOutputData.NAME) == 0) {
                    this.addProcessor(ProfileActionScriptOutputFactory.getInstance(actionItemNode));
                }
            }
        }
    }

    // throws Exception
    public function addProcessorNodes(node : Node) : Void {
        var nodeList : NodeList = node.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var processorActionItemNode : Node = nodeList.item(index);
            if (processorActionItemNode.getNodeName().compareTo(GenericProfileActionScriptInputData.NAME) == 0) {
                this.addProcessor(ProfileActionScriptInputFactory.getInstance(processorActionItemNode));
            } else if (processorActionItemNode.getNodeName().compareTo(GenericProfileActionScriptOutputData.NAME) == 0) {
                this.addProcessor(ProfileActionScriptOutputFactory.getInstance(processorActionItemNode));
            }
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(label : String) {
        super(label);
        this.init();
    }

    private function init() : Void {
        this.setProfileActionProcessorInterfaceVector(new BasicArrayListD());
        this.setProfileActionConditionInterfaceVector(new BasicArrayListD());
        this.getJPopupMenu().add(this.getConditionJPopupMenu());
        this.getJPopupMenu().add(this.getInputJPopupMenu());
        this.getJPopupMenu().add(this.getOutputJPopupMenu());
    }

    private function getConditionJPopupMenu() : JMenu {
        var jMenu : JMenu = new JMenu(NEW_CONDITION);
        var jMenuItemColorAt : JMenuItem = new JMenuItem(NEW_COLOR_AT);
        var jMenuItemAlways : JMenuItem = new JMenuItem(NEW_ALWAYS);
        var jMenuItemTimeInterval : JMenuItem = new JMenuItem(NEW_TIME_INTERVAL);
        jMenuItemColorAt.addActionListener(this);
        jMenuItemAlways.addActionListener(this);
        jMenuItemTimeInterval.addActionListener(this);
        jMenu.add(jMenuItemColorAt);
        jMenu.add(jMenuItemAlways);
        jMenu.add(jMenuItemTimeInterval);
        return jMenu;
    }

    private function getInputJPopupMenu() : JMenu {
        var jMenu : JMenu = new JMenu(NEW_INPUT);
        var jMenuItemKey : JMenuItem = new JMenuItem(NEW_KEY_INPUT);
        var jMenuItemMouse : JMenuItem = new JMenuItem(NEW_MOUSE_INPUT);
        var jMenuItemJoystick : JMenuItem = new JMenuItem(NEW_JOYSTICK_INPUT);
        jMenuItemKey.addActionListener(this);
        jMenuItemMouse.addActionListener(this);
        jMenuItemJoystick.addActionListener(this);
        jMenu.add(jMenuItemKey);
        jMenu.add(jMenuItemMouse);
        jMenu.add(jMenuItemJoystick);
        return jMenu;
    }

    private function getOutputJPopupMenu() : JMenu {
        var jMenu : JMenu = new JMenu(NEW_OUTPUT);
        var jMenuItemImage : JMenuItem = new JMenuItem(NEW_IMAGE_OUTPUT);
        jMenuItemImage.addActionListener(this);
        jMenu.add(jMenuItemImage);
        return jMenu;
    }

    public function addProcessor(profileActionProcessorInterface : ProfileActionScriptProcessorInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "addInput");
        this.getProfileActionProcessorInterfaceVector().add(profileActionProcessorInterface);
        this.add(profileActionProcessorInterface);
    }

    public function removeProcessor(profileActionProcessorInterface : ProfileActionScriptProcessorInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "removeInput");
        this.getProfileActionProcessorInterfaceVector().remove(profileActionProcessorInterface);
        this.remove(profileActionProcessorInterface);
    }

    public function removeCondition(profileActionScriptNodeInterface : ProfileActionScriptNodeInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "removeCondition");
        this.getProfileActionConditionInterfaceVector().remove(profileActionScriptNodeInterface);
        this.remove(profileActionScriptNodeInterface);
    }

    public function addCondition(profileActionScriptNodeInterface : ProfileActionScriptNodeInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "addCondition");
        this.getProfileActionConditionInterfaceVector().add(profileActionScriptNodeInterface);
        this.add(profileActionScriptNodeInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfileActionScriptConditionData.NAME);
        final profileActionConditionInterfaceVector : BasicArrayList = this.getProfileActionConditionInterfaceVector();
        final size : Int = profileActionConditionInterfaceVector.size();
        for (index in 0...size) {
            var profileActionConditionInterface : ProfileActionScriptConditionInterface = (cast profileActionConditionInterfaceVector.get(index) : ProfileActionScriptConditionInterface);
            node.appendChild(profileActionConditionInterface.toXmlNode(document));
        }
        final profileActionProcessorInterfaceVector : BasicArrayList = this.getProfileActionProcessorInterfaceVector();
        final size2 : Int = profileActionProcessorInterfaceVector.size();
        for (index in 0...size2) {
            var profileActionProcessorInterface : ProfileActionScriptProcessorInterface = (cast profileActionProcessorInterfaceVector.get(index) : ProfileActionScriptProcessorInterface);
            node.appendChild(profileActionProcessorInterface.toXmlNode(document));
        }
        return node;
    }

    public function getProfileActionConditionInterfaceVector() : BasicArrayList {
        return this.profileActionConditionInterfaceVector;
    }

    public function setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector : BasicArrayList) : Void {
        this.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector;
    }

    public function actionPerformed(actionEvent : ActionEvent) : Void {
        try {
            super.actionPerformed(actionEvent);
            if (actionEvent.getActionCommand().compareTo(DELETE) == 0) {
                if (Std.isOfType(this.getParent(), ProfileActionScriptNodeInterface)) {
                    var profileActionScriptNodeInterface : ProfileActionScriptNodeInterface = (cast this.getParent() : ProfileActionScriptNodeInterface);
                    profileActionScriptNodeInterface.removeCondition(this);
                    JTreeInterfaceFactory.getInstance().getJTreeInterface().updateJTree();
                }
            } else if (actionEvent.getActionCommand().compareTo(NEW_COLOR_AT) == 0) {
                this.addCondition(new ColorAtActionScriptCondition());
                this.updateTree();
            } else if (actionEvent.getActionCommand().compareTo(NEW_ALWAYS) == 0) {
                this.addCondition(new AlwaysActionScriptCondition());
                this.updateTree();
            } else if (actionEvent.getActionCommand().compareTo(NEW_TIME_INTERVAL) == 0) {
                this.addCondition(new TimeIntervalActionScriptCondition());
                this.updateTree();
            } else if (actionEvent.getActionCommand().compareTo(NEW_KEY_INPUT) == 0) {
                this.addProcessor(new KeyboardActionScriptInput());
                this.updateTree();
            } else if (actionEvent.getActionCommand().compareTo(NEW_MOUSE_INPUT) == 0) {
                this.addProcessor(new MouseActionScriptInput());
                this.updateTree();
            } else if (actionEvent.getActionCommand().compareTo(NEW_IMAGE_OUTPUT) == 0) {
                this.addProcessor(new ImageActionScriptOutput());
                this.updateTree();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Error", this, "actionPerformed", e);
        }
    }

    public function getProfileActionProcessorInterfaceVector() : BasicArrayList {
        return this.profileActionProcessorInterfaceVector;
    }

    public function setProfileActionProcessorInterfaceVector(profileActionProcessorInterfaceVector : BasicArrayList) : Void {
        this.profileActionProcessorInterfaceVector = profileActionProcessorInterfaceVector;
    }

    private function updateTree() : Void {
        JTreeInterfaceFactory.getInstance().getJTreeInterface().updateJTree();
        var treePath : TreePath = new TreePath(this);
        JTreeInterfaceFactory.getInstance().getJTreeInterface().getActionScriptJTree().expandPath(treePath);
    }

    // throws Exception
    public function shouldProcess(frame : Null<haxe.Int64>) : Bool {
        final profileActionConditionInterfaceVector : BasicArrayList = this.getProfileActionConditionInterfaceVector();
        final size : Int = profileActionConditionInterfaceVector.size();
        for (index in 0...size) {
            var profileActionScriptConditionInterface : ProfileActionScriptConditionInterface = (cast profileActionConditionInterfaceVector.get(index) : ProfileActionScriptConditionInterface);
            if (!profileActionScriptConditionInterface.shouldProcess(frame)) {
                return false;
            }
        }
        return true;
    }

    // throws Exception
    public function process(frame : Null<haxe.Int64>) : Void {
        this.logUtil.putF(new StringMaker().append("Start - Processing ").appendint(this.getProfileActionProcessorInterfaceVector().size()).append(" inputs").toString(), this, this.commonStrings.PROCESS);
        final profileActionProcessorInterfaceVector : BasicArrayList = this.getProfileActionProcessorInterfaceVector();
        final size : Int = profileActionProcessorInterfaceVector.size();
        for (index in 0...size) {
            var profileActionScriptProcessorInterface : ProfileActionScriptProcessorInterface = (cast profileActionProcessorInterfaceVector.get(index) : ProfileActionScriptProcessorInterface);
            profileActionScriptProcessorInterface.process(frame);
        }
    }

}

