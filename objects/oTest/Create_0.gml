// Feather disable all

variable = 0;

array[ 0] = Ltxt("L@loc_key");
array[ 1] = LtxtConst("Constant value!");
array[ 2] = LtxtVar(self, "variable");
array[ 3] = LtxtFunc(function() { return date_datetime_string(date_current_datetime()); });
array[ 4] = LtxtConcat("a", "b", "c", "d");
array[ 5] = LtxtConcatExt(["e", "f", "g"]);
array[ 6] = LtxtJoin("-", "a", "b", "c", "d");
array[ 7] = LtxtJoinExt("-", ["e", "f", "g"]);
array[ 8] = LtxtParse("--> L@loc_key <--");
array[ 9] = Ltxt("L@loc_key").ReplaceAll("%1%", "(111)").ReplaceAll("%2%", "(222)");
array[10] = "L@loc_key";