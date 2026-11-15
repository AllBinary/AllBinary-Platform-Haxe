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
package tags.transform.info;

//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.TagHelperFactoryInterface;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.OutputTypeData;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import taghelpers.transform.info.TransformInfoRequestHelperFactory;
import tags.ModifyTag;

class TransformInfoTag extends ModifyTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String = null;
    private var storeName : String = null;
    private var objectFile : String = null;
    private var anyType : String = null;
    private var objectConfigFile : String = null;
    private var objectConfig : String = null;
    private var templateFile : String = null;
    private var template : String = null;
    private var dataFile : String = null;
    private var data : String = null;
    private var type : String = null;
    public function new() {
        super(new TransformInfoRequestHelperFactory());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(tagHelperFactoryInterface : TagHelperFactoryInterface) {
        super(tagHelperFactoryInterface);
    }

    public function setName(value : String) : Void {
        this.name = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().NAME, this.name);
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
        this.getPropertiesHashMap().put(StoreFrontData.getInstance().NAME, this.storeName);
    }

    public function setObjectFile(value : String) : Void {
        this.objectFile = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().OBJECTFILENAME, this.objectFile);
    }

    public function setObject(value : String) : Void {
        this.anyType = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().OBJECT, this.anyType);
    }

    public function setTemplateFile(value : String) : Void {
        this.templateFile = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().TEMPLATEFILENAME, this.templateFile);
    }

    public function setTemplate(value : String) : Void {
        this.template = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().TEMPLATE, this.template);
    }

    public function setDataFile(value : String) : Void {
        this.dataFile = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().DATAFILENAME, this.dataFile);
    }

    public function setData(value : String) : Void {
        this.data = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().DATA, this.data);
    }

    public function setObjectConfigFile(value : String) : Void {
        this.objectConfigFile = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().OBJECTCONFIGFILENAME, this.objectConfigFile);
    }

    public function setObjectConfig(value : String) : Void {
        this.objectConfig = value;
        this.getPropertiesHashMap().put(TransformInfoData.getInstance().OBJECTCONFIG, this.objectConfig);
    }

    public function setType(value : String) : Void {
        this.type = value;
        this.getPropertiesHashMap().put(OutputTypeData.getInstance().NAME, this.type);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF("TransformInfoTag type set: " + this.type, this, "setType");
        }
    }

    public function getName() : String {
        return this.name;
    }

    public function getObjectFile() : String {
        return this.objectFile;
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            return super.doStartTag();
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

