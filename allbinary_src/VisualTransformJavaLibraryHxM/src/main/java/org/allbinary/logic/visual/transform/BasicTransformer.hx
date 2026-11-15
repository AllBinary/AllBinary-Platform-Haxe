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
package org.allbinary.logic.visual.transform;

//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.InputStream;
//import javax.xml.transform.URIResolver;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.jcehelper.AbCrypt;
import org.allbinary.logic.control.crypt.jcehelper.KeySpecFactory;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.io.path.PathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.AbKeys;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData;

class BasicTransformer extends AbTransformer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final streamUtil : StreamUtil = StreamUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface;
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.abeClientInformation = abeClientInformation;
        this.setTemplateAsInputStream();
    }

    // throws Exception
    private function setEncryptedTemplateFileAsInputStream(file : AbFile) : Void {
        var outputStream : ByteArrayOutputStream = null;
        var inputStream : AbFileInputStream = null;
        try {
            outputStream = new ByteArrayOutputStream();
            inputStream = new AbFileInputStream(file);
            outputStream = (cast this.streamUtil.get(inputStream, outputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : ByteArrayOutputStream);
            final abCrypt : AbCrypt = new AbCrypt(KeySpecFactory.DESEDE, AbKeys.getInstance().getKey(this.abeClientInformation, file.getAbsolutePath()));
            final decrypted : haxe.ds.Vector<Int> = abCrypt.decrypt(outputStream.toByteArray());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Decrypted Template: \n" + haxe.io.Bytes.ofData(decrypted).toString(), this, "setEncryptedTemplateFileAsInputStream(file)");
            }
            this.setInputStream((cast new ByteArrayInputStream(decrypted) : InputStream));
            this.setURIResolver((cast new BasicUriResolver(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION) : URIResolver));
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failed to get Encrypted File: ");
                stringBuffer.append(file.getPath());
                stringBuffer.append(" \nName:");
                stringBuffer.append(file.getName());
                this.logUtil.put(stringBuffer.toString(), this, "setEncryptedTemplateFileAsInputStream()", e);
            }
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.streamUtil.close(outputStream);
            this.streamUtil.close(inputStream);
        }
    }

    // throws Exception
    private function setEncryptedTemplateAsInputStream() : Void {
        var outputStream : ByteArrayOutputStream = null;
        var inputStream : ByteArrayInputStream = null;
        try {
            outputStream = new ByteArrayOutputStream();
            inputStream = new ByteArrayInputStream(this.getTransformInfoInterface().getTemplate().getBytes());
            outputStream = (cast this.streamUtil.get(inputStream, outputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : ByteArrayOutputStream);
            final abCrypt : AbCrypt = new AbCrypt(KeySpecFactory.DESEDE, AbKeys.getInstance().getKey(this.abeClientInformation, this.getTransformInfoInterface().getName()));
            final decrypted : haxe.ds.Vector<Int> = abCrypt.decrypt(outputStream.toByteArray());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Decrypted Template: \n" + decrypted.toString(), this, "setEncryptedTemplateAsInputStream()");
            }
            this.setInputStream((cast new ByteArrayInputStream(decrypted) : InputStream));
            this.setURIResolver((cast new BasicUriResolver(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION) : URIResolver));
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put("Failed to set with template: " + this.getTransformInfoInterface().getTemplateFilePath(), this, "setEncryptedTemplateFileAsInputStream()", e);
            }
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.streamUtil.close(outputStream);
            this.streamUtil.close(inputStream);
        }
    }

    // throws Exception
    private function setTemplateAsInputStream() : Void {
        var inputStream : AbFileInputStream = null;
        var outputStream : ByteArrayOutputStream = null;
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF(this.getTransformInfoInterface().log(), this, "setTemplateAsInputStream()");
            }
            final transformInfoTemplateData : TransformInfoTemplateData = TransformInfoTemplateData.getInstance();
            final pathUtil : PathUtil = PathUtil.getInstance();
            if (this.getTransformInfoInterface().getTemplateFilePath() != null) {
                final extension : String = pathUtil.getExtensionWithAbPath(this.getTransformInfoInterface().getTemplateFilePath());
                final filePath : String = pathUtil.getWithoutExtensionWithAbPath(this.getTransformInfoInterface().getTemplateFilePath());
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                    this.logUtil.putF(this.getTransformInfoInterface().log(), this, "setTemplateAsInputStream()");
                }
                if (Reflect.compare(extension, transformInfoTemplateData.UNCRYPTED_EXTENSION) == 0) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(filePath);
                    stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
                    stringBuffer.append(transformInfoTemplateData.ENCRYPTED_EXTENSION);
                    final encFile : AbFile = AbFile.createAbFile(stringBuffer.toString());
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                        this.logUtil.putF(this.getTransformInfoInterface().log(), this, "setTemplateAsInputStream()");
                    }
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                        stringBuffer = new StringMaker();
                        stringBuffer.append("Encrypted Template File isFile=");
                        stringBuffer.appendboolean(encFile.isFile());
                        stringBuffer.append("\nEncTemplateFilePath: ");
                        stringBuffer.append(encFile.getPath());
                        this.logUtil.putF(stringBuffer.toString(), this, "setTemplateAsInputStream()");
                    }
                    if (encFile.isFile()) {
                        this.setEncryptedTemplateFileAsInputStream(encFile);
                        return;
                    } else {
                        final file : AbFile = AbFile.createAbFileFromAbPath(this.getTransformInfoInterface().getTemplateFilePath());
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                            this.logUtil.putF(this.getTransformInfoInterface().log(), this, "setTemplateAsInputStream()");
                        }
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                            this.logUtil.putF("Template File isFile=" + file.isFile(), this, "setTemplateAsInputStream()");
                        }
                        if (file.isFile()) {
                            inputStream = new AbFileInputStream(file);
                            outputStream = new ByteArrayOutputStream();
                            outputStream = (cast this.streamUtil.get(inputStream, outputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : ByteArrayOutputStream);
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                                this.logUtil.putF("Template: " + outputStream.toString(), this, "getTemplateAsInputStream()");
                            }
                            this.setInputStream((cast new ByteArrayInputStream(outputStream.toByteArray()) : InputStream));
                            this.setURIResolver((cast new BasicUriResolver(transformInfoTemplateData.UNCRYPTED_EXTENSION) : URIResolver));
                            return;
                        }
                    }
                } else if (Reflect.compare(extension, transformInfoTemplateData.ENCRYPTED_EXTENSION) == 0) {
                    final stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(filePath);
                    stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
                    stringBuffer.append(transformInfoTemplateData.ENCRYPTED_EXTENSION);
                    final file : AbFile = AbFile.createAbFile(stringBuffer.toString());
                    if (file.isFile()) {
                        this.setEncryptedTemplateFileAsInputStream(file);
                    }
                } else {
                    throw new haxe.Exception("View Template File Type Is Not Recognized: " + this.getTransformInfoInterface().getTemplateFilePath());
                }
            } else {
                this.setEncryptedTemplateAsInputStream();
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put("Failed to get Template Data", this, "setTemplateAsInputStream()", e);
            }
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.streamUtil.close(outputStream);
            this.streamUtil.close(inputStream);
        }
        throw new haxe.Exception("Error setTemplateAsInputStream()");
    }

}

