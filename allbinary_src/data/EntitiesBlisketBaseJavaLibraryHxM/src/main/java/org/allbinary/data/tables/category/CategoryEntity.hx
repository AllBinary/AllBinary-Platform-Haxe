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
package org.allbinary.data.tables.category;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.Category;
import org.allbinary.business.category.CategoryData;
import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.init.db.InventoryDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class CategoryEntity extends AbSqlBean implements CategoryEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "categories";
    public function new(categoryFactoryInterface : CategoryFactoryInterface) {
        super(new InventoryDbInitInfo());
        this.setTableName(this.tableName);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(new InventoryDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function insert(category : Category) : Void {
        try {
            var categoryVector : BasicArrayList = category.toVector();
            var values : BasicArrayList = new BasicArrayListD();
            values.add(categoryVector.get(0));
            values.add(categoryVector.get(1));
            super.insert(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, INSERT, e);
            }
        }
    }

    public function delete(value : String) : Void {
        try {
            super.deleteWhere(CategoryData.getInstance().NAME, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(CategoryData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(CategoryData.getInstance().LEVEL);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(CategoryData.getInstance().NAME);
        stringBuffer.append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(CategoryData.getInstance().NAME, (cast updatedValues.get(CategoryData.getInstance().NAME) : String), updatedValues);
    }

    public function dropTable() : String {
        return super.dropTable();
    }

    public override function insert(values : BasicArrayList) : Void {
        super.insert(values);
    }

}

