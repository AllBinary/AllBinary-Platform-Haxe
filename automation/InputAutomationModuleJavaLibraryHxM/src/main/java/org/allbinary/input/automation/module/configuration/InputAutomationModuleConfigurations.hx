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

//import java.io.File;
//import java.io.FileInputStream;
//import java.util.HashMap;
//import java.util.List;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.input.automation.module.InputAutomationModuleData;
import org.allbinary.input.automation.module.NewInputAutomationModulesData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class InputAutomationModuleConfigurations {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var hashMap : HashMap = null;
    public function new(abeClientInformation : AbeClientInformationInterface, file : File) {
        this.setHashMap(new HashMap());
        final bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...100000) 0]);
        final idFile : FileInputStream = new FileInputStream(file);
        final length : Int = idFile.read(bytes);
        final data : String = haxe.io.Bytes.ofData(bytes).toString();
        final endIndex : Int = data.lastIndexOf(">".code);
        final document : Document = DomDocumentHelper.create(data.substring(0, endIndex + 1));
        final nodeList : NodeList = document.getElementsByTagName(NewInputAutomationModulesData.NAME);
        if (nodeList.getLength() > 0) {
            final nameNodeList : NodeList = document.getElementsByTagName(InputAutomationModuleData.NAME);
            this.logUtil.putF("Number Of Module(s) Specified: " + nameNodeList.getLength(), this, "Contructor");
            for (index in 0...nameNodeList.getLength()) {
                final node : Node = nameNodeList.item(index);
                this.add(new InputAutomationModuleConfiguration(abeClientInformation, node));
            }
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, document : Document) {
        this.setHashMap(new HashMap());
        final nameNodeList : NodeList = document.getElementsByTagName(InputAutomationModuleData.NAME);
        this.logUtil.putF("Number Of Module(s) Specified: " + nameNodeList.getLength(), this, "Contructor");
        for (index in 0...nameNodeList.getLength()) {
            var node : Node = nameNodeList.item(index);
            this.add(new InputAutomationModuleConfiguration(abeClientInformation, node));
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(inputAutomationModuleConfigurationList : List<InputAutomationModuleConfiguration>) {
        this.setHashMap(new HashMap());
        final size : Int = inputAutomationModuleConfigurationList.size();
        var inputAutomationModuleConfiguration : InputAutomationModuleConfiguration = null;
        for (index in 0...size) {
            inputAutomationModuleConfiguration = inputAutomationModuleConfigurationList.get(index);
            this.add(inputAutomationModuleConfiguration);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        this.setHashMap(new HashMap());
    }

    public function add(inputAutomationModuleConfiguration : InputAutomationModuleConfiguration) : Void {
        this.getHashMap().put(inputAutomationModuleConfiguration.getClassName(), inputAutomationModuleConfiguration);
    }

    public function remove(inputAutomationModuleConfiguration : InputAutomationModuleConfiguration) : Void {
        this.getHashMap().remove(inputAutomationModuleConfiguration.getClassName());
    }

    public function getHashMap() : HashMap {
        return this.hashMap;
    }

    public function setHashMap(hashMap : HashMap) : Void {
        this.hashMap = hashMap;
    }

}

