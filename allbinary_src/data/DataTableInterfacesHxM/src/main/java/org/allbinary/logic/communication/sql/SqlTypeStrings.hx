// Generated Code Do Not Modify
package org.allbinary.logic.communication.sql;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class SqlTypeStrings {
    private static final instance : SqlTypeStrings = new SqlTypeStrings();
    public static function getInstance() : SqlTypeStrings {
        return SqlTypeStrings.instance;
    }

    public final CHAR_COLUMN : String = "VARCHAR";
    public final INT_COLUMN : String = "VARCHAR";
    public final MAX_SIZE : String = "(255)";
    public final SIXTY_SIZE : String = "(60)";
    public final NOT_NULL : String = "NOT NULL";
    public final ONE_SIZE : String = "(1)";
    public final TWO_SIZE : String = "(2)";
    public final THREE_SIZE : String = "(3)";
    public final SIX_SIZE : String = "(6)";
    public final ELEVEN_SIZE : String = "(11)";
    public final TWELVE_SIZE : String = "(12)";
    public final ONE_KB_CHAR_COLUMN : String;
    public final MAX_CHAR_COLUMN : String;
    public final MAX_CHAR_COLUMN_NOT_NULL : String;
    public final SIXTY_CHAR_COLUMN_NOT_NULL : String;
    public final ONE_CHAR_COLUMN_NOT_NULL : String;
    public final SIX_CHAR_COLUMN_NOT_NULL : String;
    public final TWELVE_CHAR_COLUMN_NOT_NULL : String;
    public final TWO_INT_NOT_NULL : String = " INT(2) NOT NULL, ";
    public final THREE_INT_NOT_NULL : String = " INT(3) NOT NULL, ";
    public final FOUR_INT_NOT_NULL : String = " INT(4) NOT NULL, ";
    public final MAX_INT_NOT_NULL : String = " INT(11) NOT NULL, ";
    public final MAX_INT_UNSIGNED : String = " INT(11) UNSIGNED, ";
    public final MAX_INT_UNSIGNED_NOT_NULL : String = " INT(11) UNSIGNED NOT NULL, ";
    public final MAX_BIG_INT_NOT_NULL : String = " BIGINT(19) NOT NULL, ";
    public final MAX_BIG_INT_UNSIGNED : String = " BIGINT(19) UNSIGNED, ";
    public final MAX_BIG_INT_UNSIGNED_NOT_NULL : String = " BIGINT(19) UNSIGNED NOT NULL, ";
    public final MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL : String = " BIGINT(19) UNSIGNED AUTO_INCREMENT NOT NULL,";
    public final LONG_BLOB : String = " LONGBLOB, ";
    public final BLOB : String = " BLOB, ";
    public final BLOB_NOT_NULL : String = " BLOB NOT NULL, ";
    public function new() {
        this.ONE_KB_CHAR_COLUMN = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append("(1024)").append(CommonSeps.getInstance().COMMA_SEP));
        this.MAX_CHAR_COLUMN = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(MAX_SIZE).append(CommonSeps.getInstance().COMMA_SEP));
        this.MAX_CHAR_COLUMN_NOT_NULL = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(MAX_SIZE).append(CommonSeps.getInstance().SPACE).append(NOT_NULL).append(CommonSeps.getInstance().COMMA_SEP));
        this.SIXTY_CHAR_COLUMN_NOT_NULL = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(SIXTY_SIZE).append(NOT_NULL).append(CommonSeps.getInstance().COMMA_SEP));
        this.ONE_CHAR_COLUMN_NOT_NULL = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(ONE_SIZE).append(NOT_NULL).append(CommonSeps.getInstance().COMMA_SEP));
        this.SIX_CHAR_COLUMN_NOT_NULL = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(SIX_SIZE).append(NOT_NULL).append(CommonSeps.getInstance().COMMA_SEP));
        this.TWELVE_CHAR_COLUMN_NOT_NULL = Std.string(new StringMaker().append(CommonSeps.getInstance().SPACE).append(CHAR_COLUMN).append(this.TWELVE_SIZE).append(NOT_NULL).append(CommonSeps.getInstance().COMMA_SEP));
    }
}

