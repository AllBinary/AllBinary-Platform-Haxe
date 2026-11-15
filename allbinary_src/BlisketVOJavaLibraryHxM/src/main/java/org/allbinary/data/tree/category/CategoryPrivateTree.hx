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

import org.allbinary.business.category.CategoryComponent;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileWriter;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;

class CategoryPrivateTree {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var categoryFactoryInterface : CategoryFactoryInterface;
    public function new(categoryFactoryInterface : CategoryFactoryInterface) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, "CategoryPrivateTree(CategoryFactoryInterface categoryFactoryInterface)");
        }
        this.categoryFactoryInterface = categoryFactoryInterface;
    }

    // throws Exception
    // synchronized
    public function save(categoryInterface : CategoryInterface) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("Saving Category File: " + categoryInterface.getFilePath(), this, "save()");
        }
        var document : Document = new CategoryComponent(categoryInterface).toXmlDoc();
        var cryptFileWriter : CryptFileWriter = new CryptFileWriter(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION);
        cryptFileWriter.write(categoryInterface.getFilePath(), document);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("end", this, "save()");
        }
    }

    // throws Exception
    // synchronized
    public function delete(categoryInterface : CategoryInterface) : Void {
        if (categoryInterface.isLeaf()) {
            var categoryFile : AbFile = AbFile.createAbFileFromAbPath(categoryInterface.getFilePath());
            if (categoryFile.delete()) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF("Removed: " + categoryInterface.getFilePath(), this, "delete(CategoryInterface)");
                }
            }
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF("Not a leaf unable to remove", this, "delete(CategoryInterface)");
            }
        }
    }

}

