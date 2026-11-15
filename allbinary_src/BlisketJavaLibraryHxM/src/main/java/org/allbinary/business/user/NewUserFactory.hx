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
package org.allbinary.business.user;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.modules.User;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

class NewUserFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance() : UserInterface {
        return new User();
    }

    // throws Exception
    public static function getInstance(transformInfoInterface : TransformInfoInterface) : UserInterface {
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
        var httpServletRequest : HttpServletRequest = (cast httpTransformInfoInterface.getPageContext().getRequest() : HttpServletRequest);
        var hashMap : HashMap = new RequestParams(httpServletRequest).toHashMap();
        var role : String = (cast httpTransformInfoInterface.getPropertiesHashMap().get(Std.string(UserRoleData.NAME)) : String);
        hashMap.put(Std.string(UserRoleData.NAME), role);
        return CreateUserFactory.getInstance(hashMap);
    }

    // throws Exception
    public static function getInstance(httpServletRequest : HttpServletRequest, propertiesHashMap : HashMap) : UserInterface {
        if (propertiesHashMap != null) {
            var requestHashMap : HashMap = new RequestParams(httpServletRequest).toHashMap();
            var roleString : String = (cast propertiesHashMap.get(Std.string(UserRoleData.NAME)) : String);
            requestHashMap.put(Std.string(UserRoleData.NAME), roleString);
            return CreateUserFactory.getInstance(requestHashMap);
        } else {
            throw new haxe.Exception("Null HashMap");
        }
    }

}

