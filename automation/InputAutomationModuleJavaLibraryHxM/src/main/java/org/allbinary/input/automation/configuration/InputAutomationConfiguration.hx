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
//import java.util.List;
//import javax.xml.bind.JAXBContext;
//import javax.xml.bind.Marshaller;
//import javax.xml.bind.annotation.XmlAccessType;
//import javax.xml.bind.annotation.XmlAccessorType;
//import javax.xml.bind.annotation.XmlElement;
//import javax.xml.bind.annotation.XmlRootElement;
//import javax.xml.bind.annotation.XmlType;
import org.allbinary.data.tree.dom.document.DomDocumentFileHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Document;

//name="inputAutomationConfiguration", 
class InputAutomationConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final FILENAME : String = "InputAutomationConfig.xml";
    private var installed : Bool = false;
    private var inputAutomationModuleConfigurationList : List<InputAutomationModuleConfiguration> = null;
    public function new() {
    }

    public static function getFile() : File {
        return new File(FILENAME);
    }

    public function isInstalled() : Bool {
        return this.installed;
    }

    public function setInstalled(installed : Bool) : Void {
        this.installed = installed;
        this.logUtil.putF("Installed: " + installed, this, "setIntalled");
    }

    public function getInputAutomationModuleConfigurationList() : List<InputAutomationModuleConfiguration> {
        return this.inputAutomationModuleConfigurationList;
    }

    // throws Exception
    public function save() : Void {
        var document : Document = DomDocumentHelper.create();
        var file : File = new File(FILENAME);
        FileUtil.getInstance().copy(new AbPath(file.getAbsolutePath(), StringUtil.getInstance().EMPTY_STRING), new AbPath(file.getAbsolutePath() + ".bak.xml", StringUtil.getInstance().EMPTY_STRING));
        var jaxbContext : JAXBContext = JAXBContext.newInstance(InputAutomationConfiguration);
        var marshaller : Marshaller = jaxbContext.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(this, document);
        DomDocumentFileHelper.save(FileWrapperUtil.wrapFile(file), document);
    }

}

