; 
; SQL mode
; 
(defun
    (SQL-mode
	(setq mode-string "SQL")
	(use-syntax-table "SQL")
	(use-local-map "SQL-map")
	(use-abbrev-table "SQL")
	(novalue)
    )
)

; 
; used by the SQL-console module which share all but the keymap
; 
(defun
    (SQL-console-mode
	(setq mode-string "SQL")
	(use-syntax-table "SQL")
	(use-abbrev-table "SQL")
	(novalue)
    )
)

(defun
    (~mode-modify-syntax-table
        ~type
        ~arg
        (setq ~type (arg 1))
        (setq ~arg 2)
        (while (<= ~arg (nargs))
            (modify-syntax-table ~type (arg ~arg))
            (setq ~arg (+ ~arg 1))
        )
    )
)

(save-window-excursion
    (temp-use-buffer "~SQL-hack")
    (use-syntax-table "SQL")
    (modify-syntax-table "paren" "(" ")")
    (modify-syntax-table "paren" "{" "}")
    (modify-syntax-table "paren" "[" "]")
    (modify-syntax-table "string" "\"")
    (modify-syntax-table "string" "'")
    (modify-syntax-table "word" "_")
    (modify-syntax-table "comment" "--" "\n")


    (~mode-modify-syntax-table "keyword-1,case-fold"
        "a" "abort" "abs"   "absolute"
        "access"    "action"    "ada"   "add"
        "admin" "after" "aggregate" "alias"
        "all"   "allocate"  "also"  "alter"
        "always"    "analyse"   "analyze"   "and"
        "any"   "are"   "array" "as"
        "asc"   "asensitive"    "assertion" "assignment"
        "asymmetric"    "at"    "atomic"    "attribute"
        "attributes"    "authorization" "avg"   "backward"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "before"    "begin" "bernoulli" "between"
        "binary"    "bit"   "bitvar"
        "bit_length"    "blob"   "both"
        "breadth"   "by"    "c" "cache"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "call"  "called"    "cardinality"   "cascade"
        "cascaded"  "case"  "cast"  "catalog"
        "catalog_name"  "ceil"  "ceiling"   "chain"
        "char"  "character" "characteristics"   "characters"
        "character_length"  "character_set_catalog" "character_set_name"    "character_set_schema"
        "char_length"   "check" "checked"   "checkpoint"
        "class" "class_origin"  "clob"  "close"
        "cluster"   "coalesce"  "cobol" "collate"
        "collation" "collation_catalog" "collation_name"    "collation_schema"
        "collect"   "column"    "column_name"   "command_function"
        "command_function_code" "comment"   "commit"    "committed"
        "completion"    "concurrently"  "condition" "condition_number"
        "connect"   "connection"    "connection_name"   "constraint"
        "constraints"   "constraint_catalog"    "constraint_name"   "constraint_schema"
        "constructor"   "contains"  "continue"  "conversion"
        "convert"   "copy"  "corr"  "corresponding"
        "count" "covar_pop" "covar_samp"    "create"
        "createdb"  "createrole"    "createuser"    "cross"
        "csv"   "cube"  "cume_dist" "current"
        "current_date"  "current_default_transform_group"   "current_path"  "current_role"
        "current_time"  "current_timestamp" 
    )
;"current_transform_group_for_type"
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "current_user"
        "cursor"    "cursor_name"   "cycle" "data"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "database"  "date"  "datetime_interval_code"    "datetime_interval_precision"
        "day"   "deallocate"    "dec"   "decimal"
        "declare"   "default"   "defaults"  "deferrable"
        "deferred"  "defined"   "definer"   "degree"
        "delete"    "delimiter" "delimiters"    "dense_rank"
        "depth" "deref" "derived"   "desc"
        "describe"  "descriptor"    "destroy"   "destructor"
        "deterministic" "diagnostics"   "dictionary"    "disable"
        "disconnect"    "dispatch"  "distinct"  "do"
        "domain"    "double"    "drop"  "dynamic"
        "dynamic_function"  "dynamic_function_code" "each"  "element"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "else"  "elsif" "enable"    "encoding"  "encrypted"
        "end"   "end-exec"  "equals"    "escape"
        "every" "except"    "exception" "exclude"
        "excluding" "exclusive" "exec"  "execute"
        "existing"  "exists"    "exp"   "explain"
        "external"  "extract"   "false" "fetch"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "filter"    "final" "first" "float"
        "floor" "following" "for"   "force"
        "foreign"   "fortran"   "forward"   "found"
        "free"  "freeze"    "from"  "full"
        "function"  "fusion"    "g" "general"
        "generated" "get"   "global"    "go"
        "goto"  "grant" "granted"   "greatest"
        "group" "grouping"  "handler"   "having"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "header"    "hierarchy" "hold"  "host"
        "hour"  "identity"  "if"    "ignore"
        "ilike" "immediate" "immutable" "implementation"
        "implicit"  "in"    "including" "increment"
        "index" "indexes"   "indicator" "infix"
        "inherit"   "inherits"  "initialize"    "initially"
        "inner" "inout" "input" "insensitive"
        "insert"    "instance"  "instantiable"  "instead"
        "int"    "intersect" "intersection"
        "into"  "invoker"   "is"
        "isnull"    "isolation" "iterate"   "join"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "k" "key"   "key_member"    "key_type"
        "lancompiler"   "language"  "large" "last"
        "lateral"   "leading"   "least" "left"
        "length"    "less"  "level" "like"
        "limit" "listen"    "ln"    "load" "loop"
        "local" "localtime" "localtimestamp"    "location"
        "locator"   "lock"  "login" "lower"
        "m" "map"   "match" "matched"
        "max"   "maxvalue"  "member"    "merge"
        "message_length"    "message_octet_length"  "message_text"  "method"
        "min"   "minute"    "minvalue"  "mod"
        "mode"  "modifies"  "modify"    "module"
        "month" "more"  "move"  "multiset"
        "mumps" "name"  "names" "national"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "natural"   "nchar" "nclob" "nesting"
        "new"   "next"  "no"    "nocreatedb"
        "nocreaterole"  "nocreateuser"  "noinherit" "nologin"
        "none"  "normalize" "normalized"    "nosuperuser"
        "not"   "nothing"   "notify"    "notnull"
        "nowait"  "nullable"  "nullif"
        "nulls" "number"    "numeric"   "object"
        "octets"    "octet_length"  "of"    "off"
        "offset"    "oids"  "old"   "on"
        "only"  "open"  "operation" "operator"
        "option"    "options"   "or"    "order"
        "ordering"  "ordinality"    "others"    "out"
        "outer" "output"    "over"  "overlaps"
        "overlay"   "overriding"    "owned" "owner"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "pad"   "parameter" "parameters"    "parameter_mode"
        "parameter_name"    "parameter_ordinal_position"    "parameter_specific_catalog"    "parameter_specific_name"
        "parameter_specific_schema" "partial"   "partition" "pascal"
        "password"  "path"  "percentile_cont"   "percentile_disc"
        "percent_rank"  "placing"   "pli"   "position"
        "postfix"   "power" "preceding" "precision"
        "prefix"    "preorder"  "prepare"   "prepared"
        "preserve"  "primary"   "prior" "privileges"
        "procedural"    "procedure" "public"    "quote"
        "perform"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "range" "raise" "rank"  "read"  "reads"
        "reassign"  "recheck"   "recursive"
        "ref"   "references"    "referencing"   "regr_avgx"
        "regr_avgy" "regr_count"    "regr_intercept"    "regr_r2"
        "regr_slope"    "regr_sxx"  "regr_sxy"  "regr_syy"
        "reindex"   "relative"  "release"   "rename"
        "repeatable"    "replace"   "reset" "restart"
        "restrict"  "result"    "return"    "returned_cardinality"
        "returned_length"   "returned_octet_length" "returned_sqlstate" "returning"
        "returns"   "revoke"    "right" "role"
        "rollback"  "rollup"    "routine"   "routine_catalog"
        "routine_name"  "routine_schema"    "row"   "rows"
        "row_count" "row_number"    "rule"  "savepoint"
    (~mode-modify-syntax-table "keyword-1,case-fold"
    )
        "scale" "schema"    "schema_name"   "scope"
        "scope_catalog" "scope_name"    "scope_schema"  "scroll"
        "search"    "second"    "section"   "security"
        "select"    "self"  "sensitive" "sequence"
        "serializable"  "server_name"   "session"   "session_user"
        "set"   "setof" "sets"  "share"
        "show"  "similar"   "simple"    "size"
        "smallint"  "some"  "source"    "space"
        "specific"  "specifictype"  "specific_name" "sql"
        "sqlcode"   "sqlerror"  "sqlexception"  "sqlstate"
        "sqlwarning"    "sqrt"  "stable"    "start"
        "state" "statement" "static"    "statistics"
        "stddev_pop"    "stddev_samp"   "stdin" "stdout"
        "storage"   "strict"    "structure" "style"
        "subclass_origin"   "sublist"   "submultiset"   "substring"
        "sum"   "superuser" "symmetric" "sysid"
        "system"    "system_user"   "table" "tablesample"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "tablespace"    "table_name"    "temp"  "template"
        "temporary" "terminate" "than"  "then"
        "ties"  "timezone_hour"
        "timezone_minute"   "to"    "top_level_count"   "trailing"
        "transaction"   "transactions_committed"    "transactions_rolled_back"  "transaction_active"
        "transform" "transforms"    "translate" "translation"
        "treat" "trigger"   "trigger_catalog"   "trigger_name"
        "trigger_schema"    "trim"  "true"  "truncate"
        "trusted"   "type"  "uescape"   "unbounded"
        "uncommitted"   "under" "unencrypted"   "union"
        "unique"    "unknown"   "unlisten"  "unnamed"
        "unnest"    "until" "update"    "upper"
        "usage" "user"  "user_defined_type_catalog" "user_defined_type_code"
        "user_defined_type_name"    "user_defined_type_schema"  "using" "vacuum"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "valid" "validator" "value" "values"
        "varchar"   "variable"  "varying"   "var_pop"
        "var_samp"  "verbose"   "view"  "volatile"
        "when"  "whenever"  "where" "width_bucket"
        "window"    "with"  "within"    "without"
        "work"  "write" "year"
    )
    (~mode-modify-syntax-table "keyword-2,case-fold"
        "text" "integer" "bigint"
        "null" "bytea"   "boolean"
        "serial" "interval" "timestamp" "time" "zone"
        "real" "record" "rowtype"
    )
    (~mode-modify-syntax-table "keyword-1,case-fold"
        "notice" "info" "warning"
    )
    (define-keymap "SQL-map")
    (define-keymap "SQL-ESC-map")
    (use-local-map "SQL-map")
    (local-bind-to-key "SQL-ESC-map" "\e")
    (error-occurred (execute-mlisp-file "sql-mode.key"))
    (kill-buffer "~SQL-hack")
)
(novalue)
