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
package org.allbinary.input.automation.module.configuration;

//import javax.xml.bind.annotation.XmlAccessType;
//import javax.xml.bind.annotation.XmlAccessorType;
//import javax.xml.bind.annotation.XmlElement;
//import javax.xml.bind.annotation.XmlRootElement;
//import javax.xml.bind.annotation.XmlType;
import org.allbinary.business.DynamicObjectData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.automation.InputAutomationData;
import org.allbinary.input.automation.module.InputAutomationModuleData;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class InputAutomationModuleConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var className : String = null;
    private var name : String = null;
    private var inputAutomationModuleInterface : InputAutomationModuleFactoryInterface = null;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, node : Node) {
        this.init(abeClientInformation, node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, name : String, className : String) {
        this.setName(name);
        this.setClassName(className);
        this.init(abeClientInformation);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(inputAutomationModuleInterface : InputAutomationModuleFactoryInterface) {
        this.setInputAutomationModuleInterface(inputAutomationModuleInterface);
        this.setClassName(Type.getClassName(Type.getClass(this.inputAutomationModuleInterface)));
    }

    // throws Exception
    public function init(abeClientInformation : AbeClientInformationInterface, node : Node) : Void {
        var nodeList : NodeList = node.getChildNodes();
        if (nodeList != null) {
            var classNameNode : Node = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList);
            if (classNameNode != null) {
                this.setClassName(DomNodeHelper.getTextNodeValue(classNameNode));
                this.init(abeClientInformation);
            } else {
                this.logUtil.putF("Class Node Null", this, this.commonStrings.INIT);
            }
        } else {
            this.logUtil.putF(InputAutomationData.NAME + " Node Has No Children", this, "Contructor");
        }
    }

    public function init(abeClientInformation : AbeClientInformationInterface) : Void {
        try {
            this.logUtil.putF("Name: " + getName(), this, this.commonStrings.INIT);
            this.logUtil.putF("ClassName: " + className, this, this.commonStrings.INIT);
            this.setInputAutomationModuleInterface((cast AbeFactory.getInstance().getInstance().getInstance(abeClientInformation, getClassName()) : InputAutomationModuleFactoryInterface));
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
            throw new haxe.Exception();
        }
    }

    // throws Exception
    public function toDomNode(document : Document) : Node {
        var node : Node = document.createElement(InputAutomationModuleData.NAME);
        var classNameNode : Node = ModDomHelper.createTextNode(document, DynamicObjectData.NAME, this.getClassName());
        node.appendChild(classNameNode);
        return node;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.logUtil.putF("Name: " + name, this, "setName");
        this.name = name;
    }

    public function getClassName() : String {
        return this.className;
    }

    public function setClassName(className : String) : Void {
        this.logUtil.putF("ClassName : " + className, this, "setClassName");
        this.className = className;
    }

    public function getInputAutomationModuleInterface() : InputAutomationModuleFactoryInterface {
        return this.inputAutomationModuleInterface;
    }

    public function setInputAutomationModuleInterface(inputAutomationModuleInterface : InputAutomationModuleFactoryInterface) : Void {
        this.logUtil.putF("InputAutomationModuleFactoryInterface : " + inputAutomationModuleInterface, this, "setInputAutomationModuleInterface");
        this.inputAutomationModuleInterface = inputAutomationModuleInterface;
        this.setName(this.inputAutomationModuleInterface.getName());
    }

}

