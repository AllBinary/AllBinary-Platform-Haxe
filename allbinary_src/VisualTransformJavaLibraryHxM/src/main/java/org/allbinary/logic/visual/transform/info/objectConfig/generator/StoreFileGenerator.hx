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
package org.allbinary.logic.visual.transform.info.objectConfig.generator;

//import java.io.ByteArrayInputStream;
//import java.io.InputStream;
//import java.util.HashMap;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfosData;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class StoreFileGenerator extends TransformInfoObjectConfigGenerator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final output : String;
    private final fileAbPath : AbPath;
    private final file : AbFile;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super();
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
        var weblisketSession : WeblisketSession = new WeblisketSession(httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getWebappPath());
        stringBuffer.append(weblisketSession.getStoreName());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        var abPath : AbPath = new AbPath(stringBuffer.toString(), StringUtil.getInstance().EMPTY_STRING);
        var fileName : String = (cast httpTransformInfoInterface.getPropertiesHashMap().get(InputOutputTypeData.getInstance().FILE) : String);
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(fileName)) {
            var transformInfoHttpStoreInterface : TransformInfoHttpStoreInterface = (cast transformInfoInterface : TransformInfoHttpStoreInterface);
            fileName = transformInfoInterface.getName().substring(transformInfoHttpStoreInterface.getStoreName().length() + 1);
            var outputMappingHashMap : HashMap = StdUtil.getInstance().createHashMap();
            outputMappingHashMap.put(TransformInfosData.getInstance().PREVIEW, "Preview");
            outputMappingHashMap.put(TransformInfosData.getInstance().SMALL_PREVIEW, "SmallPreview");
            outputMappingHashMap.put(CommonSeps.getInstance().SPACE, StringUtil.getInstance().EMPTY_STRING);
            var replace : Replace = new Replace(outputMappingHashMap);
            fileName = replace.all(fileName);
        }
        if (stringValidationUtil.isEmpty(fileName)) {
            throw new haxe.Exception("TransformInfoObjectConfigGenerator FileName Not Specified");
        }
        var tempOutput : String = (cast httpTransformInfoInterface.getPropertiesHashMap().get(InputOutputTypeData.getInstance().NAME) : String);
        if (stringValidationUtil.isEmpty(tempOutput)) {
            tempOutput = InputOutputTypeData.getInstance().DEFAULT;
        }
        this.output = tempOutput;
        if (stringValidationUtil.isEmpty(this.output)) {
            throw new haxe.Exception("TransformInfoObjectConfigGenerator Output=extension Not Specified");
        }
        stringBuffer = new StringMaker();
        stringBuffer.append(fileName);
        stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
        stringBuffer.append(this.output);
        abPath = new AbPath(abPath.toString(), stringBuffer.toString());
        this.fileAbPath = abPath;
        this.file = AbFile.createAbFileFromAbPath(this.fileAbPath);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("File: " + this.fileAbPath.toString(), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // throws Exception
    public function process(input : String) : String {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Processing", this, this.commonStrings.PROCESS);
        }
        if (!this.file.exists()) {
            this.file.createNewFile();
        }
        if (this.file.exists()) {
            var inputStream : InputStream = new ByteArrayInputStream(haxe.io.Bytes.ofString(input));
            FileUtil.getInstance().write(inputStream, this.file);
        } else {
            throw new haxe.Exception("Could Not Create: " + this.fileAbPath.toString());
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Processed", this, this.commonStrings.PROCESS);
        }
        return StringUtil.getInstance().EMPTY_STRING;
    }

}

