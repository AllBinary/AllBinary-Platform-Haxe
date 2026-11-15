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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.role.BasicUserRole;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.file.upload.HttpFilePermissions;
import org.allbinary.logic.communication.http.request.HttpRequestUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;

class AuthenticationHelperUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AuthenticationHelperUtil = new AuthenticationHelperUtil();
    public static function getInstance() : AuthenticationHelperUtil {
        return AuthenticationHelperUtil.instance;
    }

    // throws Exception
    public function isAuthorized(authenticationHelper : AuthenticationHelper, filePath : String) : Bool {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
            this.logUtil.putF(CommonLabels.getInstance().START + filePath, this, "isAuthorized()");
        }
        var endIndex : Int = HttpRequestUtil.getInstance().getLastSeparatorIndex(filePath);
        var fullPath : AbPath = new AbPath(URLGLOBALS.getWebappPath() + filePath.substring(0, endIndex), StringUtil.getInstance().EMPTY_STRING);
        var downloadFilePermissions : HttpFilePermissions = new HttpFilePermissions(fullPath);
        var userRoles : BasicArrayList = downloadFilePermissions.getUserRoles();
        var userRole : UserRole = authenticationHelper.getRole();
        var basicUserRole : BasicUserRole = userRole.getBasicUserRole();
        if (userRoles.contains(basicUserRole)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Authorized", this, "isAuthorized()");
            }
            return true;
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Not Authorized: " + Std.string(basicUserRole), this, "isAuthorized()");
            }
            return false;
        }
    }

    public function new() {
    }
}

