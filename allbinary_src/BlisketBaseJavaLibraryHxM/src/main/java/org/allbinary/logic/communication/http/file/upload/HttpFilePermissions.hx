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
package org.allbinary.logic.communication.http.file.upload;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.role.BasicUserRoleFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.string.CommonStrings;

class HttpFilePermissions {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final file : AbFile;
    private final userRoles : BasicArrayList = new BasicArrayListD();
    public function new(fullPath : AbPath) {
        this.file = AbFile.createAbFileFromAbPath(new AbPath(fullPath.toFileSystemString(), FileUploadData.getInstance().FILE));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
            this.logUtil.putF("Loading Privileges: " + fullPath.toFileSystemString(), this, this.commonStrings.CONSTRUCTOR);
        }
        if (this.isFile()) {
            this.userRoles.add(BasicUserRoleFactory.getInstance().ADMINISTRATOR);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
            this.logUtil.putF("User Roles: " + this.userRoles, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function isFile() : Bool {
        return this.file.isFile();
    }

    public function getUserRoles() : BasicArrayList {
        return this.userRoles;
    }

}

