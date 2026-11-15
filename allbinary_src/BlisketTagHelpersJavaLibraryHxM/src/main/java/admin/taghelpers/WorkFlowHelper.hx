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
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.installer.Portion;
import org.allbinary.data.tables.workflow.WorkFlowEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;

class WorkFlowHelper extends BasicTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final hashMap : HashMap;
    private final pageContext : PageContext;
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.hashMap = hashMap;
        this.pageContext = pageContext;
        this.portion = new Portion(hashMap);
    }

    public function drop() : String {
        try {
            return WorkFlowEntityFactory.getInstance().create2().dropTable();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop view info table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    public function create() : String {
        try {
            return WorkFlowEntityFactory.getInstance().create2().createTable();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create workflow table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    public function restore() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().restoreTable(WorkFlowEntityFactory.getInstance().create2(), this.portion);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "restore()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to restore backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "restore()", e);
            }
            return error;
        }
    }

    public function backup() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().backupTable(WorkFlowEntityFactory.getInstance().create2());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "backup()");
            }
            return result;
        } catch (e : haxe.Exception) {
            final error : String = "Failed to make backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "backup()", e);
            }
            return error;
        }
    }

}

