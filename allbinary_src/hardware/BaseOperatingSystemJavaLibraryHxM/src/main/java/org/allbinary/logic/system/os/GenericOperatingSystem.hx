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
package org.allbinary.logic.system.os;

import org.allbinary.logic.java.character.CharacterSet;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonSeps;

class GenericOperatingSystem implements OperatingSystemInterface {
    private final osName : String = null;
    private final osArch : String = null;
    private final osVersion : String = null;
    private final characterSet : CharacterSet = new CharacterSet();
    public var scalable : Bool = false;
    public function new() {
        final systemProperties : SystemProperties = SystemProperties.getInstance();
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        if (stringValidationUtil.isEmpty(systemProperties.getName())) {
            this.osName = EMPTY_STRING;
        } else {
            this.osName = systemProperties.getName();
        }
        if (stringValidationUtil.isEmpty(systemProperties.getArch())) {
            this.osArch = EMPTY_STRING;
        } else {
            this.osArch = systemProperties.getArch();
        }
        if (stringValidationUtil.isEmpty(systemProperties.getVersion())) {
            this.osVersion = EMPTY_STRING;
        } else {
            this.osVersion = systemProperties.getVersion();
        }
    }

    public function getName() : String {
        return this.osName;
    }

    public function getVersion() : String {
        return this.osVersion;
    }

    public function getArch() : String {
        return this.osArch;
    }

    public function getCharacterSet() : CharacterSet {
        return this.characterSet;
    }

    public function isOverScan() : Bool {
        return false;
    }

    public function getOverScanXPercent() : Int {
        return 100;
    }

    public function getOverScanYPercent() : Int {
        return 100;
    }

    public function isScalable() : Bool {
        return this.scalable;
    }

    public function isAutoHide() : Bool {
        return false;
    }

    public function toString() : String {
        final NEW_LINE : String = CommonSeps.getInstance().NEW_LINE;
        final osBuffer : StringMaker = new StringMaker();
        osBuffer.append("Operating System Info: \n");
        osBuffer.append(this.getName());
        osBuffer.append(NEW_LINE);
        osBuffer.append(this.getArch());
        osBuffer.append(NEW_LINE);
        osBuffer.append(this.getVersion());
        osBuffer.append(NEW_LINE);
        osBuffer.append(StringUtil.getInstance().toString(this.getCharacterSet()));
        osBuffer.append(NEW_LINE);
        return osBuffer.toString();
    }

}

