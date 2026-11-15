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
package views.business.context.modules.storefront.customizer.template;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfo;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfosData;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;
import views.business.context.modules.storefront.customizer.template.objectConfig.InsertTemplateCustomizerTransformInfoObjectConfig;
import views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig;

//Sets Template Type
class InsertCustomizerValidationView extends HttpStoreComponentView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var viewName : String;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, this.commonStrings.CONSTRUCTOR);
        }
        var requestHashMap : HashMap = new RequestParams(this.getPageContext()).toHashMap();
        this.viewName = (cast requestHashMap.get(TransformInfoData.getInstance().NAME) : String);
    }

    public function isValid() : Null<Bool> {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Started Validation", this, this.commonStrings.IS_VALID);
            }
            var isValid : Null<Bool> = true;
            if (StringValidationUtil.getInstance().isEmpty(this.viewName)) {
                isValid = false;
            } else {
                var objectConfig : NoTemplateTransformInfoObjectConfig = new NoTemplateTransformInfoObjectConfig(this.getTransformInfoInterface(), this.getTransformInfoInterface().getObjectConfigInterface().toXmlDoc());
                final componentVector : BasicArrayList = objectConfig.getGroupTransforms();
                final size : Int = componentVector.size();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Pointing ");
                    stringBuffer.appendint(componentVector.size());
                    stringBuffer.append(" Components");
                    this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                }
                for (index in 0...size) {
                    var transformInfo : TransformInfo = (cast componentVector.get(index) : TransformInfo);
                    var transformInfoName : String = transformInfo.getName();
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        this.logUtil.putF("Setting Template Component with ViewName: " + transformInfoName, this, this.commonStrings.IS_VALID);
                    }
                    var componentInterface : TransformInterface = TransformFactory.getInstance().getInstance(this.abeClientInformation, transformInfoName, this.getTransformInfoInterface());
                    var templateViewObjectConfig : InsertTemplateCustomizerTransformInfoObjectConfig = new InsertTemplateCustomizerTransformInfoObjectConfig(componentInterface.getTransformInfoInterface(), componentInterface.getTransformInfoInterface().getObjectConfigInterface().toXmlDoc());
                    var storeName : String = this.getTransformInfoInterface().getStoreName();
                    var endIndex : Int = this.viewName.indexOf(storeName) + storeName.length;
                    var storePrepend : String = this.viewName.substring(0, endIndex);
                    var viewNamePostfix : String = this.viewName.substring(endIndex, this.viewName.length);
                    var newViewNameStringBuffer : StringMaker = new StringMaker();
                    newViewNameStringBuffer.append(storePrepend);
                    var commonSeps : CommonSeps = CommonSeps.getInstance();
                    var transformInfosData : TransformInfosData = TransformInfosData.getInstance();
                    if (transformInfoName.indexOf(transformInfosData.SMALL_PREVIEW) >= 0) {
                        newViewNameStringBuffer.append(commonSeps.SPACE);
                        newViewNameStringBuffer.append(transformInfosData.SMALL_PREVIEW);
                    } else if (transformInfoName.indexOf(transformInfosData.PREVIEW) >= 0) {
                        newViewNameStringBuffer.append(commonSeps.SPACE);
                        newViewNameStringBuffer.append(transformInfosData.PREVIEW);
                    }
                    newViewNameStringBuffer.append(commonSeps.SPACE);
                    newViewNameStringBuffer.append(viewNamePostfix);
                    if (transformInfoName.indexOf(GeneratorTransformInfoData.NAME) >= 0) {
                        newViewNameStringBuffer.append(commonSeps.SPACE);
                        newViewNameStringBuffer.append(GeneratorTransformInfoData.NAME);
                    }
                    final newViewName : String = Std.string(newViewNameStringBuffer);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Template Component: ");
                        stringBuffer.append(transformInfoName);
                        stringBuffer.append("\n Now Pointing To View Name: ");
                        stringBuffer.append(newViewName);
                        this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                    }
                    templateViewObjectConfig.set(newViewName);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Template Component: ");
                        stringBuffer.append(transformInfoName);
                        stringBuffer.append("\n with ObjectConfig: ");
                        stringBuffer.append(Std.string(templateViewObjectConfig));
                        this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
                    }
                    componentInterface.getTransformInfoInterface().setObjectConfigInterface(templateViewObjectConfig);
                    var updatedTransformInfoHashMap : HashMap = componentInterface.getTransformInfoInterface().toHashMap();
                    TransformInfoEntityBuilder.getInstance().update(updatedTransformInfoHashMap);
                }
            }
            return isValid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Error: Template Name Is Empty.");
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function view() : String {
        return views.ValidationOnlyTempUtil.getInstance().view(this);
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

