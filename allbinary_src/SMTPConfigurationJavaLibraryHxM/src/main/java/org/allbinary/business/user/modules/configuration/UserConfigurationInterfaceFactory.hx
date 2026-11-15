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
package org.allbinary.business.user.modules.configuration;

import org.allbinary.business.user.role.UserRole;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UserConfigurationInterfaceFactory {
    private static final configurationName : String = "DefaultUserConfiguration";
    public function new() {
    }

    // throws Exception
    public static function getInstance(document : Document) : UserConfigurationInterface {
        var configurationNode : Node = DomSearchHelper.getNode(UserConfigurationData.NAME, document.getChildNodes());
        return (cast new UserConfigurationView(configurationNode).getUserConfigurationInterface() : UserConfigurationInterface);
    }

    // throws Exception
    public static function getInstance(userRole : UserRole) : UserConfigurationInterface {
        var abPath : AbPath = new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().USERCONFIGURATIONPATH, UserConfigurationInterfaceFactory.configurationName + userRole.toString() + AbPathData.getInstance().EXTENSION_SEP + UserConfigurationData.UNCRYPTED_EXTENSION);
        var documentString : String = new CryptFileReader(UserConfigurationData.UNCRYPTED_EXTENSION, UserConfigurationData.ENCRYPTED_EXTENSION).get(abPath);
        var document : Document = DomDocumentHelper.create(documentString);
        return UserConfigurationInterfaceFactory.getInstance(document);
    }

    // throws Exception
    public static function getInstance() : UserConfigurationInterface {
        return new UserConfiguration();
    }

}

