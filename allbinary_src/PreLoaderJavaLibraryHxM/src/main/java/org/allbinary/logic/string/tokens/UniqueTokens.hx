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
package org.allbinary.logic.string.tokens;

//import java.util.HashSet;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class UniqueTokens {
    private final specialCharacters : BasicArrayList = new BasicArrayListD();
    public function new() {
        this.specialCharacters.add("!");
        this.specialCharacters.add("@");
        this.specialCharacters.add(CommonPhoneStrings.getInstance().POUND);
        this.specialCharacters.add("$");
        this.specialCharacters.add("%");
        this.specialCharacters.add("^");
        this.specialCharacters.add(CommonSeps.getInstance().AMPERSAND);
        this.specialCharacters.add(CommonPhoneStrings.getInstance().STAR);
        this.specialCharacters.add("(");
        this.specialCharacters.add(")");
        this.specialCharacters.add("-");
        this.specialCharacters.add("_");
        this.specialCharacters.add("+");
        this.specialCharacters.add("=");
        this.specialCharacters.add("\\");
        this.specialCharacters.add("|");
        this.specialCharacters.add(AbPathData.getInstance().EXTENSION_SEP);
        this.specialCharacters.add(",");
        this.specialCharacters.add("<");
        this.specialCharacters.add(">");
        this.specialCharacters.add("?");
        this.specialCharacters.add("/");
        this.specialCharacters.add("~");
        this.specialCharacters.add("`");
    }

    // throws Exception
    public function getWhithoutDashesAndSkipNumberOnlyTokens(stringVector : BasicArrayList) : HashSet {
        try {
            var hashSet : HashSet = new HashSet();
            var index : Int = 0;
            var commonSeps : CommonSeps = CommonSeps.getInstance();
            while (index < stringVector.size()) {
                var keywords : String = (cast stringVector.get(index) : String);
                var tokenizer : Tokenizer = new Tokenizer(commonSeps.COMMA);
                var keywordVector : BasicArrayList = tokenizer.getTokensFromString(keywords, new BasicArrayListD());
                for (forIndex in 0...keywordVector.size()) {
                    var cleanString : String = (cast keywordVector.get(forIndex) : String);
                    cleanString = StringTools.trim(cleanString);
                    if (cleanString.indexOf("-".code) != -1) {
                        cleanString = new Replace("-", commonSeps.SPACE).all(cleanString);
                    }
                    hashSet.add(cleanString);
                    if (cleanString.indexOf(" ".code) != -1) {
                        var spaceTokenizer : Tokenizer = new Tokenizer(commonSeps.SPACE);
                        var subKeywordVector : BasicArrayList = spaceTokenizer.getTokensFromString(cleanString, new BasicArrayListD());
                        for (spaceIndex in 0...subKeywordVector.size()) {
                            var subCleanString : String = (cast subKeywordVector.get(spaceIndex) : String);
                            if (!isSpecialCharacter(subCleanString) && !numberOnly(subCleanString)) {
                                hashSet.add(subCleanString);
                            }
                        }
                    }
                }
                index++;
            }
            return hashSet;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    private function numberOnly(subCleaningString : String) : Bool {
        try {
            Std.parseInt(subCleaningString);
            return true;
        } catch (e : NumberFormatException) {
            return false;
        }
    }

    private function isSpecialCharacter(subCleaningString : String) : Bool {
        for (index in 0...this.specialCharacters.size()) {
            if (Reflect.compare(subCleaningString, (cast this.specialCharacters.get(index) : String)) == 0) {
                return true;
            }
        }
        return false;
    }

}

