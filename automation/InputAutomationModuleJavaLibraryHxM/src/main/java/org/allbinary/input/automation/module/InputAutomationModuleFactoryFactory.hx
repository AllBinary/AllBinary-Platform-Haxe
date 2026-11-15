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
package org.allbinary.input.automation.module;

//import java.util.Collection;
//import java.util.HashMap;
//import java.util.Iterator;
//import javax.help.HelpSet;
//import javax.help.event.HelpSetEvent;
//import javax.help.event.HelpSetListener;
//import javax.swing.ListModel;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.help.JavaHelpSetNotifier;
import org.allbinary.string.CommonStrings;

class InputAutomationModuleFactoryFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var hashMap : HashMap;
    private var defaultListModelHelper : DefaultListModelHelper;
    private var helpSetListenerInterface : HelpSetListener;
    public function new(inputAutomationModuleConfigurations : InputAutomationModuleConfigurations, helpSetListenerInterface : HelpSetListener) {
        this.helpSetListenerInterface = helpSetListenerInterface;
        this.defaultListModelHelper = new DefaultListModelHelper();
        this.hashMap = StdUtil.getInstance().createHashMap();
        final collection : Collection = inputAutomationModuleConfigurations.getHashMap().values();
        final iterator : Iterator = collection.iterator();
        var inputAutomationModuleConfiguration : InputAutomationModuleConfiguration = null;
        while (iterator.hasNext()) {
            inputAutomationModuleConfiguration = (cast iterator.next() : InputAutomationModuleConfiguration);
            this.add(inputAutomationModuleConfiguration);
        }
        this.defaultListModelHelper.initDefaultModelList();
        this.logUtil.putF("Loaded " + this.hashMap.size() + "/" + this.defaultListModelHelper.getListModel().getSize() + " Input Automation Modules", this, "Contructor");
    }

    private function add(inputAutomationModuleConfiguration : InputAutomationModuleConfiguration) : Void {
        final inputAutomationModuleInterface : InputAutomationModuleFactoryInterface = inputAutomationModuleConfiguration.getInputAutomationModuleInterface();
        this.hashMap.put(inputAutomationModuleConfiguration.getName(), inputAutomationModuleInterface);
        this.defaultListModelHelper.add(inputAutomationModuleConfiguration.getName());
        final helpSet : HelpSet = inputAutomationModuleInterface.getHelpSet();
        if (!JavaHelpSetNotifier.isNotified(helpSet)) {
            final helpSetEvent : HelpSetEvent = new HelpSetEvent(this, helpSet, HelpSetEvent.HELPSET_ADDED);
            this.helpSetListenerInterface.helpSetAdded(helpSetEvent);
        }
    }

    public function getListModel() : ListModel {
        return (cast this.defaultListModelHelper.getListModel() : ListModel);
    }

    public function getInstance(moduleName : String) : InputAutomationModuleFactoryInterface {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF("Getting Module: " + moduleName, this, commonStrings.GET_INSTANCE);
        final inputAutomationModuleFactoryInterface : InputAutomationModuleFactoryInterface = (cast this.hashMap.get(moduleName) : InputAutomationModuleFactoryInterface);
        if (inputAutomationModuleFactoryInterface == null) {
            this.logUtil.putF("Module: " + moduleName + " was null", this, commonStrings.GET_INSTANCE);
        }
        return inputAutomationModuleFactoryInterface;
    }

}

