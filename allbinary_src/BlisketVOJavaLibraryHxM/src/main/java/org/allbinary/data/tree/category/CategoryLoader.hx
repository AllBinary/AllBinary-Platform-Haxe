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
package org.allbinary.data.tree.category;

import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.properties.CategoryProperties;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class CategoryLoader extends CategoryModifierTree implements CategoryLoaderInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(categoryFactoryInterface : CategoryFactoryInterface) {
        super(categoryFactoryInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(this.commonStrings.START, this, "CategoryLoader(CategoryFactoryInterface categoryFactoryInterface)");
        }
    }

    // synchronized
    public function getDoc(categoryInterface : CategoryInterface) : Document {
        try {
            if (categoryInterface.getProperties().getPath(categoryInterface.getHierarchy()) != null) {
                if (categoryInterface.getHierarchy().getLevel() == 1) {
                    var rootAbFile : AbFile = AbFile.createAbFileFromAbPath(categoryInterface.getRootFilePath());
                    if (!rootAbFile.isDirectory()) {
                        rootAbFile.mkdirs();
                        if (!rootAbFile.isDirectory()) {
                            throw new haxe.Exception("Could Not Create Directory");
                        }
                        this.save(categoryInterface);
                    }
                }
                var fileAbPath : AbPath = categoryInterface.getFilePath();
                var cryptFileReader : CryptFileReader = new CryptFileReader(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION);
                var document : Document = DomDocumentHelper.create(cryptFileReader.get(fileAbPath));
                return document;
            } else {
                throw new haxe.Exception("Null Category");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                try {
                    categoryInterface.log();
                } catch (e2 : haxe.Exception) {
                    this.logUtil.put("Could Not Log Category", this, "getDoc", e);
                }
                this.logUtil.put(this.commonStrings.FAILURE, this, "getDoc", e);
            }
            return null;
        }
    }

    // synchronized
    public function get(categoryInterface : CategoryInterface) : CategoryInterface {
        try {
            var document : Document = this.getDoc(categoryInterface);
            var categoryNode : Node = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document.getChildNodes());
            return this.addProperties(categoryInterface, categoryNode.getChildNodes());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    // synchronized
    public function get(document : Document) : CategoryInterface {
        try {
            var categoryNode : Node = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document.getChildNodes());
            var loadedCategoryInterface : CategoryInterface = this.categoryFactoryInterface.getRootInstanceFromNode(categoryNode);
            return this.addProperties(loadedCategoryInterface, categoryNode.getChildNodes());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    // synchronized
    public function getAll(categoryInterface : CategoryInterface) : CategoryInterface {
        try {
            var document : Document = this.getDoc(categoryInterface);
            return this.getAll(document);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    // synchronized
    private function getAll(document : Document) : CategoryInterface {
        try {
            var categoryNode : Node = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document.getChildNodes());
            var loadedCategoryInterface : CategoryInterface = this.categoryFactoryInterface.getRootInstanceFromNode(categoryNode);
            return this.addProperties(loadedCategoryInterface, categoryNode.getChildNodes());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    // synchronized
    private function getAll(parentCategoryInterface : CategoryInterface, categoryNodeList : NodeList) : CategoryInterface {
        try {
            if (categoryNodeList != null) {
                for (index in 0...categoryNodeList.getLength()) {
                    var categoryNode : Node = categoryNodeList.item(index);
                    if (categoryNode != null && categoryNode.getNodeName().compareTo(CategoryData.getInstance().NAME) == 0) {
                        var categoryInterface : CategoryInterface = (cast this.categoryFactoryInterface.getInstance(parentCategoryInterface.getHierarchy().getRoot(), parentCategoryInterface, categoryNode) : CategoryInterface);
                        parentCategoryInterface.addChild(categoryInterface);
                    }
                }
            }
            return parentCategoryInterface;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    // synchronized
    private function addProperties(loadedCategoryInterface : CategoryInterface, categoryNodeList : NodeList) : CategoryInterface {
        try {
            if (categoryNodeList != null) {
                for (index in 0...categoryNodeList.getLength()) {
                    var categoryNode : Node = categoryNodeList.item(index);
                    if (categoryNode != null && categoryNode.getNodeName().compareTo(CategoryData.getInstance().NAME) == 0) {
                        var categoryPropertiesInterface : CategoryPropertiesInterface = (cast new CategoryProperties(categoryNode) : CategoryPropertiesInterface);
                        loadedCategoryInterface.addChildProperty(categoryPropertiesInterface);
                    }
                }
            }
            return loadedCategoryInterface;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

}

