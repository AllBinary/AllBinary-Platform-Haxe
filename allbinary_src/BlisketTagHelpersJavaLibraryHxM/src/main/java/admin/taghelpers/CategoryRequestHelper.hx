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
package admin.taghelpers;

//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.category.CategoryComponent;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.store.StoreCategoryFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.data.tree.category.CategoryLoaderFactory;
import org.allbinary.data.tree.category.CategoryLoaderInterface;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoBasic;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CategoryRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var pageContext : PageContext = null;
    private var hashMap : HashMap = null;
    private var request : HttpServletRequest = null;
    private var categoryLoaderInterface : CategoryLoaderInterface = null;
    private var categoryInterface : CategoryInterface = null;
    private var childCategoryInterface : CategoryInterface = null;
    private var transformInfoInterface : TransformInfoInterface = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        try {
            this.request = (cast pageContext.getRequest() : HttpServletRequest);
            this.pageContext = pageContext;
            this.hashMap = hashMap;
            this.getXmlData();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "CategoryRequestHelper()", e);
            }
        }
    }

    private static final categoryRequest : String = new StringMaker().append("<").append(CategoryData.getInstance().REQUEST).append(">").toString();
    public function getXmlData() : Void {
        try {
            var map : Map = this.request.getParameterMap();
            final categoryData : CategoryData = CategoryData.getInstance();
            final keys : Set = map.keySet();
            final keyArray : haxe.ds.Vector<Any> = keys.toArray();
            final size : Int = keyArray.length;
            if (size > 0) {
                var xmlRequest : String = (cast keyArray[0] : String);
                var index : Int = 1;
                while (index < size && !StringTools.startsWith(xmlRequest, CategoryRequestHelper.categoryRequest)) {
                    xmlRequest = (cast keyArray[index] : String);
                    if (StringTools.startsWith(xmlRequest, CategoryRequestHelper.categoryRequest)) {
                        break;
                    }
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF(xmlRequest, this, "getXmlData()");
                }
                var document : Document = DomDocumentHelper.create(xmlRequest);
                var requestNode : Node = DomSearchHelper.getNode(categoryData.REQUEST, document.getChildNodes());
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF(XmlDocumentHelper.toString(document), this, "getXmlData()");
                }
                this.setCategoryLoader(requestNode);
                var parentCategoryNode : Node = DomSearchHelper.getNode(categoryData.PARENT, requestNode.getChildNodes());
                var categoryNode : Node = DomSearchHelper.getNode(categoryData.NAME, parentCategoryNode.getChildNodes());
                this.categoryInterface = (cast new StoreCategoryFactory(this.transformInfoInterface).getRootInstanceFromNode(categoryNode) : CategoryInterface);
                this.categoryInterface = this.categoryLoaderInterface.get(this.categoryInterface);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.categoryInterface.log();
                    this.logUtil.putF("Loaded Parent Category", this, "getXmlData()");
                }
                var childCategoryNode : Node = DomSearchHelper.getNodeNoThrow(categoryData.NAME, requestNode.getChildNodes());
                if (childCategoryNode != null) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                        this.logUtil.putF("Loading Child Category", this, "getXmlData()");
                    }
                    this.childCategoryInterface = (cast new StoreCategoryFactory(this.transformInfoInterface).getInstance(childCategoryNode) : CategoryInterface);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                        this.childCategoryInterface.log();
                        this.logUtil.putF("Loaded Child Category", this, "getXmlData()");
                    }
                } else {
                    this.childCategoryInterface = this.categoryInterface;
                }
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getXmlData()", e);
            }
        }
    }

    // throws Exception
    private function setCategoryLoader(requestNode : Node) : Void {
        var storeNameNode : Node = DomSearchHelper.getNode(StoreFrontData.getInstance().NAME, requestNode.getChildNodes());
        if (storeNameNode != null) {
            var storeName : String = DomNodeHelper.getTextNodeValue(storeNameNode);
            if (storeName != null) {
                var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(storeName);
                this.transformInfoInterface = (cast new TransformInfoBasic(storeFrontInterface, this.hashMap, this.pageContext) : TransformInfoInterface);
                if (this.transformInfoInterface == null) {
                    throw new haxe.Exception("TransformInfo null");
                }
                var storeCategoryFactory : StoreCategoryFactory = new StoreCategoryFactory(this.transformInfoInterface);
                this.categoryLoaderInterface = CategoryLoaderFactory.getInstance(storeCategoryFactory);
            } else {
                throw new haxe.Exception("Store Name Error: " + storeName);
            }
        }
    }

    public function insert() : String {
        try {
            var success : String = "Successfully Added the following to the Category table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("inserting", this, "insert()");
            }
            this.categoryLoaderInterface.insert(this.categoryInterface, this.childCategoryInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add item to Category";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            var success : String = "Successfully Removed " + CategoryData.getInstance().NAME + "=" + this.childCategoryInterface.getPath();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Deleting", this, "delete()");
            }
            this.categoryLoaderInterface.delete(this.categoryInterface, this.childCategoryInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "delete()");
            }
            return success;
        } catch (e : haxe.Exception) {
            try {
                var error : String = "Failed to remove category: " + this.childCategoryInterface.getPath();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                    this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
                }
                return error;
            } catch (e2 : haxe.Exception) {
                var error : String = "Failed to remove category and show the path of the failed category";
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                    this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e2);
                }
                return error;
            }
        }
    }

    public function viewCategory() : String {
        try {
            var document : Document = new CategoryComponent(this.childCategoryInterface).toXmlDoc();
            var xmlString : String = XmlDocumentHelper.toString(document);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(xmlString, this, "viewCategory()");
            }
            return xmlString;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to get Category";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewCategory()", e);
            }
            return error;
        }
    }

    public function viewCategories() : String {
        try {
            var success : String = StringUtil.getInstance().EMPTY_STRING;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "viewCategories()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view Categories table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewCategories()", e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            var success : String = "New Item Successfully added";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add Item";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

}

