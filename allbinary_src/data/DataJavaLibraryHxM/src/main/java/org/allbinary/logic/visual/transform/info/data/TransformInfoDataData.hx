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
package org.allbinary.logic.visual.transform.info.data;

import org.allbinary.logic.io.file.CommonDataFileStrings;

class TransformInfoDataData {
    private static final instance : TransformInfoDataData = new TransformInfoDataData();
    public static function getInstance() : TransformInfoDataData {
        return TransformInfoDataData.instance;
    }

    public function new() {
    }

    public final UNCRYPTED_EXTENSION : String = CommonDataFileStrings.getInstance().UNCRYPTED_EXTENSION;
    public final ENCRYPTED_EXTENSION : String = CommonDataFileStrings.getInstance().ENCRYPTED_EXTENSION;
}

