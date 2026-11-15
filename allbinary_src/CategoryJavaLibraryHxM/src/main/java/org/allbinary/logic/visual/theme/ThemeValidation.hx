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
package org.allbinary.logic.visual.theme;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.store.theme.StoreThemeCategoryFactory;
import org.allbinary.business.category.store.theme.StoreThemeCategoryInterface;
import org.allbinary.data.tree.category.CategoryLoaderFactory;
import org.allbinary.data.tree.category.CategoryLoaderInterface;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.io.path.PathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ThemeValidation implements ThemeInterface implements ValidationInterface implements DomNodeInterface implements CompositeTransformInfoInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var transformInfoInterface : TransformInfoInterface;
    private var styleValidationInterface : ValidationInterface;
    private var themeName : String;
    private var themePreviewImageName : String;
    private var webAppAbPath : AbPath;
    private var categoryAbPath : AbPath;
    private var fileAbPath : AbPath = null;
    public function new(transformInfoInterface : TransformInfoInterface, cssStyleValidation : CssStyleValidation, categoryThemePath : String) {
        this.transformInfoInterface = transformInfoInterface;
        final pathData : AbPathData = AbPathData.getInstance();
        final pathUtil : PathUtil = PathUtil.getInstance();
        this.categoryAbPath = pathUtil.removeNameFromPath(categoryThemePath);
        this.themeName = pathData.getNameFromPath(categoryThemePath);
        this.styleValidationInterface = cssStyleValidation;
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, hashMap : HashMap) {
        this.transformInfoInterface = transformInfoInterface;
        var categoryThemeAbPath : AbPath = new AbPath((cast hashMap.get(ThemeData.getInstance().PATH) : String), StringUtil.getInstance().EMPTY_STRING);
        final pathData : AbPathData = AbPathData.getInstance();
        final pathUtil : PathUtil = PathUtil.getInstance();
        this.categoryAbPath = pathUtil.removeNameFromPath(categoryThemeAbPath.toString());
        this.themeName = pathData.getNameFromPath(categoryThemeAbPath.toString());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("CategoryThemePath: ");
            stringBuffer.append(categoryThemeAbPath.toString());
            stringBuffer.append(" & CategoryPath: ");
            stringBuffer.append(this.categoryAbPath.toString());
            stringBuffer.append(" & ThemeName: ");
            stringBuffer.append(this.themeName);
            this.logUtil.putF("Http Request Constructor", this, stringBuffer.toString());
        }
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(storeThemeCategoryInterface : StoreThemeCategoryInterface, node : Node) {
        this.transformInfoInterface = storeThemeCategoryInterface.getTransformInfoInterface();
        this.categoryAbPath = storeThemeCategoryInterface.getPath();
        var themeNameNode : Node = DomSearchHelper.getNode(ThemeData.getInstance().NAME, node.getChildNodes());
        var valueNode : Node = DomSearchHelper.getNode(DomData.VALUE, themeNameNode.getChildNodes());
        this.themeName = DomNodeHelper.getTextNodeValue(valueNode);
        var previewImageNameNode : Node = DomSearchHelper.getNode(ThemeData.getInstance().PREVIEW_IMAGE_NAME, node.getChildNodes());
        var previewImageNameValueNode : Node = DomSearchHelper.getNode(DomData.VALUE, previewImageNameNode.getChildNodes());
        this.themePreviewImageName = DomNodeHelper.getTextNodeValue(previewImageNameValueNode);
        this.webAppAbPath = storeThemeCategoryInterface.getWebAppPath();
        this.init(storeThemeCategoryInterface);
    }

    // throws Exception
    private function init() : Void {
        var categoryFactoryInterface : CategoryFactoryInterface = new StoreThemeCategoryFactory(this.getTransformInfoInterface());
        var categoryLoaderInterface : CategoryLoaderInterface = CategoryLoaderFactory.getInstance(categoryFactoryInterface);
        var rootStoreThemeCategoryInterface : StoreThemeCategoryInterface = (cast categoryFactoryInterface.getRootInstance() : StoreThemeCategoryInterface);
        this.init(rootStoreThemeCategoryInterface);
    }

    // throws Exception
    private function init(storeThemeCategoryInterface : StoreThemeCategoryInterface) : Void {
        this.fileAbPath = new AbPath(storeThemeCategoryInterface.getRootFilePath().toString() + this.categoryAbPath.toString(), StringUtil.getInstance().EMPTY_STRING);
        this.webAppAbPath = storeThemeCategoryInterface.getWebAppPath();
    }

    // throws Exception
    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    public function getName() : String {
        return this.themeName;
    }

    public function getPreviewImageName() : String {
        return this.themePreviewImageName;
    }

    public function getPreviewImagePath() : String {
        return this.webAppAbPath.toString() + this.categoryAbPath.toString();
    }

    public function getPath() : String {
        return this.categoryAbPath.toString();
    }

    // throws Exception
    public function getCssStyleValidation() : CssStyleValidation {
        if (this.styleValidationInterface == null) {
            var cssStyleFileAbPath : AbPath = new AbPath(this.fileAbPath.toString(), this.themeName + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION);
            var cryptFileReader : CryptFileReader = new CryptFileReader(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION);
            var document : Document = DomDocumentHelper.create(cryptFileReader.get(cssStyleFileAbPath));
            this.styleValidationInterface = new CssStyleValidation(document);
        }
        return (cast this.styleValidationInterface : CssStyleValidation);
    }

    public function isValid() : Null<Bool> {
        try {
            var isValid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.IS_VALID);
            }
            if (!StringValidationUtil.getInstance().isValidRequired(this.categoryAbPath.toString(), AbSqlData.MINSTRING, AbSqlData.MAXSTRING)) {
                isValid = false;
            }
            if (!StringValidationUtil.getInstance().isValidRequired(this.themeName, AbSqlData.MINSTRING, AbSqlData.MAXSTRING)) {
                isValid = false;
            }
            if (!this.getCssStyleValidation().isValid()) {
                isValid = false;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("End: " + isValid, this, this.commonStrings.IS_VALID);
            }
            return isValid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Theme Validation Error");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function getKey() : Any {
        return (cast this.getName() : Any);
    }

    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(this.getName());
        vector.add(this.getPath());
        vector.add(this.getPreviewImageName());
        vector.add(this.getPreviewImagePath());
        return vector;
    }

    public function toHashMap() : HashMap {
        var themeData : ThemeData = ThemeData.getInstance();
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(themeData.NAME, this.getName());
        hashMap.put(themeData.PATH, this.getPath());
        hashMap.put(themeData.PREVIEW_IMAGE_NAME, this.getPreviewImageName());
        hashMap.put(themeData.PREVIEW_IMAGE_PATH, this.getPreviewImagePath());
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createNameValueNodes(document, ThemeData.getInstance().NAME, this.toHashMap());
        var domNodeInterface : DomNodeInterface = (cast this.getCssStyleValidation() : DomNodeInterface);
        node.appendChild(domNodeInterface.toXmlNode(document));
        return node;
    }

}

