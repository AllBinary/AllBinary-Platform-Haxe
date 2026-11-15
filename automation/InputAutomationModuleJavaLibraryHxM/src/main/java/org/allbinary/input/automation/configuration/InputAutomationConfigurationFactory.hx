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
package org.allbinary.input.automation.configuration;

//import java.io.File;
//import java.io.FileInputStream;
//import java.util.List;
//import javax.xml.bind.JAXBContext;
//import javax.xml.bind.JAXBElement;
//import javax.xml.bind.Unmarshaller;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class InputAutomationConfigurationFactory {
    private static final instance : InputAutomationConfigurationFactory = new InputAutomationConfigurationFactory();
    public static function getInstance() : InputAutomationConfigurationFactory {
        return InputAutomationConfigurationFactory.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public var inputAutomationConfiguration : InputAutomationConfiguration = null;
    public function new() {
    }

    // throws Exception
    public function init(abeClientInformation : AbeClientInformationInterface) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final INPUT_AUTOMATION_CONFIGURATION : String = "InputAutomationConfiguration";
        final file : File = InputAutomationConfiguration.getFile();
        if (file.isFile()) {
            logUtil.putF("LoadingConfiguration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT);
            final jaxbContext : JAXBContext = JAXBContext.newInstance(InputAutomationConfiguration);
            final unmarshaller : Unmarshaller = jaxbContext.createUnmarshaller();
            final root : JAXBElement<InputAutomationConfiguration> = unmarshaller.unmarshal(new StreamSource(new FileInputStream(file)), InputAutomationConfiguration);
            this.inputAutomationConfiguration = (cast root.getValue() : InputAutomationConfiguration);
            final inputAutomationModuleConfigurationList : List<InputAutomationModuleConfiguration> = this.inputAutomationConfiguration.getInputAutomationModuleConfigurationList();
            logUtil.putF("isInstalled: " + this.inputAutomationConfiguration.isInstalled() + " inputAutomationModuleConfigurationList: " + inputAutomationModuleConfigurationList, INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT);
            if (inputAutomationModuleConfigurationList != null) {
                final size : Int = inputAutomationModuleConfigurationList.size();
                var inputAutomationModuleConfiguration : InputAutomationModuleConfiguration = null;
                for (index in 0...size) {
                    inputAutomationModuleConfiguration = inputAutomationModuleConfigurationList.get(index);
                    inputAutomationModuleConfiguration.init(abeClientInformation);
                }
            }
            logUtil.putF("LoadedConfiguration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT);
        } else {
            logUtil.putF("New Configuration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT);
            this.inputAutomationConfiguration = new InputAutomationConfiguration();
        }
    }

}

