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

import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class CategoryModifierTree extends CategoryPrivateTree implements CategoryModifierTreeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final directory : Directory = Directory.getInstance();
    public function new(categoryFactoryInterface : CategoryFactoryInterface) {
        super(categoryFactoryInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF(this.commonStrings.START, this, "CategoryModifierTree(CategoryFactoryInterface categoryFactoryInterface)");
        }
    }

    // synchronized
    public function insert(parentCategoryInterface : CategoryInterface, newChildCategoryInterface : CategoryInterface) : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                this.logUtil.putF("Inserting", this, "insert()");
            }
            if (parentCategoryInterface.isValid()) {
                parentCategoryInterface.addChild(newChildCategoryInterface);
                var directoryToBeCreatedAbPath : AbPath = new AbPath(Std.string(newChildCategoryInterface.getRootFilePath()) + Std.string(newChildCategoryInterface.getPath()), StringUtil.getInstance().EMPTY_STRING);
                this.directory.create(directoryToBeCreatedAbPath);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                    this.logUtil.putF("Saving", this, "insert()");
                }
                this.save(parentCategoryInterface);
                this.save(newChildCategoryInterface);
            } else {
                throw new haxe.Exception("Will Not Add Null Category");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "insert", e);
            }
        }
    }

    // synchronized
    public function delete(parentCategoryInterface : CategoryInterface, existingChildCategoryInterface : CategoryInterface) : Void {
        try {
            if (parentCategoryInterface.isValid()) {
                parentCategoryInterface.addChild(existingChildCategoryInterface);
                var directoryToBeDeletedAbPath : AbPath = new AbPath(Std.string(existingChildCategoryInterface.getRootFilePath()) + Std.string(existingChildCategoryInterface.getPath()), StringUtil.getInstance().EMPTY_STRING);
                this.delete(existingChildCategoryInterface);
                parentCategoryInterface.removeChild(existingChildCategoryInterface);
                this.save(parentCategoryInterface);
                this.directory.remove(directoryToBeDeletedAbPath);
            } else {
                throw new haxe.Exception("Will Not Add Null Category");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

}

